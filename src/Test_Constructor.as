package {
    import flash.display.Sprite;

    public class Test_Constructor extends Sprite{
        public function Test_Constructor() {
            var hiddenObject:* = new HiddenClass("sdsda",1,2,3);
            var _class:Class = hiddenObject.constructor;
            var _classString:String = _class.toString();
            var _typeString:String = hiddenObject.toString();

            if(_typeString == "[object HiddenClass]")
                trace(5);
            if(_classString == "[class HiddenClass]")
                trace(6);
            if(hiddenObject.constructor == HiddenClass)
                trace(7);
            if(hiddenObject is HiddenClass)
                trace(8);

//            switch (_typeString){
//                case "HiddenClass$":
//                    trace(1);
//                    break;
//                case "HiddenClass":
//                    trace(2);
//                    break;
//                case "class HiddenClass":
//                    trace(3);
//                    break;
//                case "object HiddenClass":
//                    trace(4);
//                    break;
//                case "[object HiddenClass]":
//                    trace(5);
//                    break;
//                case "[class HiddenClass]":
//                    trace(6);
//                    break;
//            }
            new Test_Constructor2(hiddenObject);
        }
    }
}

class HiddenClass {

    static private var flareModelRegExp:RegExp = /\.zf3d/;
    static private var modelWithProxyRegExp:RegExp = /\/trees\/.*_(3|4|5|6)\.zf3d/;

    public var x:Number;
    public var y:Number;
    public var z:Number;

    public var url:String;

    public var isBackground:Boolean = false;

    public function HiddenClass(url:String, x:Number, y:Number, z:Number) {

        this.url = url.match(modelWithProxyRegExp) ? url.replace(flareModelRegExp, '_lock.zf3d') : url;

        this.x = x;
        this.y = y;
        this.z = z;
    }
}
