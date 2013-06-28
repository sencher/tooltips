/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 13.06.13
 * Time: 20:33
 * To change this template use File | Settings | File Templates.
 */
package Interfaces {
public class File1 implements IBusSelectableIcon{
    private var a:int = 1;
    public var b:int = 2;

    public function File1() {
    }

    public function get is_investigated():Boolean {
        return true;
    }

    public function get selected():Boolean {
        return true;
    }

    public function set selected(value:Boolean):void {
    }

    private function hidden():void {

    }
}
}
