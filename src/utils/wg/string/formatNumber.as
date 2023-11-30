package utils.wg.string {

import utils.wg.utils.string.*;

import wowp.utils.number.positive;

public function formatNumber(value:int, maxChars:int = 5):String {
    if (!value) return "0";
    
    var numDigits:int = value.toString().length;
    if (numDigits <= maxChars) {
        return stringAddSeparator(value);
    }
    
    var bigNumber:String = value.toString();
    var suffix:String = "";
    
    if (value >= 1000000) {
        bigNumber = removeZeros(Number(value / 1000000).toFixed(positive(maxChars - numDigits + 4)));
        suffix = "M";
    } else if (value >= 1000) {
        bigNumber = removeZeros(Number(value / 1000).toFixed(positive(maxChars - numDigits + 1)));
        suffix = "K";
    }
    
    numDigits = bigNumber.toString().length + 1;
    if (numDigits <= maxChars) {
        return bigNumber + suffix;
    } else {
        return roundDecimal(bigNumber) + suffix;
    }
}
}
