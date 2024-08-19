package wowp.utils.data.pool 
{
	
	
	public class Pool 
	{
		private var _depth:int;
		private var _pool:Array = [];
		private var _classRef:Class;
		
		public function Pool(classRef:Class, depth:int = 50) 
		{
			_classRef = classRef;
			_depth = depth;
		}
		
		public function dispose():void
		{
			_pool.length = 0;
			_classRef = null;
		}
		
		public function instatiate():Object
		{
			if (_pool.length == 0)
			{
				var l:int = 0;
				while (l++ < _depth)
				{
					_pool[_pool.length] = new _classRef();
				}
				return new _classRef();
			}
			return _pool.pop();
		}
		
		public function utilize(object:Object):void
		{
			_pool.push(object);
		}
		
	}

}