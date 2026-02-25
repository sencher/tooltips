package wowp.utils.array
{
    
    public function extractUnique(arr:Array):Array {
        var result:Array = [];
        var len:int = arr.length;
        for (var i:int = 0; i < len; ++i) {
            addOnce(result, arr[i]);
        }
        return result;
    }
    
}
