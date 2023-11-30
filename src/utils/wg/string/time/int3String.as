package utils.wg.string.time
{
    
    public function int3String(i:int):String {
        if (i < 10) return "00" + i.toString();
        if (i < 100) return "0" + i.toString();
        return i.toString();
    }
    
}
