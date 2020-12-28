package utils.wg.utils.display.align
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	
	public class AlignSettings 
	{
		public static const LEFT:String = "left";
        public static const RIGHT:String = "right";
        public static const TOP:String = "top";
        public static const BOTTOM:String = "botom";
		public static const NONE:String = "none";
		
		public static const CENTER_H:String = "center h";
        public static const CENTER_V:String = "center v";
		
		private var _settings:Object;
		
		private var _displayObject:DisplayObject
		
		public function AlignSettings(displayObject:DisplayObject)
		{
			_settings = { };
			_displayObject = displayObject;
		}
		
		/**
		 * очистка настроек привязки
		 * @return
		 */
		public function clear():AlignSettings
		{
			_settings = { };
			return this;
		}

		/**
		 * добавляет привязку. По умолчанию смещение вычисляется по текущим кординатам относительно стейджа. Если стейджа нету, то автоматическая привязка не вычисляется
		 * @param	align	- привязка
		 * @param	offset	- смещение, если не указано, то вычисляется относитель текущего положения (если стейдж не определен, то игнорируется)
		 * @return
		 */
		public function align(align:String, offset:Number = NaN):AlignSettings
		{
			if (isNaN(offset))
			{
				var stage:Stage = _displayObject.stage;
				if (stage != null)
				{
					switch(align)
					{
						case LEFT:
							_settings[align] = _displayObject.x;
							break;
						case TOP:
							_settings[align] = _displayObject.y;
							break;
						case RIGHT:
							_settings[align] = _displayObject.x - stage.stageWidth;
							break;
						case BOTTOM:
							_settings[align] = _displayObject.y - stage.stageHeight;
							break;
						case CENTER_H:
							_settings[align] = _displayObject.x - (stage.stageWidth >> 1);
							break;
						case CENTER_V:
							_settings[align] = _displayObject.y - (stage.stageHeight >> 1);
							break;
					}
				}
			}
			else
			{
				_settings[align] = offset;
			}
			
			return this;
		}
		
		internal function alignToDimensions(width:Number, height:Number):void
		{
			for (var mode:String in _settings)
			{
				var offset:Number = _settings[mode];
				switch(mode)
				{
					case LEFT:
						_displayObject.x = offset;
						break;
					case TOP:
						_displayObject.y = offset;
						break;
					case RIGHT:
						_displayObject.x = width + offset;
						break;
					case BOTTOM:
						_displayObject.y = height + offset;
						break;
					case CENTER_H:
						_displayObject.x = (width >> 1) + offset;
						break;
					case CENTER_V:
						_displayObject.y = (height >> 1) + offset;
						break;
				}
			}
		}
		
		/**
		 * попытка проапдейтить. Если стейдж существует для указанного дисплей обжекта, то производится привязка по стейджу, если нет - игнорируется
		 */
		public function tryToAlign():void
		{
			var stage:Stage = _displayObject.stage;
			if (stage)
			{
				alignToDimensions(stage.stageWidth, stage.stageHeight);
			}
		}
	}

}