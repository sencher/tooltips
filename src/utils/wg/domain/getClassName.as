package utils.wg.domain
{
	import flash.utils.getQualifiedClassName;

	public function getClassName(object:Object):String {
		var str:String = getQualifiedClassName(object);
		var arr:Array = str.split("::");
		if (arr.length == 2)return arr[1];
		return str;
	}
	
}
