package {
import flash.display.Sprite;

public class Test_Millions extends Sprite{
    public function Test_Millions() {
        trace(formatNumber(45777));
        trace(formatNumber(45111));
        trace(formatNumber(1211111));
        trace(formatNumber(1200000));
        trace(formatNumber(1522222));
        trace(formatNumber(33333333));
        trace(formatNumber(999888777));
        trace(formatNumber(999494777));
        trace(formatNumber(945000));
        trace(formatNumber(1500));
        trace(formatNumber(10000));
        trace(formatNumber(9999));
        trace(formatNumber(11000));
    }

    public function formatNumber(value:int):String
    {
        if (value >= 1000000) {
            return Number(value / 1000000).toFixed(1) + "M";
        }
        if (value >= 10000) {
            return Number(value / 1000).toFixed(0) + "K";
        }
        return stringAddSeparator(value);
    }

    function stringAddSeparator(s:*):String
    {
        var separator:String = "&nbsp;";
        var period:int = 3;

        var src:String = String(s);
        if (src == null)return s;
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
}
