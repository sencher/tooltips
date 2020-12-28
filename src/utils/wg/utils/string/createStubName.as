package utils.wg.utils.string
{
	public function createStubName(maxLen:uint = 0):String {
		var parts:Array = ["ba", "ra", "pan", "gop", "lo", "jor", "pid", "mu", "gav", "si", "ro", "ga", "pe"];
		var len:int = parts.length;
		var name:String = "";
		var nameLen:int = 3 + Math.random() * 10;
		while (nameLen-- > 0) {
			name += parts[int(len * Math.random())];
		}
		if (maxLen > 0 && name.length > maxLen) {
			name = name.substr(0, maxLen);
		}
		return name;
	}
	
}
