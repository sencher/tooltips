package utils.wg.array
{
    
    public function findByFieldArray(iterable:Object, field:String, value:Object):Array {
        var res:Array = [];
        for each(var obj:Object in iterable) {
            if (obj.hasOwnProperty(field) && obj[field] == value) {
                res.push(obj);
            }
        }
        return res;
    }
    
}
