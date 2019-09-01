/**
 * Created by S.Senkov on 29.08.2019.
 */
package study
{
    import flash.display.Sprite;
    
    public class Child1 extends Sprite
    {
        public function Child1()
        {
        }
        
        public function shoot(value:int):void
        {
            trace("Персонаж выстрелил",value,"раза");
        }
        
        override public function set x(value:Number):void
        {
            value += 3;
            
            trace("Кто-то поменял х на", value);
            super.x = value;
        }
    }
}
