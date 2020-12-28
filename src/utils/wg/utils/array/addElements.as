package utils.wg.utils.array
{
	public function addElements(target:Object, source:Object) {
		var len:int = source.length;
		for (var i:int = 0; i < len; ++i) {
			target.push(source[i]);
		}
	}
}
