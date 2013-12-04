package {
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.utils.ByteArray;
    import flash.net.FileReference;

    /**
     * ...
     * @author Brian Hodge (brian@hodgedev.com)
     */
    public class Test_SaveXML extends Sprite
    {
        private var _xml:XML;

        public function Test_SaveXML():void
        {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            //Calling the save method requires user interaction and Flash Player 10
            stage.addEventListener(MouseEvent.MOUSE_DOWN, _onMouseDown);

            _xml= <xml>
                <test>data</test>
            </xml>;
        }
        private function _onMouseDown(e:MouseEvent):void
        {
            var ba:ByteArray = new ByteArray();
            ba.writeUTFBytes(_xml);

            var fr:FileReference = new FileReference();
            fr.addEventListener(Event.SELECT, _onRefSelect);
            fr.addEventListener(Event.CANCEL, _onRefCancel);

            fr.save(ba, "filename.xml");
        }
        private function _onRefSelect(e:Event):void
        {
            trace('select');
        }
        private function _onRefCancel(e:Event):void
        {
            trace('cancel');
        }
    }
}