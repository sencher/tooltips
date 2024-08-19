package wowp.utils.data.binding 
{
	import wowp.utils.data.binding.core.Binder;
	import wowp.utils.data.binding.core.ModelEvent;
	import flash.utils.Dictionary;
	import wowp.utils.data.binding.core.IBindingModel;
	
	public class PropertyBinder extends Binder
	{
		
		public function PropertyBinder(model:IBindingModel) 
		{
			super(model);
		}
		
		/**
		 * биндит указанное свойство в указанном объекте к изменениям данных модели
		 * @param	host	-	объект в котором биндится свойство
		 * @param	prop	-	свойство объекта, которое биндиться к модели
		 * @param	dataID	-	идентификатор данных в модели, с которыми свойство указанного объекта должно синхронизироваться
		 */
		public function bindProperty(host:Object, prop:String, dataID:String):void
		{
			//	если в указанном объекте не существует указанного свойства, то просто выходим - защита от дурака
			if (!host.hasOwnProperty(prop))
			{
				return;
			}
			
			var hostHolder:HostHolder = _container[host] as HostHolder;
			
			//	если объект регистрируется впервые, то холдера не существует. Создаем холдер для этого объекта.
			if (hostHolder == null)	
			{
				hostHolder = new HostHolder();
				hostHolder.host = host;
				hostHolder.dataIDProps = { };
				_container[host] = hostHolder;
			}
			
			//	массив свойств забинденых к dataID
			var arr:Array = hostHolder.dataIDProps[dataID];
			
			//	если dataID запоминается впервые, то создаем массив для ассоциированных с ним свойств
			if (arr == null)
			{
				arr = [];
				hostHolder.dataIDProps[dataID] = arr;
			}
			//	добавляем в масив свойство лишь тогда, когда его небыло до этого
			if (arr.indexOf(prop) == -1)
			{
				arr[arr.length] = prop;
			}
			
			//	устанавливаем свойство
			setValue(host, prop, getModelValue(dataID));
		}
		
		/**
		 * анбиндит указанное свойство в указанном объекте
		 * @param	host	-	объект в котором содержиться свойство
		 * @param	prop	-	свойство, для которого нужно убрать синхронизацию с моделью
		 */
		public function unbindProperty(host:Object, prop:String):void
		{
			//	если в указанном объекте не существует указанного свойства, то просто выходим - защита от дурака
			if (!host.hasOwnProperty(prop))
			{
				return;
			}
			
			var hostHolder:HostHolder = _container[host] as HostHolder;
			
			if (hostHolder != null)
			{
				//	перебираем массивы свойств, которые должны реагировать на dataID
				for each(var arr:Array in hostHolder.dataIDProps)
				{
					var index:int = arr.indexOf(prop);
					
					//	и удаляем в этих массивах указанное свойство
					if (index != -1)
					{
						arr.splice(index, 1);
					}
				}
			}
		}

        /**
         * анбиндит всех свойств во всех обьектах
         */
        public function unbindAllProperty():void
        {
            for each (var hostHolder:HostHolder in _container)
            {
                for (var str:String in hostHolder.dataIDProps)
                {
                    unbindProperty(hostHolder.host, str);
                }
            }
        }

        /**
         * анбиндит всех свойств в одном обьекте
         */
        public function unbindHost(host:Object):void
        {
            var hostHolder:HostHolder = _container[host] as HostHolder;
            for (var str:String in hostHolder.dataIDProps)
            {
                unbindProperty(hostHolder.host, str);
            }
        }

		
		//	обработка события пришедшего с модели
		override protected function onDataChange(dataID:String, value:Object):void 
		{
			for each(var hostHolder:HostHolder in _container)
			{
				var arr:Array = hostHolder.dataIDProps[dataID];
				if (arr != null)
				{
					for each(var prop:String in arr)
					{
						setValue(hostHolder.host, prop, value);
					}
				}
			}
		}
	}

}

/**
 * вспомогательный клас, в котором запоминаются объекты, свойства и идентификаторы
 */
internal class HostHolder {
	public var host:Object;						//	объект
	public var dataIDProps:Object;				//	пары dataID - массив свойств, которые должны быть изменены
}
		
