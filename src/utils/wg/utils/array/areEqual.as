package utils.wg.utils.array
{
	
	public function areEqual(arr_1:Array, arr_2:Array):Boolean {
		if (arr_1 == arr_2) return false;
		if (arr_1 == null || arr_2 == null) return false;
		if (arr_1.length != arr_2.length) return false;
		var len:int = arr_1.length;
		for (var i:int = 0; i < len; i++) {
			if (arr_1[i] != arr_2[i]) return false;
		}
		return true;
	}
	
}
