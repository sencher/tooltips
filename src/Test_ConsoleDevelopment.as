package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.events.Event;

import utils.Utils;

[SWF(width="800", height="800")]
public class Test_ConsoleDevelopment extends Sprite {
    private const SPAM_FRAME:int = 3;
    private var frameCounter:int;
    
    public function Test_ConsoleDevelopment() {
        Cc.start(this);
        Cc.visible = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
        Cc.width = stage.stageWidth;
        Cc.height = stage.stageHeight;
        Cc.commandLine = true;
        
        Cc.log("log",{a:1});
        Cc.logc(this,"logc",{a:1});
        Cc.logw("logw",{a:1});
        Cc.logj("logj",{a:1});
        Cc.logcw(this,"logcw",{a:1});
        Cc.logcj(this,"logcj",{a:1});
        Cc.logwj("logwj",{a:1});
        Cc.logcwj(this,"logcwj",{a:1});
        
        Cc.blue("blue",{a:1});
        Cc.bluec(this,"bluec",{a:1});
        Cc.bluew("bluew",{a:1});
        Cc.bluej("bluej",{a:1});
        Cc.bluecw(this,"bluecw",{a:1});
        Cc.bluecj(this,"bluecj",{a:1});
        Cc.bluewj("bluewj",{a:1});
        Cc.bluecwj(this,"bluecwj",{a:1});      
        
        Cc.info("info",{a:1});
        Cc.infoc(this,"infoc",{a:1});
        Cc.infow("infow",{a:1});
        Cc.infoj("infoj",{a:1});
        Cc.infocw(this,"infocw",{a:1});
        Cc.infocj(this,"infocj",{a:1});
        Cc.infowj("infowj",{a:1});
        Cc.infocwj(this,"infocwj",{a:1});
    
        Cc.yellow("yellow",{a:1});
        Cc.yellowc(this,"yellowc",{a:1});
        Cc.yelloww("yelloww",{a:1});
        Cc.yellowj("yellowj",{a:1});
        Cc.yellowcw(this,"yellowcw",{a:1});
        Cc.yellowcj(this,"yellowcj",{a:1});
        Cc.yellowwj("yellowwj",{a:1});
        Cc.yellowcwj(this,"yellowcwj",{a:1});
    
        Cc.purple("purple",{a:1});
        Cc.purplec(this,"purplec",{a:1});
        Cc.purplew("purplew",{a:1});
        Cc.purplej("purplej",{a:1});
        Cc.purplecw(this,"purplecw",{a:1});
        Cc.purplecj(this,"purplecj",{a:1});
        Cc.purplewj("purplewj",{a:1});
        Cc.purplecwj(this,"purplecwj",{a:1});
        
        Cc.debug("debug",{a:1});
        Cc.debugc(this,"debugc",{a:1});
        Cc.debugw("debugw",{a:1});
        Cc.debugj("debugj",{a:1});
        Cc.debugcw(this,"debugcw",{a:1});
        Cc.debugcj(this,"debugcj",{a:1});
        Cc.debugwj("debugwj",{a:1});
        Cc.debugcwj(this,"debugcwj",{a:1});      
        
        Cc.tool("tool",{a:1});
        Cc.toolc(this,"toolc",{a:1});
        Cc.toolw("toolw",{a:1});
        Cc.toolj("toolj",{a:1});
        Cc.toolcw(this,"toolcw",{a:1});
        Cc.toolcj(this,"toolcj",{a:1});
        Cc.toolwj("toolwj",{a:1});
        Cc.toolcwj(this,"toolcwj",{a:1});     
        
        Cc.warn("warn",{a:1});
        Cc.warnc(this,"warnc",{a:1});
        Cc.warnw("warnw",{a:1});
        Cc.warnj("warnj",{a:1});
        Cc.warncw(this,"warncw",{a:1});
        Cc.warncj(this,"warncj",{a:1});
        Cc.warnwj("warnwj",{a:1});
        Cc.warncwj(this,"warncwj",{a:1});      
        
        Cc.error("error",{a:1});
        Cc.errorc(this,"errorc",{a:1});
        Cc.errorw("errorw",{a:1});
        Cc.errorj("errorj",{a:1});
        Cc.errorcw(this,"errorcw",{a:1});
        Cc.errorcj(this,"errorcj",{a:1});
        Cc.errorwj("errorwj",{a:1});
        Cc.errorcwj(this,"errorcwj",{a:1});      
        
        Cc.fatal("fatal",{a:1});
        Cc.fatalc(this,"fatalc",{a:1});
        Cc.fatalw("fatalw",{a:1});
        Cc.fatalj("fatalj",{a:1});
        Cc.fatalcw(this,"fatalcw",{a:1});
        Cc.fatalcj(this,"fatalcj",{a:1});
        Cc.fatalwj("fatalwj",{a:1});
        Cc.fatalcwj(this,"fatalcwj",{a:1});
        
        
//        Cc.logcwj(this,{a:1, c:3, e:"zzy", b:true});
//        Cc.logcwj(this,{a: {a1:1, a2:7, a3:14}, b:{b1:2}});
//        Cc.logcwj(this,[[1,3,7,3,18],[11,31,71,13,118]]);
        
//        addEventListener(Event.ENTER_FRAME, spam);
    }
    
    private function spam(event:Event = null):void {
        if(++frameCounter >= SPAM_FRAME){
            Cc.log(Utils.getRandom(0,1000000));
            frameCounter = 0;
        }
        
    }
}
}
