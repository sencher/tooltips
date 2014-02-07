package proxy
{
    import proxy.IMath;

    public class MathSubject implements IMath
    {
        public function add(a : Number, b : Number) : Number
        {
            return a + b;
        }

        public function sub(a : Number, b : Number) : Number
        {
            return a - b;
        }

        public function mul(a : Number, b : Number) : Number
        {
            return a * b;
        }

        public function div(a : Number, b : Number) : Number
        {
            return a / b;
        }
    }
}