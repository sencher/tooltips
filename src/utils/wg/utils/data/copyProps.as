package utils.wg.utils.data
{
    import flash.utils.describeType;
    
    /**
     * создает динамический объект и копирует в него все динамические и статические свойства из source
     * @param    source
     * @return
     */
    public function copyProps(source:Object, skipAccessors:Boolean = false):Object
    {
        var props:Array = [];
        
        //	извлекаем сначала динамические свойства
        for (var s:String in source) {
            props[props.length] = s;
        }
        
        //	статические свойства класса
        var xmlSource:XML = describeType(source);
        var variables:XMLList = xmlSource.variable;
        var accessors:XMLList = xmlSource.accessor;
        //	обычные паблик свойства
        for each(var variable:XML in variables) {
            props[props.length] = variable.@name;
        }
        
        
        if(!skipAccessors){
            //	сеттеры и геттеры
            for each(var accessor:XML in accessors) {
                if (accessor && accessor.@type && accessor.@name && accessor.@access && accessor.parameter && accessor.parameter.length() <= 0 && (accessor.@access == "readwrite" || accessor.@access == "readonly")) {
                    props[props.length] = accessor.@name;
                }
            }
        }
        
        //	копируем свойства
        var result:Object = {};
        for each(var prop:String in props) {
            result[prop] = source[prop];
        }
        
        return result;
    }
    
}