package {
import com.junkbyte.console.Cc;
import com.junkbyte.console.addons.displaymap.DisplayMapAddon;
import com.junkbyte.console.addons.htmlexport.ConsoleHtmlExportAddon;

import flash.display.Sprite;

[SWF(height=600,width=500)]
public class Test_ConsoleAddons extends Sprite {
    public function Test_ConsoleAddons() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = 600;
        Cc.width = 500;
        Cc.config.commandLineAllowed = true;

        DisplayMapAddon.start(this);
        DisplayMapAddon.addToMenu();
        DisplayMapAddon.registerCommand();// use /mapdisplay, starts mapping from current command scope.

        ConsoleHtmlExportAddon.addToMenu();
    }
}
}
