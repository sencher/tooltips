package composition {
    public class A implements BInterface, CInterface{
        private var $bObject:B;

        private var $cObject:C;
        
        public function A() {
            $bObject = new B();
            $cObject = new C();
        }

        public function printStrong($text) {
            $bObject.printStrong($text);
        }

        public function printItalic($text) {
            $cObject.printItalic($text);
        }
    }
}
