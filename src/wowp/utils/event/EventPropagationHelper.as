package wowp.utils.event
{
    import flash.events.Event;
    import flash.events.IEventDispatcher;
    
    public class EventPropagationHelper
    {
        protected static function stopPropagationHandler(e:Event):void {
            e.stopPropagation();
        }
    
        protected static function stopImmediatePropagationHandler(e:Event):void {
            e.stopImmediatePropagation();
        }
        
        public static function stopPropagation(d:IEventDispatcher, type:String):void {
            d.addEventListener(type, stopPropagationHandler, false, 0, true);
        }
        
        public static function continuePropagation(d:IEventDispatcher, type:String):void {
            d.removeEventListener(type, stopPropagationHandler);
        }
        
        public static function stopImmediatePropagation(d:IEventDispatcher, type:String):void {
            d.addEventListener(type, stopImmediatePropagationHandler, false, 0, true);
        }
        
        public static function continueImmediatePropagation(d:IEventDispatcher, type:String):void {
            d.removeEventListener(type, stopImmediatePropagationHandler);
        }
    }
}
