/**
 * Created by S.Senkov on 29.08.2019.
 */
package study
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    
    import utils.Utils;
    
    public class Child2 extends Child1
    {
        public var button:Sprite;
        private var timer:Timer;
        public static const POSITION_CHANGED:String = "position_changed";
        
        public function Child2()
        {
            x = 20;
            shoot(7);
            
            button = new Sprite();
            button.addChild(Utils.drawBox());
            button.addEventListener(MouseEvent.CLICK, button_clickHandler);
            addChild(button);
            
            timer = new Timer(500);
            timer.addEventListener(TimerEvent.TIMER, timer_timerHandler);
            timer.start();
        }
    
        private function timer_timerHandler(event:TimerEvent):void
        {
            trace("tick");
            changePosition();
        }
    
        private function button_clickHandler(event:MouseEvent):void
        {
            trace("click");
            changePosition();
        }
        
        private function changePosition():void{
            button.x = Utils.getRandom(0, 500);
            button.y = Utils.getRandom(0, 300);
            dispatchEvent(new Event(POSITION_CHANGED,true));
        }
    }
}
