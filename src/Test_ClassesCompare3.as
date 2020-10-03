package {
import flash.display.Sprite;

public class Test_ClassesCompare3 extends Sprite {
    public function Test_ClassesCompare3() {
        var mySprite:Sprite = new Sprite();
        var number:Number = 0;
        
        //trace(number = mySprite);
        trace(number == mySprite);
        trace(number === mySprite);
        
        trace(mySprite == mySprite);
        trace(mySprite === mySprite);
        
        trace(mySprite is Sprite);
        trace(mySprite as Sprite);
        trace(mySprite instanceof Sprite);
        
    }
}
}
