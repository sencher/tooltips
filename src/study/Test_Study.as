/**
 * Created by S.Senkov on 29.08.2019.
 */
package study
{
    import flash.display.Sprite;
    
    public class Test_Study extends Sprite
    {
        private var my:int;
        private var my2:int;
        private var child:Child2;
        private var flag:Boolean = false;
        
        public function Test_Study()
        {
            trace("Hello");
            x = 7;
            y = 9;
            //my = 14;
            my2 = 4;
            trace("my = ", my);
            trace(flag);
            flag = !flag;
            trace(flag);
            
            child = new Child2();
            addChild(child);
        }
    }
}
