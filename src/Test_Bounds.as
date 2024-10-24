package {

import flash.display.Shape;
import flash.display.Sprite;
import flash.text.TextField;

public class Test_Bounds extends BaseTest {
    public function Test_Bounds() {
        var container:Sprite = new Sprite();
        container.x = 100;
        container.y = 100;
        this.addChild(container);
        var contents:Shape = new Shape();
        contents.graphics.lineStyle(2, 0x000000); // stroke thickness of 2 and color black
        contents.graphics.beginFill(0xFFCC00); // fill color
        contents.graphics.drawCircle(0,0,100);
        contents.graphics.endFill();
        container.addChild(contents);
        
        /* The getBounds() method is similar to the getRect() method; however, the Rectangle returned by the getBounds()
        method includes any strokes on shapes, whereas the Rectangle returned by the getRect() method does not.
        For an example, see the description of the getRect() method. */
        trace(contents.getBounds(container)); // (x=-101, y=-101, w=202, h=202)
        trace(contents.getRect(container));   // (x=-100, y=-100, w=200, h=200)
        trace(contents.getBounds(this));      // (x=-1, y=-1, w=202, h=202)
        trace(contents.getRect(this));        // (x=0, y=0, w=200, h=200)
        trace("********");
    
        trace("before tf", container.getBounds(this));
        var tf:TextField = new TextField();
        tf.border = true;
        tf.x = tf.y = 10;
        tf.width = 200;
        container.addChild(tf);
        trace("with tf", container.getBounds(this));
        tf.visible = false;
        trace("invisible tf", container.getBounds(this));
        container.removeChild(tf);
        trace("removeChild tf", container.getBounds(this));
    }
}
}
