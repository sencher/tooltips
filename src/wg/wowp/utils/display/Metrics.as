package wowp.utils.display {

public class Metrics{
    public var x:Number;
    public var y:Number;
    public var width:Number;
    public var height:Number;
    
    public function Metrics(x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    
    public function get centerX():Number{
        return x + width/2;
    }
    
    public function get centerY():Number{
        return y + height/2;
    }
    
    public function toString():String {
        return "x: " + x + ", y: " + y + ", width: " + width + ", height: " + height;
    }
}
}
