package utils.wg.utils.string
{
    
    public function formatString(text, ...args):String {
        if (text == null) return null;
        for (var i:int = 0; i < args.length; i++) {
            text = stringReplace(text, "{" + i.toString() + "}", args[i]);
        }
        return text;
    }
    
}
