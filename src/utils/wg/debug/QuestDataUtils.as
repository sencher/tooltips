package utils.wg.debug {

import com.junkbyte.console.Cc;

import wowp.hangar.quests.models.vo.QuestData;

public class QuestDataUtils {
    public static function getShortInfo(value:*) {
        if(!value || !value.length) return;
        
        var result:String = "";
        var questData:QuestData;
        var nested:Array;
        for(var i:int = 0; i < value.length; i++){
            if(value[i] is QuestData){
                questData = QuestData(value[i]);
                result += questData.shortInfo() + "\n\n";
                nested = questData.getAllNested();
                for(var n:int = 0; n < nested.length; n++){
                    result += "\t" + nested[n].shortInfo() + "\n\n";
                }
            }else{
                result += "\t" + value[i] + "\n\n";
            }
        }
        
        Cc.tool(result);
    }
}
}
