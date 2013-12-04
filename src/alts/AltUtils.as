
package alts {
import flash.display.DisplayObject;

public class AltUtils {
    public static function get_bottom_y(display_object:DisplayObject):int {
        return display_object.y + display_object.height;
    }

    public static function get_top_inverted_y(display_object:DisplayObject):int {
        return display_object.y - display_object.height;
    }
}
}
