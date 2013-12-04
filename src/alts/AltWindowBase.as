package alts {
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFormat;

[Embed(source="../swf/bubble_3d.swf", symbol="ExternalMovie")]
public class AltWindowBase extends MovieClip implements IAltWindow{
    protected const TOP_MARGIN:int = 8;
    public var bottom_margin:int = 8;
    protected const VERTICAL_MARGIN:int = 14;
    protected const LINE_MARGIN:int = 8;

    protected const RIGHT:String = 'right';
    protected const BOTTOM:String = 'bottom';

    protected var params:AltWindowParameters;

    public var text_title:TextField;
    public var text_info:TextField;
    public var anchor:MovieClip;
    public var bubble:MovieClip;

    protected var contentHeight:int;
    protected var contentWidth:int;

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
        var form:TextFormat = text_info.getTextFormat();

        this.x = params.position.x;
        this.y = params.position.y;
        adjust_background();
    }

    public function set_bg_size(width:int, height:int):void {
        bubble.height = height + TOP_MARGIN + bottom_margin;
        bubble.width = width + VERTICAL_MARGIN * 2;
    }


    public function add_content_box(content:DisplayObject, add_to:String = BOTTOM):void {
        var bound_box:Point = parse_object_to_box(content);

        contentHeight += bound_box.y + LINE_MARGIN;

        if(add_to == BOTTOM){
            if(contentWidth < bound_box.x) contentWidth = bound_box.x;
        } else if(add_to == RIGHT){
            contentWidth += bound_box.x + LINE_MARGIN;
        }
    }

    protected function parse_object_to_box(object:Object):Point
    {
        if(object is TextField)
            return new Point( object.textWidth, object.textHeight );
        else
            return new Point( object.width, object.height );
    }

    public function adjust_background():void {
        set_bg_size(contentWidth, contentHeight);
        adjust_elements();
    }

    public function adjust_elements():void {
        text_title.y = AltUtils.get_top_inverted_y(bubble) + TOP_MARGIN;
        text_info.y = AltUtils.get_bottom_y(text_title);
        var form:TextFormat = text_info.getTextFormat();
    }
}
}
