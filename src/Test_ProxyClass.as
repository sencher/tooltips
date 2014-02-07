package {
    import flash.display.Sprite;

    import proxy.IMath;

    import proxy.MathProxy;

    import proxy.MathSubject;

    public class Test_ProxyClass extends Sprite
    {
        public function Test_ProxyClass()
        {
            playWithMath(new MathSubject());
            playWithMath(new MathProxy());
        }

        public function playWithMath(math : IMath) : void
        {
            trace(math.add(5, 0));
            trace(math.sub(5, 0));
            trace(math.mul(5, 0));
            trace(math.div(5, 0));
        }
    }
}