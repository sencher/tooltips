package utils.wg.data.binding
{
	import wowp.utils.data.binding.core.Binder;
	import wowp.utils.data.binding.core.IBindingModel;
	
	
	public class SetterBinder extends Binder
	{
		
		public function SetterBinder(model:IBindingModel) 
		{
			super(model);
		}
		
		/**
		 * Биндит сеттер
		 * @param	setter		-	сеттер
		 * @param	dataID		-	идентификатор данных
		 * @param	setOnStart	-	нужно ли сразу при биндинге вызвать сеттер
		 */
		public function bindSetter(setter:Function, dataID:String, setOnStart:Boolean=false):void
		{
			var setterHolder:SetterHolder = _container[setter];
			
			if (setterHolder == null)
			{
				setterHolder = new SetterHolder();
				setterHolder.func = setter;
				setterHolder.dataIDs = [];
				_container[setter] = setterHolder;
			}
			
			if (setterHolder.dataIDs.indexOf(dataID) == -1)
			{
				setterHolder.dataIDs.push(dataID);
				
				if (setOnStart)
				{
					invokeSetter(setter, getModelValue(dataID));
				}
			}
		}
		
		public function unbindSetter(setter:Function, dataID:String):void
		{
			var setterHolder:SetterHolder = _container[setter];
			
			if (setterHolder != null)
			{
				var index:int = setterHolder.dataIDs.indexOf(dataID);
				if (index != -1)
				{
					setterHolder.dataIDs.splice(index, 1);
				}
			}
		}
		
		override protected function onDataChange(dataID:String, value:Object):void 
		{
			for each(var setterHolder:SetterHolder in _container)
			{
				if (setterHolder.dataIDs.indexOf(dataID) != -1)
				{
					invokeSetter(setterHolder.func, value);
				}
			}
		}
		
	}
}

internal class SetterHolder {
	public var func:Function;					//	сеттер
	public var dataIDs:Array;
}