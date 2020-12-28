package utils.wg.utils.display.align
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	public class AlignManager extends Sprite
	{
		
		private var _settings:Dictionary;
		
		public function AlignManager() 
		{
			_settings = new Dictionary();
			
			if (stage == null)
			{
				addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler, false, 0);
			}
			else
			{
				stageResizeHandler();		//	начальный ресайз
			}
			
		}
		
		/**
		 * менеджер может создаваться через нью, тогда нужно следить за добавлением его на стейдж
		 * @param	e
		 */
		private function addedToStageHandler(e:Event):void
		{
			stage.addEventListener(Event.RESIZE, stageResizeHandler);
			stage.addEventListener(Event.REMOVED_FROM_STAGE, removeFromStageHandler);
			stageResizeHandler();							//	при добавлении на стейдж сразу ресайзим
		}
		
		private function removeFromStageHandler(e:Event):void
		{
			stage.removeEventListener(Event.RESIZE, stageResizeHandler);
			stage.removeEventListener(Event.REMOVED_FROM_STAGE, removeFromStageHandler);
		}
		
		/**
		 * ресайз стейджа
		 * @param	e
		 */
		private function stageResizeHandler(e:Event = null):void
		{
			//	кешируем параметры стейджа
			var sw:Number = stage.stageWidth;		//	ширина стейджа
			var sh:Number = stage.stageHeight;		//	высота стейджа
			
			for each(var settings:AlignSettings in _settings)
			{
				if (settings)
				{
					settings.alignToDimensions(sw, sh);
				}
			}
		}
		
		/**
		 * возвращяет настройки привязки для указанного дисплей обжекта
		 * @param	displayObject
		 * @return
		 */
		public function getAlignSettings(displayObject:DisplayObject):AlignSettings
		{
			if (_settings[displayObject] == null)
			{
				_settings[displayObject] = new AlignSettings(displayObject);
			}
			return _settings[displayObject] as AlignSettings;
		}
		
		/**
		 * удаляет настройки привязки
		 * @param	displayObject
		 */
		public function removeAlignSettings(displayObject:DisplayObject):void
		{
			if (_settings[displayObject] != null)
			{
				_settings[displayObject] = null;
				delete _settings[displayObject];
			}
			
		}
		
		
	}

}