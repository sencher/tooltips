package utils.wg.utils.array
{
	
	public function getRandomValue(collection:Object):Object {
		return collection[int(Math.random() * collection.length)];
	}
	
}
