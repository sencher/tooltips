package {

import flash.display.Sprite;

public class Test_SortOnLetterPriorityVector extends Sprite {
    
    private var sortPriority:String = "crvl";
    private var data:Vector.<PrizeVO> = new Vector.<PrizeVO>();
    
    public function Test_SortOnLetterPriorityVector() {
        trace( 5 - Math.ceil(301 / 100),Math.ceil(301 / 100));
        
        data.push(new PrizeVO(1, "common"));
        data.push(new PrizeVO(2, "veryrare"));
        data.push(new PrizeVO(3, ""));
        data.push(new PrizeVO(4, "legendary"));
        data.push(new PrizeVO(5, "common"));
        data.push(new PrizeVO(6, "rare"));
        data.push(new PrizeVO(7, "bullshit"));
        
        data.sort(sortByPriority);
        trace(data);
    }
    
    private function sortByPriority(a:PrizeVO, b:PrizeVO):Number{
        var aIndex:int = sortPriority.indexOf(a.rarity.charAt(0));
        var bIndex:int = sortPriority.indexOf(b.rarity.charAt(0));
        
        return bIndex - aIndex;
    }
}
}

class PrizeVO{
    public var id:int;
    public var rarity:String;
    
    function PrizeVO(id:int, rarity:String){
        this.id = id;
        this.rarity = rarity;
    }
    
    public function toString():String {
//        return "id:"+id+"/rarity:"+rarity;
        return id+"/"+rarity;
    }
}
