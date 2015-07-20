/**
 * Created by Sergey Senkov on 7/20/2015.
 */
package {
import flash.display.Sprite;
import flash.geom.Point;

public class Test_Dependency extends Sprite {
    public function Test_Dependency() {
        var xx:Point = new Point(1,19); // form 1 to 19
        var time:Point = new Point(3,4); // form 3 to 4

        var curTime:Number;
        var curX:Number;
//        for(curTime = time.x; curTime <= time.y; curTime += 0.1) {
//            //normalize
//            curTime = normalize(curTime);
//
//            curX = xx.x + (xx.y - xx.x) * (curTime - time.x);
//            trace("Time :", curTime, ", x :", normalize(curX));
//        }

        for (curTime = 3; curTime <= 23; curTime++){
            trace(curTime, get2ScalesDependencyValue(new Point(-200, 100), new Point(3,23), curTime));
        }
//        trace(curTime, get2ScalesDependencyValue(new Point(-200, 100), new Point(3,23), 8));
    }

    private function normalize(value:Number):Number {
        value = Math.round(value * 10) / 10;
        return value;
    }

    public static function get2ScalesDependencyValue(scaleTo:Point, scaleFrom:Point, valueFrom:Number, round:Boolean = false):Number {
        var valueTo:Number = scaleTo.x + (scaleTo.y - scaleTo.x) * (valueFrom - scaleFrom.x) / (scaleFrom.y - scaleFrom.x);
        return round ? Math.round(valueTo) : valueTo;
    }

    public static function getDependencyValue(scale:Point, ratio:Number, round:Boolean = false):Number {
        return round ? Math.round(scale.x + (scale.y - scale.x) * ratio) : scale.x + (scale.y - scale.x) * ratio;
    }
}
}
