package utils.wg.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import scaleform.clik.controls.Label;
	
	import wowp.utils.string.nbsp;
	
	import wowp.utils.string.size;
	
	public class Utils
	{
		public static var TIME_SEPARATOR:String = " : ";
		private static const SECONDS:int = 60;				//	количество секунд в минуте
		
		private static var LOGICAL_W:Number = 1024;
		private static var LOGICAL_H:Number = 768;
		
		public function Utils() 
		{
		}
		
		// Copies array without recreating it, thus keeping all references. This is needed to keep dropdown data providers valid, for instance.
		public static function refillArray(dest:Array, src:Array):void
		{
			//Logger.log("array " + src[0]);
			dest.splice(0);
			var cnt:int;
			var len:int = src.length;
			for (cnt = 0; cnt < len; ++cnt)
			{
				dest[cnt] = src[cnt];
			}
		}
		
		public static function getLabelFormatter(label:Label, multiplier:Number = 1, numDigits:int = 0):Function
		{
			return 	function(value:Number):void
			{
				label.text = Number(value * multiplier).toFixed(numDigits);
			}
		}
		
		public static function getSceneTop(stage:Stage):Number
		{
			if (checkAlign(stage))
			{
				return 0;
			}
			return -(stage.stageHeight - LOGICAL_H) / 2;
		}

		public static function getSceneBottom(stage:Stage):Number
		{
			if (checkAlign(stage))
			{
				return stage.stageHeight;
			}
			return LOGICAL_H + (stage.stageHeight - LOGICAL_H) / 2;
		}

		public static function getSceneLeft(stage:Stage):Number
		{
			if (checkAlign(stage))
			{
				return 0;
			}
			return -(stage.stageWidth - LOGICAL_W) / 2;
		}
		
		public static function getSceneRight(stage:Stage):Number
		{
			if (checkAlign(stage))
			{
				return stage.stageWidth;
			}
			return LOGICAL_W + (stage.stageWidth - LOGICAL_W) / 2;
		}

		private static function checkAlign(stage:Stage):Boolean
		{
			return (stage.align == "BL") || (stage.align == "LB") || (stage.align == "LT") || (stage.align == "TL");
		}
		
		/**
		 *  Traverse all children of a display object container and call funcChild for each of them, all ...rest parameters will be passed to it.
		 *  When DisplayObjectContainer is encountered as a child, funcDOC is called, with ...rest as parameters.
		 *  forEachChild recurses into this DisplayObjectContainer if funcDOC returns true or if funcDOC is null.
		 */
		
		public static function forEachChild(doc:DisplayObjectContainer, funcChild:Function/*(child:DisplayObject, ...rest):void*/, funcDOC:Function/*(doc:DisplayObjectContainer, ...rest):Boolean*/, ...rest):void
		{
			if (doc == null)
			{
				return;
			}
			var len:int = doc.numChildren;
			var cnt:int;
			var tmpObj:Object;
			var processNext:Boolean;
			if (rest == null)
			{
				rest = [];
			}
			for (cnt = 0; cnt < len; ++cnt)
			{
				tmpObj = doc.getChildAt(cnt);
				if (tmpObj is DisplayObjectContainer)
				{
					processNext = true;
					if (funcDOC != null)
					{
						rest.unshift(tmpObj);
						processNext = funcDOC.apply(null, rest);
						rest.shift();
					}
					if (processNext)
					{
						forEachChild.apply(null, ([tmpObj, funcChild, funcDOC] as Array).concat(rest));
					}
				}
				else
				{
					if (funcChild != null)
					{
						rest.unshift(tmpObj);
						funcChild.apply(null, rest);
						rest.shift();
					}
				}
			}
			if (funcChild != null)
			{
				rest.unshift(doc as DisplayObject);
				funcChild.apply(null, rest);
			}
		}

		/**
		 * переводит число в римские числа. Пока что лишь от 1 к 10
		 * @param	value
		 * @return
		 */
		public static function arabic2Roman(value:int):String
		{
			switch(value)
			{
				case 1:
					return "I";
				case 2:
					return "II";
				case 3:
					return "III";
				case 4:
					return "IV";
				case 5:
					return "V";
				case 6:
					return "VI";
				case 7:
					return "VII";
				case 8:
					return "VIII";
				case 9:
					return "IX";
				case 10:
					return "X";
			}
			return "n/a";
		}


		public static function setShortString(textField:TextField, strLong:String, autoSize:String = null):String
		{
			var boundsW:int;
			var boundsH:int;
			var slice:Boolean;
			var bounds:Rectangle;

			if(textField == null || strLong == "" || strLong == null)
			{
				return "";
			}

			autoSize = !autoSize ? textField.autoSize : autoSize;

			textField.visible = false;
			textField.htmlText = strLong;

			strLong = textField.text;

			while(true)
			{
				bounds = textField.getCharBoundaries(textField.text.length - 1);

				boundsH = bounds.y + bounds.height;
				boundsW = bounds.x + bounds.width;

				if(boundsH > textField.height || boundsW > textField.width)
				{
					strLong = strLong.slice(0, strLong.length - 1);

					textField.text = strLong;

					slice = true;
				}else
				{
					break;
				}
			}

			if(slice)
			{
				strLong = strLong.slice(0, strLong.length - 3) + "...";
			}

			textField.text = "";
			textField.autoSize = autoSize;
			textField.visible = true;

			return strLong;
		}
		
		/**
		 * форматирует время в виде ММ Р СС, где М - минуты, Р - разделитель, С - секунды. 
		 * @param	time	- время в секундах
		 * @return	форматированая строка
		 */
		public static function formatTime(time:int):String
		{
			var minutes:int = time / SECONDS;	//	количество минут
			var seconds:int = time - (SECONDS * minutes);	//	количество секунд
			
			var formattedSeconds:String = seconds.toString();
			var formattedMinutes:String = minutes.toString();
			
			if (seconds < 10)					
			{
				formattedSeconds = "0" + formattedSeconds;
			}
			
			if (minutes < 10)					
			{
				formattedMinutes = "0" + formattedMinutes;
			}
				
			return formattedMinutes + TIME_SEPARATOR + formattedSeconds;
		}

		public static function trimWhitespace(value:String):String
		{
			if (value == null)
			{
				return "";
			}
			return value.replace(/^\s+|\s+$/g, "");
		}

		public static function fitTextField(tf:TextField):int
		{
			var diff:int;
			if (tf) {
				diff = tf.width;
				tf.width = tf.textWidth + 5;
				diff = tf.width - diff;
			}
			return diff;
		}

		public static function fitTextFields(...args):int
		{
			var minDiff:int = int.MIN_VALUE;
			for each (var tf:TextField in args) {
				if (tf) {
					minDiff = Math.max(minDiff, fitTextField(tf));
				}
			}
			if (minDiff == int.MIN_VALUE) {
				minDiff = 0;
			}
			return minDiff;
		}
		
		public static function getSpaces(width:int):String {
			var spaces:String = "";
			while (width--) {
				spaces += nbsp();
			}
			return size(spaces, 5);
		}
        
        public static function mergeObjects(main:Object, second:Object, overrideMain:Boolean = false):void {
            var i:Object;
            for (i in second) {
                if (overrideMain || !main[i]) {
                    main[i] = second[i];
                }
            }
        }
	}
}
