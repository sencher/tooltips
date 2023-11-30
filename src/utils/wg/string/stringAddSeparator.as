package utils.wg.string {

public function stringAddSeparator(s:*):String {
    var separator:String = "&nbsp;";
    var period:int = 3;
    
    var src:String = String(s);
    if (src == null) return s;
    if (src.indexOf(".") != -1 || src.indexOf(",") != -1) {
        return s;
    }
    
    var result:String = "";
    var prefix:String;
    var c:int;
    
    if (src.charAt(0) == "-" || src.charAt(0) == "+") {
        prefix = src.charAt(0);
        src = src.substring(1);
    }
    
    c = src.length;
    
    while (c >= 0) {
        var end:int = c;
        var start:int = end - period;
        
        if (start < 0) {
            start = 0;
        }
        
        result = src.slice(start, end) + result;
        if (start != 0) {
            result = separator + result;
        }
        
        c -= period;
    }
    
    if (prefix) {
        result = prefix + result;
    }
    
    return result;
}

}