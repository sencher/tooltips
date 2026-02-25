package wowp.utils.display
{
    import flash.display.Stage;
    
    public class StageResolutionClassification
    {
        //  768 <= LOW < 800 <= MEDIUM < 960 <= HIGH
        public static const LOW_THRESHOLD:int = 800;
        public static const HIGH_THRESHOLD:int = 960;
        
        public static const LOW:int = 1;
        public static const MEDIUM:int = 2;
        public static const HIGH:int = 3;
        
        public static function getHeightClassification(stage:Stage):int {
            var height:int = stage.stageHeight;
            if (height >= HIGH_THRESHOLD) {
                return HIGH;
            }
            if (height >= LOW_THRESHOLD) {
                return MEDIUM;
            }
            return LOW;
        }
    }
}
