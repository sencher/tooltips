package utils.wg.utils.data.binding.core
{
	import flash.utils.Dictionary;
	import wowp.utils.data.binding.core.IBindingModel;
	import wowp.utils.data.binding.core.ModelEvent;
	
	/**
	 * Base class for data binding
	 */
	public class Binder 
	{
		private var _model:IBindingModel;
		
		protected var _container:Dictionary;
		
		public function Binder(model:IBindingModel) 
		{
			_model = model;
			_model.addEventListener(ModelEvent.DATA_CHANGED, dataChangeHandler);
			_container = new Dictionary(true);
		}
		
		public function dispose():void
		{
			_model.removeEventListener(ModelEvent.DATA_CHANGED, dataChangeHandler);
		}
		
		private function dataChangeHandler(e:ModelEvent):void
		{
			onDataChange(e.dataID, e.value);
		}
		
		/**
		 * переопределяемый в наследниках метод, который вызывается базовым класом когда приходит событие с модели
		 * @param	dataID	-	идентификатор данных, которые изменились
		 * @param	value	-	новое значение данных
		 */
		protected function onDataChange(dataID:String, value:Object):void
		{
			//	abstract
			//	must be overriden in a child for change data handling
		}
		
		/**
		 * установка значения в указанное свойство указанного объекта
		 * @param	host	-	объект
		 * @param	prop	-	свойство
		 * @param	value	-	значение
		 */
		protected final function setValue(host:Object, prop:String, value:Object):void
		{
			if (host.hasOwnProperty(prop))
			{
				if (host[prop] != value)
				{
					host[prop] = value;
				}
			}
		}
		
		/**
		 * установка сеттера
		 * @param	setter	-	сеттер
		 * @param	value	-	значение, которое должно передаться в сеттер
		 */
		protected final function invokeSetter(setter:Function, value:Object):void
		{
			if (setter == null)
			{
				return;
			}
			
			try {
				setter(value);
			}
			catch (e:Error)
			{
				try {
					setter();
				}catch(e:Error){}
			}
		}
		
		/**
		 * устанавливает валю в модели с указанным идентификатором
		 * @param	dataID
		 * @param	value
		 */
		protected final function setModelValue(dataID:String, value:Object):void
		{
			_model.setData(dataID, value);
		}
		
		/**
		 * возвращяет валю модели с указанным идентификатором
		 * @param	dataID
		 * @return
		 */
		protected final function getModelValue(dataID:String):Object
		{
			return _model.getData(dataID);
		}
		
	}

}