package {
import com.adobe.serialization.json.JSON;
import com.junkbyte.console.Cc;
import com.junkbyte.console.KeyBind;
import com.junkbyte.console.addons.htmlexport.ConsoleHtmlExportAddon;

import flash.display.MovieClip;

import flash.display.Sprite;
import flash.ui.Keyboard;

import utils.Utils;

[SWF(height=600,width=500)]
public class Test_ConsoleObjectWatch extends Sprite {
    private var o:Object = {ar:[7,9,"kk"], s:"vv2dda", i:726, o:{ar:[2,2,"kk"], s:"22dda", i:22}};
    public function Test_ConsoleObjectWatch() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = 600;
        Cc.width = 500;

        var mc1:MovieClip = new MovieClip();
        mc1.name = "First";
        addChild(mc1);

        var mc2:MovieClip = new MovieClip();
        mc2.name = "Second";
        mc1.addChild(mc2);

        Cc.log(mc2);
        mc2.name = "SecondChanged";
        Cc.log(mc2);


        Cc.log(o);
        Utils.logJsonObject(o);
        o.i = 999;
        Cc.log(o);
        Utils.logJsonObject(o);

        ConsoleHtmlExportAddon.addToMenu();

        var checkResult:Object = com.adobe.serialization.json.JSON.decode('{"ar":[7,9,"kk"],"s":"vv2dda","i":999,"o":{"ar":[2,2,"kk"],"s":"22dda","i":22}}');
        trace(checkResult.s, checkResult.o.i);


    }
}
}
