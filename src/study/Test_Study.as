/**
 * Created by S.Senkov on 29.08.2019.
 */
package study
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.text.TextField;
    
    public class Test_Study extends Sprite
    {
        private var my:int;
        private var my2:int;
        private var child:Child2;
        private var flag:Boolean = false;
        private var textField:TextField;
        
        public function Test_Study()
        {
            trace("Hello");
            x = 7;
            y = 9;
            my = 14;
            my2 = 4;
            trace("my = ", my);
            trace(flag);
            flag = !flag;
            trace(flag);
            
            child = new Child2();
            child.addEventListener(Child2.POSITION_CHANGED, child_positionChangedHandler);
            addChild(child);
            
            textField = new TextField();
            textField.width = 500;
            textField.text = "Xyu!";
            addChild(textField);
        }
    
        private function child_positionChangedHandler(event:Event):void
        {
            textField.text = "new position: " + event.target.button.x + ", " + event.target.button.y;
        }
    }
}
