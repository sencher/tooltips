package {
    import flash.display.Sprite;
    import flash.net.registerClassAlias;
    import flash.utils.ByteArray;

    import folder.CustomClassVO;

    import folder.DataObject;

    import folder.First;

    import mx.utils.ObjectUtil;

    import utils.UtilFunctions;

    public class Test_Clone extends Sprite {

        private var source:DataObject = new DataObject();
        private var cloneObject:DataObject;

        public function Test_Clone() {
            registerClassAlias("com.client.vo.CustomClassVO", CustomClassVO);
            registerClassAlias("First", First);

            var a:First = new First(7, 9);
            a.SomeFunc();
            var b:First = First(UtilFunctions.cloneDescribeType(a));
            b.SomeFunc();
            var c:First = clone(a);
            c.SomeFunc();
            var d:* = cloneByteArray(a);
            try{d.SomeFunc();}catch (e:Error){trace("Что-то пошло не так!")}
            var e:* = ObjectUtil.copy(a);
            try{e.SomeFunc();}catch (e:Error){trace("Что-то пошло не так!")}

            source.name = 'John Doe';
            source.howMany = 4.5;
            source.when = new Date(0);
            source.complexProp = new DataObject();
            source.complexProp.name = 'Name in sub-object';

            cloneObject = UtilFunctions.cloneDescribeType(source) as DataObject;

//            trace("Clone:\nname = " + cloneObject.name + "\nhowMany = " + cloneObject.howMany + "\nwhen = " + cloneObject.when + "\ncomplexProp.name = " + cloneObject.complexProp.name);

            var cc1:CustomClassVO = new CustomClassVO("asd",{fuck:"you"});
            trace(cc1.variableName)
            var cc2:CustomClassVO = cloneByteArray(cc1);
            trace(1,"addxx",{},cc2.variableName);

            var cc3:CustomClassVO = CustomClassVO(ObjectUtil.clone(cc1));
            trace(cc3.variableName);

        }

        private function tryTrace(...args):void
        {
            var s:String = "";
            for each (var p:* in args){
                s += p + ", ";
            }
            trace(s);
        }

        private function clone(source:*):* {
            var _class:Class = source.constructor;
            var result:* = new _class();
            for (var field:* in source) {
                result[field] = source[field];
            }
            return result;
        }

        function cloneByteArray( source:Object ):*
        {
            var myBA:ByteArray = new ByteArray();
            myBA.writeObject( source );
            myBA.position = 0;
            return( myBA.readObject() );
        }

    }
}
