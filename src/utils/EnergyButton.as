package utils {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    public class EnergyButton {
        private static var pressedButton:MovieClip;
        private static var buttons:Hash = new Hash();

        private static var i:int;
        private static var child:*;
        private static var curParams:Object;

        /*
            Initialize Button.
         */
        public static function initButton(button:MovieClip, callBack:Function = null, enabled:Boolean = true):void {
            saveActiveButtonParams(button);

            enable(button, enabled);
            button.mouseChildren = false;

            registerTextFieldsForUpdate(button);
            if(callBack != null) curParams["cb"] = callBack;
        }

        /*
            Removes all listeners. Use this before to destroy button.
         */
        public static function deactivateButton(button:MovieClip):void {
            saveActiveButtonParams(button);
            enable(button, false);
            registerTextFieldsForUpdate(button, false);
            buttons.removeKey(button);
        }

        /*
            Use this method to set "text" for specific TextField on all frames of Button.
         */
        public static function setTextValue(button:MovieClip, textFieldName:String, text:String):void
        {
            saveActiveButtonParams(button);
            if(button[textFieldName]) button[textFieldName].text = curParams[textFieldName] = text;
        }

        /*
            Makes button active or inactive.
         */
        public static function enable(button:MovieClip, value:Boolean):void {
            if (!buttons.hasKey(button) || button.enabled == value && button.hasEventListener(MouseEvent.MOUSE_OVER)) return;

            if (value) {
                button.gotoAndStop(1);
                button.addEventListener(MouseEvent.MOUSE_OVER, button_mouseOverHandler);
                button.addEventListener(MouseEvent.MOUSE_OUT, button_mouseOutHandler);
                button.addEventListener(MouseEvent.MOUSE_DOWN, button_mouseDownHandler);
                button.addEventListener(MouseEvent.MOUSE_UP, button_mouseUpHandler);
                button.addEventListener(MouseEvent.CLICK, button_clickHandler);
            } else {
                button.gotoAndStop(4);
                button.removeEventListener(MouseEvent.MOUSE_OVER, button_mouseOverHandler);
                button.removeEventListener(MouseEvent.MOUSE_OUT, button_mouseOutHandler);
                button.removeEventListener(MouseEvent.MOUSE_DOWN, button_mouseDownHandler);
                button.removeEventListener(MouseEvent.MOUSE_UP, button_mouseUpHandler);
                button.removeEventListener(MouseEvent.CLICK, button_clickHandler);
            }
            button.buttonMode = button.enabled = value;
        }

        private static function saveActiveButtonParams(button:MovieClip):void
        {
            curParams = {};
            if(buttons.hasKey(button))
            {
                curParams = buttons.getKey(button);
            }else{
                buttons.setKey(button, curParams);
            }
        }

        /*
            Returns Object with pairs {textFieldName : text}. If no one has found returns null.
         */
        private static function extractTextFields(button:MovieClip):Object
        {
            var extractedTextFields:Object = {};
            curParams =  buttons.getKey(button);
            var isAnyTextFieldInside:Boolean;
            for (i = 0; i < button.numChildren; i++) {
                child = button.getChildAt(i);
                if (child is TextField){
                    extractedTextFields[child.name] = curParams[child.name] || child.text;
                    isAnyTextFieldInside = true;
                }
            }

            if(isAnyTextFieldInside)
                return extractedTextFields;
            else
                return null;
        }

        private static function registerTextFieldsForUpdate(button:MovieClip, value:Boolean = true):void {
            var extracted:Object = extractTextFields(button);
            if(extracted == null) return;
            
            if (value) {
                Utils.mergeObjects(curParams, extracted);
                for (i = 0; i < button.framesLoaded; i++) {
                    button.addFrameScript(i, function ():void {
                        setTextFieldsParams(button);
                    });
                }
            }else{
                Utils.substractObjects(curParams, extracted);
                for (i = 0; i < button.framesLoaded; i++) {
                    button.addFrameScript(i, null);
                }
            }
        }

        private static function setTextFieldsParams(button:MovieClip):void {
            var extracted:Object = extractTextFields(button);
//                I18nHelper.set_font_for_display_object(button);
            for (child in extracted)
            {
                button[child].text = extracted[child];
            }
        }

        private static function button_mouseUpHandler(event:MouseEvent):void {
            var curTarget:* = event.currentTarget;
            if(curTarget != pressedButton) return;

            if (pressedButton && curTarget.enabled) {
                pressedButton.gotoAndStop(2);
                setPressed(false);
            }
        }

        private static function stage_mouseUpHandler(event:MouseEvent):void {
            if (pressedButton) {
                pressedButton.gotoAndStop(1);
                setPressed(false);
            }
        }

        private static function button_mouseOutHandler(event:MouseEvent):void {
            if (event.currentTarget.enabled) event.currentTarget.gotoAndStop(1);
        }

        private static function button_mouseOverHandler(event:MouseEvent):void {
            var curTarget:MovieClip = MovieClip(event.currentTarget);
            if (curTarget.enabled) {
                if (curTarget != pressedButton)
                    curTarget.gotoAndStop(2);
                else
                    curTarget.gotoAndStop(3);
            }
        }

        private static function button_mouseDownHandler(event:MouseEvent):void {
            if (event.currentTarget && event.currentTarget.enabled) {
                setPressed(true, MovieClip(event.currentTarget));
                pressedButton.gotoAndStop(3);
            }
        }

        private static function button_clickHandler(event:MouseEvent):void {
            var curTarget:MovieClip = MovieClip(event.currentTarget);
            if (buttons.hasKey(curTarget)) {
                try{buttons.getKey(curTarget).cb(event)} catch(e:Error){}
            }
        }

        private static function setPressed(value:Boolean, button:MovieClip = null):void {
            if (value && button) {
                pressedButton = button;
                pressedButton.stage.addEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
            } else {
                pressedButton.stage.removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
                pressedButton = null;
            }
        }
    }
}