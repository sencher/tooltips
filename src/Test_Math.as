/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 30.05.13
 * Time: 17:38
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.MovieClip;
import flash.display.Sprite;

public class Test_Math extends Sprite{
    public function Test_Math() {
//        var a:Number = 2.45;
//        var b:Number = 2.51;
//        trace(Math.round(a),Math.round(b));
//        var c:* = Math.ceil(3.0001);
//        trace(c);
//        const TWO_THIRD:Number = 2. / 3.;
//        trace(TWO_THIRD);
//
        trace(Math.pow(1,1));
        trace(Math.pow(0.5,0.5));
        trace(Math.pow(0,0));
        trace(Math.pow(-0.5,-0.5));
        trace(Math.pow(-1,-1));

        var pow:Number;
        for (var i:Number = 1;i>=-1;i-=0.1){
            if(i<0){
                pow = -i;
            }else{
                pow = i;
            }
            trace(i, pow, Math.pow(i,pow));
        }
    }
}
}
