package utils.wg.utils.display.text.substitution
{
    import flash.display.BitmapData;
    
    import wowp.utils.domain.getDefinition;
    
    public dynamic class CertificatesMediumIconDisabled
    {
        private static var _ids:uint;
        public static const DEFAULT_SUBSTRING:String = "{crt_dis}";
        static private const ICON_BASELINE_Y:Number = 19;
        
        public function CertificatesMediumIconDisabled(substring:String = null, yOffset:int = 0)
        {
            this["image"] = new (getDefinition("bmpIconCertificateMediumDisabled"))() as BitmapData;
            this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
            this["id"] = "credits_" + uint(_ids++).toString();
            this["baseLineY"] = ICON_BASELINE_Y + yOffset;
        }
    }
}
