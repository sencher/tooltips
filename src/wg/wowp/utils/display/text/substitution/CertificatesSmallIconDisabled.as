package wowp.utils.display.text.substitution
{
    import flash.display.BitmapData;
    
    import wowp.utils.domain.getDefinition;
    
    public dynamic class CertificatesSmallIconDisabled
    {
        private static var _ids:uint;
        public static const DEFAULT_SUBSTRING:String = "{crt_sm_d}";
        static private const ICON_BASELINE_Y:Number = 16;
        
        public function CertificatesSmallIconDisabled(substring:String = null, yOffset:int = 0)
        {
            this["image"] = new (getDefinition("iconCertificateSmall_dis"))() as BitmapData;
            this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
            this["id"] = "credits_" + uint(_ids++).toString();
            this["baseLineY"] = ICON_BASELINE_Y + yOffset;
        }
    }
}
