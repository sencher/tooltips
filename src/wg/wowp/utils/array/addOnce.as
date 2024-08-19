package wowp.utils.array {

import flash.utils.getQualifiedClassName;

public function addOnce(collection:Object, value:Object):Boolean {
    if (value == null) return false;
    //	массив или вектор
    if (collection is Array || getQualifiedClassName(collection).indexOf("__AS3__.vec::Vector") == 0) {
        if (collection.indexOf(value) == -1) {
            collection.push(value);
//            Cc.yellowc(this, "1 addOnce value:", value, "collection:", collection);
            return true;
        }
    } else {
        var key:String = getKey(collection, value);
        if (key != null) {
            collection[key] = value;
//            Cc.yellowc(this, "2 addOnce value:", value, "collection:", collection);
            return true;
        }
    }
    return false;
}
}
