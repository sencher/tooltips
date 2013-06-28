/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 19.06.13
 * Time: 19:32
 * To change this template use File | Settings | File Templates.
 */
package embed {
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextLineMetrics;

[Embed(source="../swf/bubble_3d.swf", symbol="ExternalMovie")]
public class AltWindowBase extends MovieClip implements IAltWindow{
    protected const TOP_MARGIN:int = 8;
    protected const BOTTOM_MARGIN:int = 10;
    protected const VERTICAL_MARGIN:int = 14;
    protected const LINE_MARGIN:int = 6;

//    protected const LEFT:String = 'left';
    protected const RIGHT:String = 'right';
//    protected const TOP:String = 'top';
    protected const BOTTOM:String = 'bottom';

//    protected var progress_max_width:int;
    protected var params:AltWindowParameters;
//    private var text_lines:int;
//    protected var progress_mask:MovieClip;
//    protected var width_array:Array = [];
//
    public var text_title:TextField;
    public var text_info:TextField;
    public var anchor:MovieClip;
    public var bubble:MovieClip;

    public function AltWindowBase(init_params:AltWindowParameters) {
        super();
        params = init_params;
//        I18nHelper.set_font_for_display_object(this);
        text_title.text = params.title_text;
        add_content_box(text_title);

        if(params.info_text){
            add_content_box(text_info);
        }
        text_info.text = params.info_text || "";

        this.x = params.position.x;
        this.y = params.position.y;
        adjust_background();
    }

    protected var contentHeight:int;
    protected var contentWidth:int;
    protected var top_coord:int;

    public function adjust_background():void {


//        var element:*;
//
//        for each(element in _elements)
//        {
//            if (element is TextField)
//            {
////                var text_field:TextField = TextField(element);
//                contentHeight += element.textHeight + LINE_MARGIN;
//            }else if (element is MovieClip)
//            {
//                contentHeight += element.height + LINE_MARGIN;
//            }
//        }
//
//        contentWidth = Math.max.apply(null, width_array);
//
////        var contentWidth:int = Math.max.apply(null, elements_length) + HORIZONTAL_MARGIN * 2;
////        var contentHeight:int = text_lines * LINE_HEIGHT +
////                button_lines * BUTTON_HEIGHT +
////                (text_lines + button_lines - 1) * LINE_MARGIN +
////                VERTICAL_MARGIN * 2;
////
        set_bg_size(contentWidth, contentHeight);
////
        adjust_elements();
    }
//
    public function set_bg_size(width:int, height:int):void {
        bubble.height = height + TOP_MARGIN + BOTTOM_MARGIN;
        bubble.width = width + VERTICAL_MARGIN * 2;
        top_coord = bubble.y - bubble.height;
    }


    public function add_content_box(content:DisplayObject, add_to:String = BOTTOM):void {
        var bound_box:Point = parse_object_to_box(content);

        contentHeight += bound_box.y + LINE_MARGIN;

        if(add_to == BOTTOM){
            if(contentWidth < bound_box.x) contentWidth = bound_box.x;
        } else {
            contentWidth += bound_box.x;
        }
    }

    protected function parse_object_to_box(object:Object):Point
    {
        if(object is TextField)
            return new Point( object.textWidth, object.textHeight );
        else
            return new Point( object.width, object.height );
    }

    public function adjust_elements():void {
        text_title.y = top_coord + TOP_MARGIN;
        text_info.y = text_title.y + text_title.height - 3;
    }
}
}
