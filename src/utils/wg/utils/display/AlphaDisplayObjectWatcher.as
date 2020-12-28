package utils.wg.utils.display
{
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    
    import wowp.utils.array.addOnce;
    import wowp.utils.enterFrame.EnterFrameDispatcher;
    import wowp.utils.enterFrame.IEnterFrameHandler;
    
    public class AlphaDisplayObjectWatcher implements IEnterFrameHandler
    {
        private const _displayObjects:Vector.<DisplayObject> = new <DisplayObject>[];
        
        private var _watchParent:Boolean = false;
        
        public function AlphaDisplayObjectWatcher(watchParent:Boolean = false) {
            _watchParent = watchParent;
        }
        
        public function init(...items):void {
            var len:int = items.length;
            var i:int = 0;
            for (i; i < len; ++i) {
                if (items[i] != null) {
                    addOnce(_displayObjects, items[i]);
                }
            }
            EnterFrameDispatcher.instance.add(this);
        }
        
        public function dispose():void {
            _displayObjects.length = 0;
            EnterFrameDispatcher.instance.remove(this);
        }
        
        public function enterFrameHandler():void {
            var i:int = _displayObjects.length - 1;
            for (i; i >= 0; i--) {
                var d:DisplayObject = _displayObjects[i];
                if (d.visible) {
                    if (_watchParent && d.parent && d.parent.alpha == 0 || d.alpha == 0) {
                        d.visible = false;
                    }
                } else if (!d.visible) {
                    if (_watchParent && d.parent && d.parent.alpha > 0 || d.alpha > 0)
                        d.visible = true;
                }
            }
        }
        
        public function watch(d:DisplayObjectContainer):void {
            for (var i:int = 0; i < d.numChildren; ++i) {
                addOnce(_displayObjects, d);
            }
            EnterFrameDispatcher.instance.add(this);
        }
    }
}
