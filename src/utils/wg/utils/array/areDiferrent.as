package utils.wg.utils.array
{
	
	public function areDiferrent(array_1:Object, array_2:Object):Boolean {
		if (array_1.length != array_2.length)return true;
		var len:int = array_1.length;
		for (var i:int = 0; i < len; ++i) {
			if (array_2.indexOf(array_1[i]) == -1)return true;
		}
		return false;
	}
	
}
