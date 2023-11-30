package utils.wg.array
{
    public function refillCollection(target:Object, source:Object):void {
        target.splice(0, target.length);
        var len:int = source.length;
        for (var i:int = 0; i < len; ++i) {
            target[i] = source[i];
        }
    }
    
}
