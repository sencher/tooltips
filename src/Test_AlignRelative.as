package {

import flash.display.Sprite;
import flash.text.TextField;

import utils.Utils;

[SWF(width="1200",height="900")]
public class Test_AlignRelative extends Sprite {
    private var container1:Sprite = new Sprite();
    private var container2:Sprite = new Sprite();
    private var container3:Sprite = new Sprite();
    private var container4:Sprite = new Sprite();
    
    private var container2b:Sprite = new Sprite();
    private var container3b:Sprite = new Sprite();
    private var container4b:Sprite = new Sprite();
    
    private var tf1:TextField = new TextField();
    private var tf2:TextField = new TextField();
    private var button1:Sprite;
    private var button2:Sprite;
    
    public function Test_AlignRelative() {
        
        container1.x = container1.y = 100;
        addChild(container1);
        
        container2.x = 250;
        container1.addChild(container2);
        
        container3.x = -150;
        container3.y = 150;
        container2.addChild(container3);
        
        container4.x = 88;
        container3.addChild(container4);
        
        container2b.x = -17;
        container1.addChild(container2b);
        
        container3b.x = 42;
        container2b.addChild(container3b);
        
        container4b.x = 451;
        container3b.addChild(container4b);
        
        
        button1 = Utils.createButton();
        container2.addChild(button1);
        
        button2 = Utils.createButton(0,0,195,65);
        button2.x = 200;
        container4.addChild(button2);
    
//        alignToDisplayObjectHorizoltally(button2, button1);
//        alignToDisplayObjectVertically(button2, button1);
        Utils.alignToDisplayObjectBoth(button2, button1);
        
        tf1.border = tf2.border = true;
        tf1.text = "sdfdfgdfgfbfb";
        tf1.y = 100;
        container4b.addChild(tf1);
        
        tf2.text = "zzzz";
        container3.addChild(tf2);
        
//        alignToDisplayObjectHorizoltally(tf2, tf1);
        Utils.alignToDisplayObjectBoth(tf2, tf1);
    }
    
    
}
}


