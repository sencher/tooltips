package {
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.utils.describeType;

    public class Test_ProxyInjection extends Sprite{
        public function Test_ProxyInjection() {
            var p:Proxy = new Proxy();
            p.x = 50;
            var xml:XML = describeType(p);
            trace(xml);

        }
    }
}

import flash.display.MovieClip;

internal class Proxy extends MovieClip{

    override public function set x(value:Number):void {
        trace(value);
        super.x = value;
    }

}
