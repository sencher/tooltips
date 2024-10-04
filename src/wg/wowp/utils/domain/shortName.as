package wowp.utils.domain {
// If there is a package name, strip it off.
public function shortName(value:String):String {
    var arr:Array = value.split("::");
    if (arr.length == 2) return arr[1];
    return value;
}
}
