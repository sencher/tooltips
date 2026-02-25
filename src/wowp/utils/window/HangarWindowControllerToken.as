package wowp.utils.window
{
    public class HangarWindowControllerToken
    {
        public var payload:Object;
        internal var _openingPrevented:Boolean = false;
        
        public function preventOpening():void {
            _openingPrevented = true;
        }
    }
}
