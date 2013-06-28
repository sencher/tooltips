/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 20.06.13
 * Time: 18:54
 * To change this template use File | Settings | File Templates.
 */
package embed {
import flash.geom.Point;

public class AltWindowParameters {

    public static const SIMPLE:int = 1;
    public static const RED_PROGRESS:int = 2;
    public static const GREEN_PROGRESS:int = 3;
    public static const GREEN_PROGRESS_WITH_BUTTON:int = 4;
    public static const QUEST:int = 5;
    public static const QUEST_WITH_BUTTON:int = 6;

    public var position:Point;
    public var title_text:String = "";
    public var info_text:String;
    public var callback:Function;
    public var progess_bar_text:String;
    public var button_texts:Array = [];
    public var quest_texts:Array = [];

}
}
