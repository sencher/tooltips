package utils.wg.utils.string.time
{
    
    public function int2String(i:int):String {
        if (i < 10) return "0" + i.toString();
        return i.toString();
    }
    
}
