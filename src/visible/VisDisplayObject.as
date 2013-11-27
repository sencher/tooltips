package visible {
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;

    import visible.VisDisplayObject;

    public class VisDisplayObject extends Sprite {
        public static const VISIBILITY_CHANGED:String = 'visibilityChanged';
        private var _d:DisplayObject;

        public function VisDisplayObject(d:DisplayObject) {
            super();
            _d = d;
            _d.addEventListener(Event.ACTIVATE, lis)
            _d.addEventListener(Event.ADDED, lis)
            _d.addEventListener(Event.ADDED_TO_STAGE, lis)
            _d.addEventListener(Event.CANCEL, lis)
            _d.addEventListener(Event.CHANGE, lis)
            _d.addEventListener(Event.CLEAR, lis)
            _d.addEventListener(Event.CLOSE, lis)
            _d.addEventListener(Event.COMPLETE, lis)
            _d.addEventListener(Event.CONNECT, lis)
            _d.addEventListener(Event.CONTEXT3D_CREATE, lis)
            _d.addEventListener(Event.COPY, lis)
            _d.addEventListener(Event.CUT, lis)
            _d.addEventListener(Event.DEACTIVATE, lis)
//            _d.addEventListener(Event.ENTER_FRAME, lis)
//            _d.addEventListener(Event.EXIT_FRAME, lis)
//            _d.addEventListener(Event.FRAME_CONSTRUCTED, lis)
            _d.addEventListener(Event.FULLSCREEN, lis)
            _d.addEventListener(Event.ID3, lis)
            _d.addEventListener(Event.INIT, lis)
            _d.addEventListener(Event.MOUSE_LEAVE, lis)
            _d.addEventListener(Event.OPEN, lis)
            _d.addEventListener(Event.PASTE, lis)
            _d.addEventListener(Event.REMOVED, lis)
            _d.addEventListener(Event.REMOVED_FROM_STAGE, lis)
            _d.addEventListener(Event.RENDER, lis)
            _d.addEventListener(Event.RESIZE, lis)
            _d.addEventListener(Event.SCROLL, lis)
            _d.addEventListener(Event.SELECT, lis)
            _d.addEventListener(Event.SELECT_ALL, lis)
            _d.addEventListener(Event.SOUND_COMPLETE, lis)
            _d.addEventListener(Event.TAB_CHILDREN_CHANGE, lis)
            _d.addEventListener(Event.TAB_ENABLED_CHANGE, lis)
            _d.addEventListener(Event.TAB_INDEX_CHANGE, lis)
            _d.addEventListener(Event.TEXT_INTERACTION_MODE_CHANGE, lis)
            _d.addEventListener(Event.TEXTURE_READY, lis)
            _d.addEventListener(Event.UNLOAD, lis)

//            _d.addEventListener(PropertyChangeEvent);

            //Error
//            _d.addEventListener(Event.CHANNEL_MESSAGE, lis)
//            _d.addEventListener(Event.CHANNEL_STATE, lis)
//            _d.addEventListener(Event.FRAME_LABEL, lis)
//            _d.addEventListener(Event.SUSPEND, lis)
//            _d.addEventListener(Event.VIDEO_FRAME, lis)
//            _d.addEventListener(Event.WORKER_STATE, lis)
        }

        private function lis(event:Event):void {
            trace(event.type)
        }

        override public function get visible():Boolean {
            return this._d.visible;
        }

        override public function set visible(value:Boolean):void {
            if (this._d.visible != value) {
                this._d.visible = value;
                this.dispatchEvent(new Event(VisDisplayObject.VISIBILITY_CHANGED,true,true));
            }
        }
    }
}