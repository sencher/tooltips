package wowp.utils.array
{
	
	public function substract(collection:Object, other:Object):void {
		for each(var item:Object in other) {
			removeItem(collection, item);
		}
	}
	
}
