package {
    import flash.display.Sprite;

    public class Test_Namespace2b extends Sprite{

        public namespace company = "http://www.example.com/company";
        public namespace individual = "http://www.example.com/individual";

        company var value:int = 10;
        individual var value:int = 2;

        public function Test_Namespace2b(){
            company::showValue(); // traces 10
            individual::showValue(); // traces 2
        }

        company function showValue() {
            trace(company::value);
        }

        individual function showValue() {
            trace(individual::value);
        }
    }
}