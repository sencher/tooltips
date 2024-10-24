package wowp.utils.array {

public function removeAllByField(iterable:Object, field:String, value:Object):void {
    var item:*;
    while (item = findByField(iterable, field, value)) {
        removeItem(iterable, item);
    }
}
}
