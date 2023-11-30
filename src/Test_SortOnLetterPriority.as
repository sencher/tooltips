package {

import flash.display.Sprite;

public class Test_SortOnLetterPriority extends Sprite {
    private var sortPriority:String = "crvl";
    private var data:Array = ["common","veryrare","","legendary","common","rare","bullshit"];
    public function Test_SortOnLetterPriority() {
        data.sort(sortByPriority);
        trace(data);
    }
    
    private function sortByPriority(a:String, b:String):Number{
        var aIndex:int = sortPriority.indexOf(a.charAt(0));
        var bIndex:int = sortPriority.indexOf(b.charAt(0));
        
        return bIndex - aIndex;
    }
}
}

