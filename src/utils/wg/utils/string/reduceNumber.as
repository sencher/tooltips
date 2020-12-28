package utils.wg.utils.string
{
    
    public function reduceNumber(value:int):String {
        if (value <= 9999)return stringAddSeparator(value);
        else if (value <= 999999)return int(value / 1000).toString() + "K+";
        return stringAddSeparator(int(value / 1000000).toString()) + "M+";
    }
    
}
