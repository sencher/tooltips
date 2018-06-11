package {
    import flash.display.Sprite;
    import flash.net.registerClassAlias;
    import flash.utils.ByteArray;

    import folder.CustomClassVO;

    import folder.DataObject;

    import folder.First;

    import mx.utils.ObjectUtil;

import utils.GamuaFloxUtils;

import utils.UtilFunctions;
    import utils.Utils;

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

            var cc1:CustomClassVO = new CustomClassVO("asd",{fuck:"you"}, [0,1,{two:true},"drei"]);
            trace(cc1.variableName)
            var cc2:CustomClassVO = cloneByteArray(cc1);
            trace(1,"addxx",{},cc2.variableName);

            var cc3:CustomClassVO = CustomClassVO(ObjectUtil.clone(cc1));
            trace(cc3.variableName);

            var cc4:CustomClassVO = Utils.clone(cc1);
            trace(cc4.variableName);

            var cc5:CustomClassVO = GamuaFloxUtils.cloneObject(cc1, 5);
            trace(cc5.variableName);

            cc5.variableName = "second!";
            cc5.array[0] = 333;
            cc5.array[2].two = false;

            trace(cc1.variableName, cc2.variableName, cc3.variableName, cc4.variableName, cc5.variableName);

            trace(cc3.array[0], cc2.array[0], cc3.array[0], cc4.array[0], cc5.array[0]);

            trace(cc1.array[2].two, cc2.array[2].two, cc3.array[2].two, cc4.array[2].two, cc5.array[2].two);

            //recursion test
            var rec:Object = {};
            var paramA:Object = {};
            var paramB:Object = {};

            paramA.name = "A";
            paramA.linkB = paramB;
            paramB.name = "B";
            paramB.linkA = paramA;

            rec.name = "first";
            rec.array = [1,2,8];
            rec.array2 = [27,2,2,[33,[44]]];
            rec.height = 12;
            rec.values = {zz:"top", yy:"bot"};
            rec.hellStart = paramA;

            var rec5 = GamuaFloxUtils.cloneObject(rec, 5);
            trace(rec5.name);
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
