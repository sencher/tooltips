/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 13.06.13
 * Time: 20:34
 * To change this template use File | Settings | File Templates.
 */
package Interfaces {
public class File2 implements IBusSelectableIcon{
    public function File2() {
    }

    public function get is_investigated():Boolean {
        return false;
    }

    public function get selected():Boolean {
        return false;
    }

    public function set selected(value:Boolean):void {
    }
}
}
