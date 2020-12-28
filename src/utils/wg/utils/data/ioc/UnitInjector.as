package utils.wg.utils.data.ioc {
import flash.utils.describeType;
import flash.utils.getQualifiedClassName;

public class UnitInjector implements IUnitInjector {
    private var _interfaceClass:Class;
    private var _sourceRoot:Object;
    private var _target:Object;
    
    public function UnitInjector(interfaceClass:Class = null, source:Object = null) {
//			Cc.logchw(this, "UnitInjector", arguments);
        fill(interfaceClass, source);
    }
    
    /**
     * Этот метод заполняет инжектор данными которые должны быть инжектированны в последствии методом inject
     * @param interfaceClass - интерфейс который должен реализовыватся классом-целью инжектора
     * @param source - бьект-источник данные из которого будут иджектится в обьект-цель
     */
    public function fill(interfaceClass:Class, source:Object):void {
//			Cc.logchw(this, "fill", arguments);
        _interfaceClass = interfaceClass;
        _sourceRoot = source;
    }
    
    /**
     * Этот метод инжектирует данные из источника _sourceRoot в обьект-цель target
     * @param target - Обьект-цель куда инжектируются данные
     */
    public function inject(target:Object):void {
//			Cc.logchw(this, "inject", arguments);
        _target = target;
        if (!target) {
            throw Error("::Injection is not possible, there is no target object !'");
        }
        // * Если все данные правильно приинициализированны то запускаем рекурентную инжекцию
        injectRecurrent(target, _sourceRoot);
    }
    
    /**
     * Этот метод инжектирует данные из источника source в обьект-цель target
     * @param target - Обьект-цель куда инжектируются данные
     * @param source - Обьект ресурс источник данных
     */
    protected function injectRecurrent(target:Object, source:Object = null):void {
//			Cc.logchw(this, "injectRecurrent", arguments);
        var prop:String;
        var xmlSource:XML = describeType(source);
//			Cc.logchw(this, "xmlSource", xmlSource);
        var variables:XMLList = xmlSource.variable;
        var accessors:XMLList = xmlSource.accessor;
        if (variables.length() + accessors.length() > 0) {
            var newSource:Object = {};
            
            //	копируем динамические свойства источника данных в объект-цель
            for (prop in source) {
                newSource[prop] = source[prop];
            }
            
            //	копируем статические свойства источника даннынх в объект-цель, если уже существует такое динамическое свойство, то оно перезаписывается
            
            //	обычные паблик свойства
            for each(var variable:XML in variables) {
                newSource[variable.@name] = source[variable.@name];
            }
            
            //	сеттеры и геттеры
            for each(var accessor:XML in accessors) {
                if (accessor && accessor.@type && accessor.@name && accessor.@access && accessor.parameter && accessor.parameter.length() <= 0 && (accessor.@access == "readwrite" || accessor.@access == "readonly")) {
                    newSource[accessor.@name] = source[accessor.@name];
                }
            }
            
            source = newSource;
//				Cc.logchw(this, "newSource", newSource);
        }
        
        for (prop in source) {
//				Cc.logchw(this, "prop", prop);
            // * Если у обьекта-цели реализованна функция или проперти куда надо инжектить
            if (target.hasOwnProperty(prop)) {
//					Cc.logchw(this, 1);
                // * Если данные инжектятся в подобьект
                if (typeof (target[prop]) == "object") {
//						Cc.logchw(this, 11);
                    //trace(":::::::INJECT: sub-object "+getQualifiedClassName(prop)+"");
                    // * Если проперти сложного типа и в него инжектится такойже тип то просто приравнивает иначе инжектим по полям и функциям
                    if (target[prop] == null || getQualifiedClassName(target[prop]) == getQualifiedClassName(source[prop])) {
//							Cc.logchw(this, 111);
                        try {
//								Cc.logchw(this, 1111);
                            target[prop] = source[prop];
                        } catch (e:Error) {
//								Cc.logchw(this, 1112);
                            //trace("[ERROR]:::::::INJECT: Cant convert object "+target[prop]+" to "+source[prop]);
                        }
                    } else {
//							Cc.logchw(this, 112);
                        injectRecurrent(target[prop], source[prop] as Object);
                    }
                }
                // * Если данные инжектятся в функцию
                else if (target[prop] is Function) {
//						Cc.logchw(this, 12);
                    var func:Function = (target[prop] as Function);
                    
                    //	не использовать func.length - иногда падает клиент!
                    var argLength:int = getMethodArgumentCount(target, prop);
                    
                    // * Если у функции нет входных параметров то она просто вызывается
                    if (argLength == 0) {
//							Cc.logchw(this, 121);
                        //trace(":::::::INJECT: call function "+prop+"()");
                        func.call();
                    }
                    // * Если у функции один любой параметр в том числе и масив то она вызовется с эти параметром
                    else if (argLength == 1) {
//							Cc.logchw(this, 122);
                        //trace(":::::::INJECT: call function "+prop+"("+getQualifiedClassName(source[prop])+"("+((source[prop] is String)?"\""+source[prop]+"\"":source[prop])+"))");
                        func(source[prop])
                    }
                    // * Если у функции множество параметров то масив находящийся в _source[prop] воспринимается как список параметров
                    else if (argLength > 1) {
//							Cc.logchw(this, 123);
//							var traceData:Array = [];
//							for each(var obj:Object in source[prop]) {
//								Cc.logchw(this, 1231);
//								traceData.push(getQualifiedClassName(obj) + "(" + ((obj is String) ? "\"" + obj + "\"" : obj) + ")");
//							}
                        //trace(":::::::INJECT: call function "+prop+"(" + traceData.join(", ") + ")");
                        func.apply(null, source[prop])
                    }
                } else // * Если данные инжектятся в свойство обьекта
                {
//						Cc.logchw(this, 13);
                    //trace(":::::::INJECT: set property "+prop+": "+getQualifiedClassName(source[prop])+" = "+((source[prop] is String)?"\""+source[prop]+"\"":source[prop]))
                    target[prop] = source[prop];
                }
            } else {
//					Cc.logchw(this, 2);
                //trace("[ERROR]:::::::INJECT: Property or function '" + prop + "' does not exist !");
            }
        }
    }
    
    public function get targetClass():Class {
        return _interfaceClass;
    }
    
    public function get target():Object {
        return _target;
    }
}
}
