package utils.wg.utils.string
{
    
    public function generateString(fromLength:int = 0, toLength:int = -1, insertSpaces:Boolean = false):String {
        if (toLength == -1) toLength = fromLength;
        var length:int = fromLength + int((toLength - fromLength) * Math.random());
        var chars:String = "abcdefghijklmnopqrstuvwxyz";
        var result:String = "";
        while (length-- > 0) {
            if (insertSpaces && Math.random() > 0.7 && result.length > 0 && result.charAt(result.length - 1) != " ") {
                result += " ";
            } else {
                result += chars.charAt(int(chars.length * Math.random()));
            }
        }
        return result;
    }
    
}
