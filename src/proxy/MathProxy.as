package proxy
{
    import proxy.IMath;
    import proxy.MathSubject;

    public class MathProxy implements IMath
    {
        private var math : MathSubject;

        public function MathProxy()
        {
            math = new MathSubject();
        }

        public function add(a : Number, b : Number) : Number
        {
            return math.add(a, b);
        }

        public function sub(a : Number, b : Number) : Number
        {
            return math.sub(a, b);
        }

        public function mul(a : Number, b : Number) : Number
        {
            return math.mul(a, b);
        }

        public function div(a : Number, b : Number) : Number
        {
            if (b != 0)
                return math.div(a, b);
            else
            {
                trace("Division by zero.");
                return Number.POSITIVE_INFINITY;
            }
        }
    }
}