package {
    import flash.display.Sprite;

    public class Test_Logic extends Sprite{
        public function Test_Logic() {
            var n:Number = 2;

            var _null:int = null;

            var k:int = 0;
            trace(k)
            k ||= 1;
            trace(k)
            k ||= 2;
            trace(k)


//            trace("***********")
//            k = 0
//            for (var i = 0; i<30; i++)
//            {
//                k |= i;
//                trace(k)
//            }

        }
    }
}