package {
    import flash.display.Sprite;

    public class Test_Constructor2 extends Sprite{
        public function Test_Constructor2(hiddenObject:*) {
            trace("OUT",hiddenObject, hiddenObject.constructor)
            var _class:Class = hiddenObject.constructor;
            var _classString:String = _class.toString();
            var _typeString:String = hiddenObject.toString();

            var newHiddenObject:* = new _class("new Instanse of HiddenClass!",4,5,6); // =)

            if(_typeString == "[object HiddenClass]")
                trace(5);
            if(_classString == "[class HiddenClass]")
                trace(6);
//            if(_class == HiddenClass)
//                trace(7);
//            if(hiddenObject is HiddenClass)
//                trace(8);
        }
    }
}
