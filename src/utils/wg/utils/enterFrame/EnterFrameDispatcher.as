package utils.wg.utils.enterFrame
{
    import flash.display.Shape;
    import flash.events.Event;
    import flash.utils.getTimer;
    
    import wowp.utils.array.addOnce;
    import wowp.utils.array.safeSplice;
    
    public class EnterFrameDispatcher
    {
        public static const instance:EnterFrameDispatcher = new EnterFrameDispatcher();
        
        private var _frameCounter:uint = 0;
        public function get frameCounter():uint {return _frameCounter;}
        
        private var _elapsedTime:int;
        public function get elapsedTime():int {return _elapsedTime;}
        
        private var _prevTime:int;				//	предыдущее время
        
        private const _handlers:Vector.<IEnterFrameHandler> = new <IEnterFrameHandler>[];
        private const _add:Vector.<IEnterFrameHandler> = new <IEnterFrameHandler>[];
        private const _remove:Vector.<IEnterFrameHandler> = new <IEnterFrameHandler>[];
        private const _callNextFrame:Vector.<Function> = new <Function>[];
        private const _shape:Shape = new Shape();
        
        public function EnterFrameDispatcher() {
        }
        
        public function clear():void {
            _callNextFrame.length = 0;
            _handlers.length = 0;
            _shape.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function enterFrameHandler(e:Event):void {
            var currTime:int = getTimer();
            _elapsedTime = currTime - _prevTime;					// время одной итерации
            _prevTime = currTime;
            
            _frameCounter++;
            
            while (_add.length > 0) {
                addOnce(_handlers, _add.pop());
            }
            
            while (_remove.length > 0) {
                safeSplice(_handlers, _remove.pop());
            }
            
            var len:int = _handlers.length;
            var i:int = 0;
            for (i; i < len; ++i) {
                _handlers[i].enterFrameHandler();
            }
            
            len = _callNextFrame.length;
            if (len > 0) {
                for (i = 0; i < len; ++i) {
                    _callNextFrame[i]();
                }
                _callNextFrame.length = 0;
            }
            
            if (_handlers.length == 0 && _add.length == 0 && _remove.length == 0) {
                _shape.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
            }
        }
        
        public function add(h:IEnterFrameHandler):void {
			addOnce(_add, h);
			safeSplice(_remove, h);
            _shape.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        public function remove(h:IEnterFrameHandler):void {
			addOnce(_remove, h);
			safeSplice(_add, h);
			_shape.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
        
        public function callNextFrame(f:Function):void {
            addOnce(_callNextFrame, f);
            _shape.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
    }
}
