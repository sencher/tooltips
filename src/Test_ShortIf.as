package {
    import flash.display.Sprite;

    public class Test_ShortIf extends Sprite{
        private var b:Boolean = true;
        private var FIELD_LIMIT:int = 7;
        private var FIELD_START:int = 3;
        private var field_counter :int = 0;

        public function Test_ShortIf() {


            var c:int = 0;
            b? c = 1 : c = 2;
            trace(b, c);

            var a:int = 4;
            a = b ? 3 : 1;
            trace(a);

            var d:int = 4;
            d == 4 ? d++ : d--;
            trace(d);

            for(var i=0;i<10;i++){
                trace(i, validate(i), field_counter);
            }

        }

        private function validate(i:int):Boolean {
//            return (b > 0 ? true : false);
//            return (field_counter < FIELD_LIMIT ? ++field_counter :  false);
            return (i >= FIELD_START && i < FIELD_LIMIT && ++field_counter);
        }
    }
}
