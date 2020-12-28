package utils.wg.utils.array
{
    
    public function addElementsOnce(target:Array, source:Array):void {
        if(source==null)return;
        var len:int = source.length;
        for (var i:int = 0; i < len; ++i) {
            addOnce(target, source[i]);
        }
    }
    
}
