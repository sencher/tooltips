package utils.wg.array
{
    import flash.utils.getQualifiedClassName;

    public function addOnce(collection:Object, value:Object):void {
        if (value == null)return;
        //	массив или вектор
        if (collection is Array || getQualifiedClassName(collection).indexOf("__AS3__.vec::Vector") == 0) {
            if (collection.indexOf(value) == -1) {
                collection.push(value);
            }
        }
        else {
            var key:String = getKey(collection, value);
            if (key != null) {
                collection[key] = value;
            }
        }
    }
    
}
