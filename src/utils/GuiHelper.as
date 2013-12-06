package utils {
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;
    import flash.display.Stage;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.utils.describeType;

    public class GuiHelper {
        private static var pressedButton:MovieClip;
    public function GuiHelper() {
    }


    public static function MessageBox(text:String, params:*=null):BaseWindow
    {
        return new BaseWindow();//Config.scene.gui_helper.show_message_box(text, params);
    }

    public static function HideMessageBox(wnd_instance:BaseWindow=null):void{
       //Config.scene.gui_helper.hide_message_box(wnd_instance);
    }

    public static function isObjectDisabled(object:Object):Boolean {
        return !object.enabled;
    }

    static private function stopper(e:Event):void{
            e.stopPropagation();
    }
    
    static public function set_button_mode(button:MovieClip, frame:int, callback:Function, button_text:String = null):void {
        if (button == null) {
            return;
        }
        button.mouseChildren = false;
        button.buttonMode = true;
        var change_text:Function = function():void {
//            I18nHelper.set_font_for_display_object(button);
            if (button_text && button.button_text) {
                button.button_text.text = button_text;
            }
            button.addFrameScript(frame-1, null);
        };
        if (button.currentFrame == frame) {
            change_text();
        }
        else button.addFrameScript(frame-1, change_text);
        button.gotoAndStop(frame);

        button.addEventListener(MouseEvent.CLICK, callback);
        button.addEventListener(MouseEvent.CLICK, stopper);
    }

    static protected function removeFramesScript(mc:MovieClip):void{
        for (var i:int = 0; i< mc.framesLoaded; i++)
            mc.addFrameScript(i, null);
    }

    protected static var _buttons:Hash = new Hash();
    static public function set_2frames_button(button:MovieClip, on_click:Function = null, text:String = null, text_field_name:String = null, on_button_over:Function = null, on_button_out:Function = null):void {
        var changed:Boolean = false;
        var btn_data:Object;
        if (!_buttons.hasKey(button)){
            button.addEventListener(MouseEvent.MOUSE_OVER, (on_button_over != null)?on_button_over:_on_button_over);
            button.addEventListener(MouseEvent.MOUSE_OUT, (on_button_out != null)?on_button_out:_on_button_out);
            button.mouseChildren = false;
            button.buttonMode = true;

            if (text != null && text_field_name != null){
                setTextFramesScript(button, text, text_field_name);
            }

            btn_data = {"text": text, "cb": on_click};
            changed = true;
        }else{
            btn_data = _buttons.getKey(button);
            if (btn_data["text"] != text){
                btn_data["text"] = text;
                removeFramesScript(button);
                if (text != null && text_field_name != null){
                    setTextFramesScript(button, text, text_field_name);
                }
                changed = true;
            }
            if (btn_data["cb"] != on_click){
                if (btn_data["cb"] != null){
                    button.removeEventListener(MouseEvent.CLICK, btn_data["cb"]);
                }
                btn_data["cb"] = on_click;
                changed = true;
            }
        }
        if (changed){
            _buttons.setKey(button, btn_data);
            button.gotoAndStop(1);
        }
        if (on_click != null) {
            button.addEventListener(MouseEvent.CLICK, on_click);
        }
    }

        static public function setTextFramesScript(button:MovieClip, text:String, text_field_name:String):void{
            for (var i:int = 0; i< button.framesLoaded; i++)
                button.addFrameScript(i, function():void{
//                I18nHelper.set_font_for_display_object(button);
                    if (button[text_field_name] != null){
                        button[text_field_name].text = text;
                    }
                });
        }

        static public function setTextFramesScript4(button:MovieClip, text:String, text_field_name:String):void{
            for (var i:int = 0; i< button.framesLoaded; i++)
                button.addFrameScript(i, function():void{
//                I18nHelper.set_font_for_display_object(button);
                    if (button[text_field_name] != null){
                        button[text_field_name].text = text;
                    }
                });
        }

    static public function set_4frames_button(button:MovieClip, on_click:Function = null, enabled:Boolean = true, text:String = null,
                    text_field_name:String = null):void {

        //DEBUG
        for (var i:int = 0; i< button.framesLoaded; i+=1)
            button.addFrameScript(i, function(){var ev:Event = new Event("a",true); button.dispatchEvent(ev);});

        var changed:Boolean = false;
        var btn_data:Object;
        if (!_buttons.hasKey(button)){
            enable(button, enabled);
            button.mouseChildren = false;

            if (text != null && text_field_name != null){
                setTextFramesScript4(button, text, text_field_name);
            }

            btn_data = {"text": text, "cb": on_click};
            changed = true;
        }else{
            btn_data = _buttons.getKey(button);
            if (btn_data["text"] != text){
                btn_data["text"] = text;
                removeFramesScript(button);
                if (text != null && text_field_name != null){
                    setTextFramesScript4(button, text, text_field_name);
                }
                changed = true;
            }
            if (btn_data["cb"] != on_click){
                btn_data["cb"] = on_click;
                changed = true;
            }
        }
        if (changed){
            _buttons.setKey(button, btn_data);
        }
    }

        private static function on_button4_up(event:MouseEvent):void {
            var curTarget:* = event.currentTarget;
            if(pressedButton && (curTarget is Stage || curTarget.enabled)) {
                pressedButton.gotoAndStop(1);
                setPressed(false);
            }
        }

        private static function on_button4_out(event:MouseEvent):void {
            if(event.currentTarget.enabled) event.currentTarget.gotoAndStop(1);
        }

        private static function on_button4_over(event:MouseEvent):void {
            var curTarget:MovieClip = MovieClip(event.currentTarget);
            if(curTarget.enabled) {
                if(curTarget != pressedButton)
                    curTarget.gotoAndStop(2);
                else
                    curTarget.gotoAndStop(3);
            }
        }

        private static function on_button4_down(event:MouseEvent):void {
            if(event.currentTarget && event.currentTarget.enabled) {
                setPressed(true, MovieClip(event.currentTarget));
                pressedButton.gotoAndStop(3);

            }
        }

        private static function on_button4_click(event:MouseEvent):void {
            var curTarget:MovieClip = MovieClip(event.currentTarget);
            if(_buttons.hasKey(curTarget)) {
                var o:* = _buttons.getKey(curTarget);
                o.cb(event);
            }
        }

        private static function setPressed(value:Boolean, mc:MovieClip = null):void
        {
            if(value && mc)
            {
                pressedButton = mc;
                pressedButton.stage.addEventListener(MouseEvent.MOUSE_UP, on_button4_up);
            }else{
                pressedButton.stage.removeEventListener(MouseEvent.MOUSE_UP, on_button4_up);
                pressedButton = null;
            }
        }

        public static function enable(button:MovieClip, value:Boolean):void
        {
            if(button.enabled == value && button.hasEventListener(MouseEvent.MOUSE_OVER)) return;

            if(value)
            {
                button.gotoAndStop(1);
                button.addEventListener(MouseEvent.MOUSE_OVER, on_button4_over);
                button.addEventListener(MouseEvent.MOUSE_OUT, on_button4_out);
                button.addEventListener(MouseEvent.MOUSE_DOWN, on_button4_down);
                button.addEventListener(MouseEvent.MOUSE_UP, on_button4_up);
                button.addEventListener(MouseEvent.CLICK, on_button4_click);
            }else{
                button.gotoAndStop(4);
                button.removeEventListener(MouseEvent.MOUSE_OVER, on_button4_over);
                button.removeEventListener(MouseEvent.MOUSE_OUT, on_button4_out);
                button.removeEventListener(MouseEvent.MOUSE_DOWN, on_button4_down);
                button.removeEventListener(MouseEvent.MOUSE_UP, on_button4_up);
                button.removeEventListener(MouseEvent.CLICK, on_button4_click);
            }
            button.buttonMode = button.enabled = value;
        }

    static public function unset_2frames_button(button:MovieClip):void{
        if (!_buttons.hasKey(button)) return;
        var btn_data:Object = _buttons.getKey(button);
        _buttons.removeKey( button );
        removeFramesScript(button);

        if (button.hasEventListener(MouseEvent.CLICK))
            button.removeEventListener(MouseEvent.CLICK, btn_data["cb"]);

        if (button.hasEventListener(MouseEvent.MOUSE_OVER))
            button.removeEventListener(MouseEvent.MOUSE_OVER, _on_button_over);

        if (button.hasEventListener(MouseEvent.MOUSE_OUT))
            button.removeEventListener(MouseEvent.MOUSE_OUT, _on_button_out);
    }

	private static function _on_button_over(e:MouseEvent):void {
		if (e.currentTarget.currentFrame < 3)
			e.currentTarget.gotoAndStop(2);
	}
		
	private static function _on_button_out(e:MouseEvent):void {
		if (e.currentTarget.currentFrame < 3)
			e.currentTarget.gotoAndStop(1);
	}

    public static function set_text_format(params:Object):TextFormat {
        var format:TextFormat = new TextFormat();
        for (var key:String in params) {
             format[key] = params[key];
        }
        return format;
    }

    public static function remove_children(container:DisplayObjectContainer):void {
        while (container.numChildren > 0) {
            container.removeChildAt(0);
        }
    }

    private static function set_NN_size(txt:String, tf:TextField):void{
        var format:TextFormat = new TextFormat(null, 8);
        for(var i:int = 0; (i = txt.indexOf("\n\n", i)) != -1; i += 2){
            tf.setTextFormat(format, i, i + 2);
        }
    }

    public static function adjust_text_field_height(txt:String, tf:TextField, maxHeight:int):void{
//        if(StringHelper.is_empty(txt))
//            return;
        set_NN_size(txt, tf);
        var format:TextFormat = tf.getTextFormat(0, 1);
        while(tf.textHeight > maxHeight){
            format.size = int(format.size) - 1;
            tf.setTextFormat( format );
            set_NN_size(txt, tf);
        }
    }

    public static function blank_text_fields(parent:DisplayObjectContainer):void{
        for (var i:int = 0; i < parent.numChildren; i++){
            var tf:TextField = parent.getChildAt(i) as TextField;
            if (tf) {tf.text = ""; continue;}

            var doc:DisplayObjectContainer = parent.getChildAt(i) as DisplayObjectContainer;
            if (doc) blank_text_fields(doc);
        }
    }

/*    public static function attach_image_container(image_holder:DisplayObjectContainer, image_path:String, size_x:int = 0, size_y:int = 0, cb:Function = null):ImageContainer{
        GuiHelper.remove_children(image_holder);
        if (StringHelper.is_empty(image_path)) return null;
        var ic:ImageContainer = new ImageContainer(size_x, size_y, image_path, cb, !size_x && !size_y);
        image_holder.addChild(ic);
        return ic;
    }*/

    protected static const I18N_SIGN:String = "_i18n_";
    public static function hide_i18n(parent:DisplayObjectContainer, create_translated_movies:Boolean = false):void{
        var current_i18n:String = I18N_SIGN// + Te.lang;
        var object_description:XML = describeType(parent);
        var names:Array = [];

        // variables
        for each (var variable:XML in object_description.variable)
          names.push( variable.@name );

        // dynamic properties
        for (var name:String in parent)
          names.push( name );

        for each (name in names){
            if (!parent[name]) continue;
            var i:int = name.indexOf( I18N_SIGN );
            if (i >= 0){
                if (name.indexOf(current_i18n) != i){
                    parent[name].visible = false;
                    var mc:MovieClip = parent[name] as MovieClip;
                    if (mc) mc.stop();
                    continue;
                }
                parent[name].visible = true;
                if (create_translated_movies)
                    parent[name.substring(0, name.length - current_i18n.length) + "_i18n"] = parent[name];
            }
            var doc:DisplayObjectContainer = parent[name] as DisplayObjectContainer;
            if (doc)
                hide_i18n(doc, create_translated_movies);
        }
    }

    public static function lock_screen(params:Object = null):void {
//        ScreenLocker.instance.lock_screen(params);
    }

    public static function unlock_screen():void {
//        ScreenLocker.instance.unlock_screen();
    }
}
}