package {
    import composition.A;

    import flash.display.Sprite;

    public class Test_Composition extends Sprite{
        public function Test_Composition() {
            //http://dlart.ru/nasledovanie-i-kompozitsiya
            var a:A = new A();
            a.printStrong("1");
            a.printItalic("2");
        }
    }
}
