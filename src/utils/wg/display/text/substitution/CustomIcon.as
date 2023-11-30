package utils.wg.display.text.substitution
{
    import flash.display.BitmapData;
    
    import wowp.utils.domain.getDefinition;
    
    public dynamic class CustomIcon
    {
        private static var _ids:uint;
        public static const DEFAULT_SUBSTRING:String = "{image}";
        
        public function CustomIcon(image:String, substring:String = null, baseLine:Number = 17,
                                   width:int = 0, height:int = 0)
        {
            this["image"] = new (getDefinition(image))() as BitmapData;
            this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
            this["id"] = "gold_" + uint(_ids++).toString();
            this["baseLineY"] = baseLine;
            if (width != 0) {
                this["width"] = width;
            }
            if (height != 0) {
                this["height"] = height;
            }
        }
        
    }
    
}