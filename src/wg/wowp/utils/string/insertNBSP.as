package wowp.utils.string
{
    
    public function insertNBSP(text:String):String {
        return text.split(" ").join("&nbsp;");
    }
    
}
