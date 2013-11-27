package {
    import flash.display.Sprite;

    public class Test_Constructor extends Sprite{
        public function Test_Constructor() {
            var s:* = new Source("sdsda",1,2,3);
            trace(s, s.constructor)
            var c:* = s.constructor;
            trace(String(s))
            trace(String(s.constructor))
            if(String(s) == "Source$")
                trace(1)
            else if(String(s) == "Source")
                trace(2)
            else if(String(s) == "class Source")
                trace(3)
            else if(String(s) == "object Source")
                trace(4)
            else if(String(s) == "[object Source]")
                trace(5)
            else if(String(s) == "[class Source]")
                trace(6)
            else if(s.constructor == Source)
                trace(7)
        }
    }
}

class Source {

    static private var flareModelRegExp:RegExp = /\.zf3d/;
    static private var modelWithProxyRegExp:RegExp = /\/trees\/.*_(3|4|5|6)\.zf3d/;

    public var x:Number;
    public var y:Number;
    public var z:Number;

    public var url:String;

    public var isBackground:Boolean = false;

    public function Source(url:String, x:Number, y:Number, z:Number) {

        this.url = url.match(modelWithProxyRegExp) ? url.replace(flareModelRegExp, '_lock.zf3d') : url;

        this.x = x;
        this.y = y;
        this.z = z;
    }
}
