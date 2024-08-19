package wowp.utils.array
{
    public function reverse(items:Array):Array {
        var result:Array = [];
		while(items.length){
			result.unshift(items.pop());
		}
		return result;
    }
    
}
