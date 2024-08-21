package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;

public class Dev_ConsoleFilterSpam extends BaseTest {
    private var counter:int = 0;
    public function Dev_ConsoleFilterSpam() {
        Cc.SPAM = ["crew", "bullshit"];
        showConsole();
    
        consoleMessage(true);
        consoleMessage("some bullshit");
        consoleMessage("some crew info");
        consoleMessage("some cool");
        consoleMessage("not so cool bullshit", "and data");
        consoleMessage(new Sprite());
        consoleMessage(new Sprite(),null);
        consoleMessage("",NaN,undefined," ",int.MAX_VALUE,uint.MAX_VALUE, Function);
        consoleMessage(new CrewMarket());
        consoleMessage(new ZalupaOnline());
        consoleMessage(new IncredibleCrew());
    }
    
    private function consoleMessage(...args):void {
        Cc.green2cw.apply(null, [this, ++counter].concat(args));
    }
}
}

class CrewMarket{

}

class ZalupaOnline{

}

class IncredibleCrew{

}
