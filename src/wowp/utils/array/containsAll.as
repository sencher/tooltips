package wowp.utils.array
{
	
	public function containsAll(collection:Object, ...rest):Boolean {
		for each(var obj:Object in rest) {
			if (collection.indexOf(obj) == -1) return false;
		}
		return true;
	}
	
}
