package {
    import flash.display.Sprite;

    public class Test_Logic extends Sprite{
        public function Test_Logic() {
            var n:Number = 2;

            var _null:int = null;

            var k:int = 0;
            trace(k);
            k ||= 1;//only if was false before
            trace(k);
            k ||= 2;
            trace(k);
    
            var z:int = 100;
            trace(z);
            z &&= 1;//only if was true before
            trace(z);
            z &&= 2;
            trace(z);

            var a:Number = 2;
            var b:Number = 4;

            if((a & b) >= 1 ){
                trace("first");
            }

//            trace("*****some magic******")
//            k = 0
//            for (var i = 0; i<30; i++)
//            {
//                k |= i;
//                trace(k)
//            }

        }
    }
}
