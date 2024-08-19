package wowp.utils.debug
{
    
    public function traco(...args):void {
        var s:String = "";
        for (var i:int = 0; i < args.length; ++i) {
            if (s.length != 0)s += ", ";
            s += o2s(args[i]);
        }
        trace(s);
    }
    
}
