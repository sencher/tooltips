package {
    import flash.display.Sprite;

    public class Test_Int extends Sprite{
        public function Test_Int() {
            var s:String = "123"
            var i:int = int(s);
            trace(i)
            
            var condition:Boolean = false;
            i = condition ? 77 : null;
            trace(i);
        }
    }
}
