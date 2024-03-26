package {

import com.junkbyte.console.Cc;
import com.junkbyte.console.Ct;
import com.junkbyte.console.core.ConsoleUtils;

import flash.display.Sprite;
import flash.text.TextField;

[SWF(width="800", height="800")]
public class Test_Console extends Sprite {
    
    private var tf:TextField = new TextField();
    private const TEXT:String = "-123–我—abc多用途战斗机";
    
    public function Test_Console() {
//        Cc.config.style.whiteBase();
        Cc.start(this);
        Cc.visible = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
        Cc.width = stage.stageWidth;
        Cc.height = stage.stageHeight;
        Cc.commandLine = true;
        
//        Ct.logc(this, "logc", {arr:[1,7,8], str:"string"}, 789);
//        Ct.bluec(this, "bluec", {arr:[1,7,8], str:"string"}, 789);
//        Ct.infoc(this, "infoc", {arr:[1,7,8], str:"string"}, 789);
//        Ct.yellowc(this, "yellowc", {arr:[1,7,8], str:"string"}, 789);
//        Ct.purplec(this, "purplec", {arr:[1,7,8], str:"string"}, 789);
//        Ct.debugc(this, "debugc", {arr:[1,7,8], str:"string"}, 789);
//        Ct.toolc(this, "toolc", {arr:[1,7,8], str:"string"}, 789);
//        Ct.warnc(this, "warnc", {arr:[1,7,8], str:"string"}, 789);
//        Ct.errorc(this, "errorc", {arr:[1,7,8], str:"string"}, 789);
//        Ct.fatalc(this, "fatalc", {arr:[1,7,8], str:"string"}, 789);
        
        Cc.green2("dsfdsf\naaaa");
    
        tf.border = true;
        tf.y = 300;
        addChild(tf);
        tf.htmlText = TEXT;
        
//        Cc.log(TEXT);
//        Cc.log(tf.text);
//        Cc.log(tf.htmlText);
    
        func1();
        
//        var o = {a:1,b:2,c:3}
//        var a = ["a",17,{kk:"gg"}]
//        var a2 = ["a",17,{kk:"gg", zz:{zalupa:"konya"},data:[{ebana:"v rot", mars:"snickers",e:4},{aha:"cool"}]},14,4];
//        var a3:Array = [[4,6], [2,8]];
//        Cc.logj( []);
//        Cc.logj( [[1,7]]);
//        Cc.logj( o);
//        Cc.logj( a);
//        Cc.logj( a2);
//        Cc.logj( a3);
        //trace(JSON.stringify(a3, "a", "b"));
        
//        Cc.log(ConsoleUtils.formatJsonString("[\"a\",17,{kk:\"gg\", zz:{zalupa:\"konya\"},data:[{ebana:\"v rot\", mars:\"snickers\",e:4}]}]"));
//        Cc.log(ConsoleUtils.formatJsonString("[\"a\",17,{kk:\"gg\", zz:{zalupa:\"konya\"},data:[{ebana:\"v rot\", mars:\"snickers\",e:4}]}]"));
    }
    
    private function func1():void{
        func2();
    }
    
    private function func2():void {
        Ct.berryc(this, "berryc", {arr:[1,7,8], str:"string"}, 789);
        Ct.bluec(this, "bluec", {arr:[1,7,8], str:"string"}, 789);
        Ct.blue2c(this, "blue2c", {arr:[1,7,8], str:"string"}, 789);
        Ct.brownc(this, "brownc", {arr:[1,7,8], str:"string"}, 789);
        Ct.cyancw(this, "cyancw", {arr:[1,7,8], str:"string"}, 789);
        Ct.grassj(this, "grassj", {arr:[1,7,8], str:"string"}, 789);
        Ct.grass2c(this, "grass2c", {arr:[1,7,8], str:"string"}, 789);
        Ct.greenc(this, "greenc", {arr:[1,7,8], str:"string"}, 789);
        Ct.green2wj(this, "green2wj", {arr:[1,7,8], str:"string"}, 789);
        Ct.greyc(this, "greyc", {arr:[1,7,8], str:"string"}, 789);
        Ct.grey2c(this, "grey2c", {arr:[1,7,8], str:"string"}, 789);
        Ct.magenta("magenta", {arr:[1,7,8], str:"string"}, 789);
        Ct.orangec(this, "orangec", {arr:[1,7,8], str:"string"}, 789);
        Ct.pinkc(this, "pinkc", {arr:[1,7,8], str:"string"}, 789);
        Ct.purplec(this, "purplec", {arr:[1,7,8], str:"string"}, 789);
        Ct.redc(this, "redc", {arr:[1,7,8], str:"string"}, 789);
        Ct.red2c(this, "red2c", {arr:[1,7,8], str:"string"}, 789);
        Ct.red3c(this, "red3c", {arr:[1,7,8], str:"string"}, 789);
        Ct.skycj(this, "skycj", {arr:[1,7,8], str:"string"}, 789);
        Ct.sky2cwj(this, "sky2cwj", {arr:[1,7,8], str:"string"}, 789);
        Ct.tealc(this, "tealc", {arr:[1,7,8], str:"string"}, 789);
        Ct.teal2c(this, "teal2c", {arr:[1,7,8], str:"string"}, 789);
        Ct.white("white", {arr:[1,7,8], str:"string"}, 789);
        Ct.yellowc(this, "yellowc", {arr:[1,7,8], str:"string"}, 789);
        Ct.yellow2c(this, "yellow2c", {arr:[1,7,8], str:"string"}, 789);
    }
}
}
