package composition {
    public class C implements CInterface{
        public function C() {
        }

        public function printItalic($text) {
            trace("italicText", $text);
        }
    }
}
