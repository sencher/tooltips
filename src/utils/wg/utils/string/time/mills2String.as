package utils.wg.utils.string.time
{
    import wowp.core.LocalizationManager;

    public function mills2String(i:Number, separator:String = ":", showMills:Boolean = false):String {
        var res:String = "";
        var d:int = i / 86400000;
        if (d != 0) {
            res += d.toString() + LocalizationManager.getInstance().textByLocalizationID("COUNTER_DAYS") + "&nbsp;";
        }
        var h:int = (i - d * 86400000) / 3600000;
        if (h != 0) {
            res += h.toString() + separator;
        }
        var m:int = (i - d * 86400000 - h * 3600000) / 60000;
        res += int2String(m) + separator;
        var s:int = (i - d * 86400000 - h * 3600000 - m * 60000) / 1000;
        res += int2String(s);
        //

        if (showMills) {
            res += separator;
            var mls:int = (i - d * 86400000 - h * 3600000 - m * 60000 - s * 1000);
            res += int3String(mls);
        }
        return res;
    }
    
}
