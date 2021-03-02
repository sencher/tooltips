package {
import com.junkbyte.console.Cc;

import flash.display.Sprite;

[SWF(width=1200)]
public class Test_RegexpReplaceStack extends Sprite {
    public function Test_RegexpReplaceStack() {
        Cc.start(this);
        Cc.width = stage.stageWidth;
        Cc.height = stage.stageHeight;
        
//        var stack:String = "at scaleform.clik.controls::ListItemRenderer/setData()[D:\\Projects\\ml21\\game\\hammer\\src\\source_AS3;wowp\\hangar\\view\\award;QuestAwardRenderer.as:69]\n" +
//                "at wowp.utils.data.factory::ByClassFactory/getItem()[D:\\Projects\\ml21\\game\\hammer\\src\\source_AS3;wowp\\utils\\data\\factory;ByClassFactory.as:21]\n" +
//                "at wowp.hangar.messages.items::SystemMessageItemFactory/build()[D:\\Projects\\ml21\\game\\hammer\\src\\source_AS3;wowp\\hangar\\messages\\items;SystemMessageItemFactory.as:41]";

//        var simple:String = "at Test_RegexpReplaceStack/second()[D:\\Projects\\tooltips\\src\\Test_RegexpReplaceStack.as:28]\n" +
//            "at Test_RegexpReplaceStack/first()[D:\\Projects\\tooltips\\src\\Test_RegexpReplaceStack.as:24]\n" +
//            "at Test_RegexpReplaceStack()[D:\\Projects\\tooltips\\src\\Test_RegexpReplaceStack.as:20]";
    
        var simple:String = "at Test_RegexpReplaceStack/second()[D:\\Projects\\tooltips\\src\\Test_RegexpReplaceStack.as:28]\n";
        var stack:String = "at scaleform.clik.controls::ListItemRenderer/setData()[D:\\Projects\\ml21\\game\\hammer\\src\\source_AS3;wowp\\hangar\\view\\award;QuestAwardRenderer.as:69]\n";
        
        var pattern:RegExp = /^.*(::| )(.*\)).*(;|\\)(.*)\]$/g;
        
//        var result:String = simple.replace(pattern, replFN);
//        var result2:String = stack.replace(pattern, replFN);
//        var result:String = simple.replace(pattern, "$2 $4");
//        var result2:String = stack.replace(pattern, "$2 $4");

        Cc.log(cutLongNames(simple));
        Cc.log(cutLongNames(stack));
//        Cc.log(simple.replace(pattern, replFN));
//        Cc.log(stack.replace(pattern, "$2 $4"));
//        Cc.log(stack.replace(pattern, replFN));
//        var o:Object = pattern.exec(simple);
//        Cc.log(o);
        

//        Cc.log(String("abcd").replace("a", "Z"));
//        Cc.log(String("abcd").replace(/a/, "Z"));
//        Cc.log(String("abcd").replace(/(a)/, "Z"));
//        Cc.log(String("abcd").replace(/(a)/, "$1"));
//        Cc.log(String("abcd").replace(/\w/g, "s"));
//        Cc.log(String("abcd").replace(/\w/g, "$1"));
//        Cc.log(String("abcd").replace(/\w/g, replFN));
        
//        var pattern2:RegExp = /(\w)(\w)(\w)(\w)/gi;
//        var test:String = "abcd";
//        var o:Array = pattern2.exec(test);
//        Cc.log(o);
//        var r = test.replace(pattern2, "$2$4");
//        Cc.log(r);
//        var r2 = test.replace(pattern2, replFN());
//        Cc.log("r2",r2);
//        var r3 = replFN(o);
//        Cc.log("r3",r3);
//
//        Cc.log("r4", cutLongNames(test));
        
        first();
    }
    
    private function first():void {
        second();
    }
    
    private function second():void {
        Cc.logw("info");
    }
    
    private function replFN(value:Array = null):String {
        Cc.log("FN",value);
        return value[2] + "__" + value[4];
    }
    
    private function cutLongNames(value:String):String{
        var o:Array = /^.*(::| )(.*\)).*(;|\\)(.*)\]$/g.exec(value);
        if(o && o[2] && o[4]){
            return o[2] + "__" + o[4];
        }else {
            return "cutLongNames null";
        }
    }
}
}
