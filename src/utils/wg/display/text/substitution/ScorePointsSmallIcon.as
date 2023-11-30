package utils.wg.display.text.substitution
{
    import flash.display.BitmapData;
    
    import wowp.utils.domain.getDefinition;
    
    public dynamic class ScorePointsSmallIcon
    {
        private static var _ids:uint;
        public static const DEFAULT_SUBSTRING:String = "{score_p_sm}";
        static private const ICON_BASELINE_Y:Number = 16;
        
        public function ScorePointsSmallIcon(substring:String = null)
        {
            this["image"] = new (getDefinition("bmpIconScoreSmall"))() as BitmapData;
            this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
            this["id"] = "exp_free_" + uint(_ids++).toString();
            this["baseLineY"] = ICON_BASELINE_Y;
        }
    }
}
