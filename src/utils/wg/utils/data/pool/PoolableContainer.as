package utils.wg.utils.data.pool
{
	public class PoolableContainer
	{
		private var _pool:Pool;
		
		private const _items:Array = [];
		
		public function PoolableContainer(classRef:Class, depth:int = 1) {
			_pool = new Pool(classRef, depth);
		}
		
		public function create():Object {
			var item:Object = _pool.instatiate();
			_items.push(item);
			return item;
		}
		
		public function release(item:Object):void {
			var index:int = _items.indexOf(item);
			if (index != -1) {
				_items.splice(index, 1);
				_pool.utilize(item);
			}
		}
		
		public function clear(releaser:Function = null):void {
			while (_items.length > 0) {
				var item:Object = _items.pop();
				if (releaser != null) {
					releaser(item);
				}
				_pool.utilize(item);
			}
		}
	}
}
