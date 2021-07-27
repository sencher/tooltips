/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 22.05.13
 * Time: 18:58
 * To change this template use File | Settings | File Templates.
 */
package folder {
import flash.display.Sprite;

public class First{// extends Sprite{
    public var p1:int;
    private var _p2:int;
    public function First(p1:int = 0, p2:int = 0) {
        this.p1 = p1;
        this._p2 = p2;
    }

    public function SomeFunc():void {
        trace(p1,_p2);
    }
}
}
