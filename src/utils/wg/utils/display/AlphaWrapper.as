package utils.wg.utils.display
{
    import flash.display.DisplayObject;
    
    public class AlphaWrapper
    {
        private var _arr:Array;
        
        public function AlphaWrapper(...args) {
            _arr = args;
        }
        
        private var _alpha:Number = 1;
        
        public function get alpha():Number {
            return _alpha;
        }
        
        public function set alpha(value:Number):void {
            _alpha = value;
            for each (var d:DisplayObject in _arr) {
                d.alpha = value;
            }
        }
    }
}
