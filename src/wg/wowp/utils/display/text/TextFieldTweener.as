package wowp.utils.display.text
{
    import flash.text.TextField;

    import scaleform.clik.motion.Tween;
    import scaleform.gfx.TextFieldEx;

    import wowp.utils.display.text.substitution.CustomIcon;
    import wowp.utils.string.reduceNumber;
    import wowp.utils.string.stringAddSeparator;

    public class TextFieldTweener
    {
		public var duration:Number = 2000;
		public var easing:Function = defaultEasing;

        public var substitution:CustomIcon;
        public var val:Number = NaN;

        private var _textField:TextField;
        private var _tween:Tween;
        private var _changeCallback:Function;
        private var _completeCallback:Function;
        private var _isReduced:Boolean = false;

        public function get isReduced():Boolean {return _isReduced;}

        public function set isReduced(value:Boolean):void {
            if (_isReduced != value) {
                _isReduced = value;
                draw();
            }
        }

        public function TextFieldTweener(tf:TextField, changeCallback:Function = null, completeCallback:Function = null)
        {
            _textField = tf;
            _changeCallback = changeCallback;
			_completeCallback = completeCallback;
        }

        public function draw():void
        {
//            Cc.green2cw(this, "draw", val);
            if (isNaN(val)) {
                _textField.text = "";
            }
            else {
                var txt:String;
				if (_isReduced) {
                    txt = reduceNumber(Math.round(val));
//                    Cc.green2( "Reduced", txt);
                } else {
					txt = stringAddSeparator(Math.round(val));
//                    Cc.green2( "notReduced", txt);
                }
				if (substitution != null) txt = txt + CustomIcon.DEFAULT_SUBSTRING;
				_textField.htmlText = txt;
                if (substitution != null) TextFieldEx.setImageSubstitutions(_textField, substitution);
            }
            if (_changeCallback != null) {
                _changeCallback();
            }
        }

        public function dispose():void
        {
            if (_tween) {
                _tween.paused = true;
            }
            _tween = null;
            _textField = null;
            _changeCallback = null;
        }

        public function tweenTo(value:Number):void
        {
            if (_tween != null) {
                _tween.paused = true;
            }
            if (isNaN(val)) {
                val = value;
                draw();
            }
            else {
                var easeParam:Number = val - value;
                if (easeParam < 0) easeParam = -easeParam;
                easeParam = Math.log(easeParam + 1) * Math.LOG10E;
                if (easeParam < 2) easeParam = 2;

                _tween = new Tween(duration, this, {val: value}, {ease: easing, 
                                                                    easeParam: easeParam, 
                                                                    onChange: draw, 
                                                                    onComplete: onComplete});
            }
        }

		private function onComplete(t:Tween):void
		{
			if (_completeCallback != null) {
				_completeCallback(_textField);
			}
		}

        private function defaultEasing(t:Number, b:Number, c:Number, d:Number, s:Number = 0):Number
        {
            return t == d ? b + c : c * (-Math.pow(s, (-10) * t / d) + 1) + b;
        }

    }

}