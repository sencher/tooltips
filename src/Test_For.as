package {
import flash.display.Sprite;

public class Test_For extends Sprite {
    public function Test_For() {
        super();
        setStars(1,3.25)

    }

    private function setStars(startId:int, endId:Number = 15):void {
        var j:int;
        for (j = startId; j <= endId; j++){
            trace(j)
//            switch (mode){
//                case HIDDEN:
//                    currentStarMc.visible = false;
//                    break;
//                case COMPLETED:
////							trace("!!!!!!!",currentStarMc.name,2)
//                    currentStarMc.gotoAndStop(2);
//                    break;
//                default:
//                    break;
        }
        trace(j,endId)
        if(endId%1 > 0){

        }
        }

    }
}
