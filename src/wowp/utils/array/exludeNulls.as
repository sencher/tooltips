package wowp.utils.array
{
	
	public function exludeNulls(arr:Array):Array {
		if (arr != null) {
			var len:int = arr.length;
			for (var i:int = 0; i < len; ++i) {
				if (arr[i] == null) {
					arr.splice(i, 1);
					len--;
					i--;
				}
			}
		}
		return arr;
	}
	
}
