package {
import flash.display.Sprite;

public class Array3dTest extends Sprite {
    private static const STUCKS:String = 'stucks';
    private static const BLA:String = 'bla';
    
    public function Array3dTest() {
        var id1:Sprite = new Sprite();
        id1.name = "1";
        var id2:Sprite = new Sprite();
        id2.name = "2";
        
        var model:Array = modelCreate();
        modelSet(model, id1, STUCKS, 5);
        modelSet(model, id1, BLA, 8);
        modelSet(model, id1, STUCKS, 6);
        modelSet(model, id2, STUCKS, 2);
        modelSet(model, id2, BLA, 4);
        trace(modelGet(model, id1, STUCKS));
        trace(modelGet(model, id1, "sfdsdffsd"));
        trace(modelGet(model, "sdsad", "sfdsdffsd"));
        trace(modelGet(model, id2, STUCKS));
        trace(modelGet(model, id2, "sfdsdffsd"));
        trace(modelGet(model, id2, BLA));
        trace(modelGet(model, id1, BLA));
    }
    
    private function modelGet(model:Array, searchId:*, searchKey:String):* {
        for (var i = 0; i < model.length; i++) {
            var currentId = model[i][0];
            if(searchId == currentId){
                for (var p = 1; p < model[i].length; p++) {
                    if(searchKey == model[i][p][0]){
                        return model[i][p][1];
                    }
                }
                // No such key
                return;
            }
        }
        // No such id
        return;
    }
    
    private function modelSet(model:Array, searchId:*, searchKey:String, value:int):void {
        for (var i = 0; i < model.length; i++) {
            var currentId = model[i][0];
            if(searchId == currentId){
                for (var p = 1; p < model[i].length; p++) {
                    if(searchKey == model[i][p][0]){
                        model[i][p][1] = value;
                        return;
                    }
                }
                // No such key
                model[i].push([searchKey, value]);
                return;
            }
        }
        // No such id
        model.push([searchId, [searchKey, value]]);
    }
    
    private function modelCreate():Array {
//        return [[]];
        return [];
    }
}
}
