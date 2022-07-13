package {

import flash.display.Sprite;

public class Test_FormatNumber extends Sprite {
//    private static const ZERO:String = ".0";
    private static const ZERO:RegExp = /\.0+$/g;
    private static const DIGITS_LIMIT:int = 15;
    
    public function Test_FormatNumber() {
        trace(String(3));
        var changeValue:int = 4123;
        var currentValue:int = 7056811;
        var maxValue:int = 88884444;
    
        var changeDigits:int = changeValue.toString().length;
        var currentDigits:int = currentValue.toString().length;
        var maxDigits:int = maxValue.toString().length;
        
        var sumDigits:int = changeDigits + currentDigits + maxDigits;
    
        while (sumDigits > DIGITS_LIMIT){
            changeDigits = tryReduceDigitLength(changeDigits);
            currentDigits = tryReduceDigitLength(currentDigits);
            maxDigits = tryReduceDigitLength(maxDigits);
        
            sumDigits = changeDigits + currentDigits + maxDigits;
        }
    
        makeTests(789);
        makeTests(1234);
        makeTests(45612);
        makeTests(300000);
        makeTests(729693);
        makeTests(1067067);
        makeTests(1000000);
        makeTests(62125781);
        
    }
    
    public function tryReduceDigitLength(value:int):int {
        if(value < 4){
            return 3;
        }else if (value < 6){
            return value - 1;
        }else{
            return value - 2;
        }
    }
    
    private function makeTests(value:int):void {
        for(var i:int = 3; i < 8 ; i++){
            trace(i, formatNumber(value, i));
        }
    }
    
    public function formatNumber(value:int, maxChars:int = 5):String {
        if(!value) return "0";
        
        var numDigits:int = value.toString().length;
        if(numDigits <= maxChars){
            return stringAddSeparator(value);
        }
        
        var bigNumber:String = value.toString();
        var suffix:String = "";
        
        if (value >= 1000000) {
            bigNumber = removeZeros(Number(value / 1000000).toFixed(positive(maxChars - numDigits + 4)));
            suffix = "M";
        }else if (value >= 1000) {
            bigNumber = removeZeros(Number(value / 1000).toFixed(positive(maxChars - numDigits + 1)));
            suffix = "K";
        }
        
        numDigits = bigNumber.toString().length + 1;
        if(numDigits <= maxChars){
            return bigNumber + suffix;
        }else{
            return roundDecimal(bigNumber) + suffix;
        }
    }
    
    private function positive(value:int):int {
        if(value < 0){
            return 0;
        }else{
            return value;
        }
    }
    
    private function roundDecimal(value:String){
        return Number(value).toFixed(0);
    }
    
    private function removeZeros(value:String){
        return value.replace(ZERO, "");
    }
    
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
        
//        trace("result len", result.length)
        return result;
    }
}
}
