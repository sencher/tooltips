package {
    import flash.display.Sprite;

    public class Test_Args extends Sprite{
        public function Test_Args() {
            func(1,2,"asd");
        }

        private function func(i:int, i2:int, s:String):void {
            trace(arguments);
        }
    }
}
