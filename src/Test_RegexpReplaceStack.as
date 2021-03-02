package {
import com.junkbyte.console.Cc;

import flash.display.Sprite;

public class Test_RegexpReplaceStack extends Sprite {
    public function Test_RegexpReplaceStack() {
        Cc.start(this);
//        var stack:String = "at scaleform.clik.controls::ListItemRenderer/setData()[D:\\Projects\\ml21\\game\\hammer\\src\\source_AS3;wowp\\hangar\\view\\award;QuestAwardRenderer.as:69]\n" +
//                "at wowp.utils.data.factory::ByClassFactory/getItem()[D:\\Projects\\ml21\\game\\hammer\\src\\source_AS3;wowp\\utils\\data\\factory;ByClassFactory.as:21]\n" +
//                "at wowp.hangar.messages.items::SystemMessageItemFactory/build()[D:\\Projects\\ml21\\game\\hammer\\src\\source_AS3;wowp\\hangar\\messages\\items;SystemMessageItemFactory.as:41]";

//        var simple:String = "at Test_RegexpReplaceStack/second()[D:\\Projects\\tooltips\\src\\Test_RegexpReplaceStack.as:28]\n" +
//            "at Test_RegexpReplaceStack/first()[D:\\Projects\\tooltips\\src\\Test_RegexpReplaceStack.as:24]\n" +
//            "at Test_RegexpReplaceStack()[D:\\Projects\\tooltips\\src\\Test_RegexpReplaceStack.as:20]";
    
        var simple:String = "at Test_RegexpReplaceStack/second()[D:\\Projects\\tooltips\\src\\Test_RegexpReplaceStack.as:28]\n";
        var stack:String = "at scaleform.clik.controls::ListItemRenderer/setData()[D:\\Projects\\ml21\\game\\hammer\\src\\source_AS3;wowp\\hangar\\view\\award;QuestAwardRenderer.as:69]\n";
        
        var pattern:RegExp = /^.*(::| )(.*\)).*(;|\\)(.*)\]$/g;
        
//        var result:String = stack.replace(pattern, replFN);
        var result:String = simple.replace(pattern, "$2 $4");
        var result2:String = stack.replace(pattern, "$2 $4");
        trace(result);
        trace(result2);
        first();
    }
    
    private function first():void {
        second();
    }
    
    private function second():void {
        Cc.logw("info");
    }
    
    private function replFN():String {
        return arguments[1] + arguments[2];
    }
}
}
