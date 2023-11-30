package utils.wg.debug
{
	import wowp.hud.core.base.BaseDataRoutable;
	import wowp.hud.core.data.ArrayT;
	import wowp.hud.core.data.BaseType;
	import wowp.hud.core.data.local.ArrayL;
	import wowp.hud.core.impl.DescribeTypeField;
	import wowp.hud.core.impl.DescribeTypeModel;
	
	public function traceObject(data:Object, indent:String = '', isMainObject:Boolean = true):void
	{
		if(isMainObject)
		{
			trace('-=>' + indent, data + ':');
			indent += '   ';
		}
		var value:Object;
		if(data is BaseDataRoutable)
		{
			var model:DescribeTypeModel = DescribeTypeModel.getFromCache(this);

			for each (var field:DescribeTypeField in model.vars)
			{
				var name:String = field.name;
				if(data[name] is ArrayT || data[name] is ArrayL)
				{
					var itemsList:Array = data[name].value;
					if(itemsList && itemsList.length && itemsList[0] is BaseDataRoutable)
					{
						trace('-=>' + indent, name + ' ' + itemsList[0] + ':');
					} else
					{
						trace('-=>' + indent, name + ':');
					}
					traceObject(data[name].value, indent + '   ', false);
				} else if(data[name] is BaseType)
				{
					trace('-=>' + indent, name + ': ' + data[name].value);
				} else
				{
					trace('-=>' + indent, name + ': ' + data[name]);
				}
			}
		} else if(data is BaseType)
		{
			traceObject(Object(data).value, indent, false);
		} else if(data is int || data is Number || data is String || data is Boolean)
		{
			trace('-=>' + indent, data);
		} else if(data is Array)
		{
			var list:Array = data as Array;
			for (var i:int = 0; i < list.length; i++)
			{
				value = list[i];
				trace('-=>' + indent, i + ':');
				traceObject(value, indent + '   ', false);
			}
		} else
		{
			for (var p:String in data)
			{
				trace('-=>' + indent, p + ' (' + data[p] + '):');
				traceObject(data[p], indent + '   ', false);
			}
		}
	}
}
