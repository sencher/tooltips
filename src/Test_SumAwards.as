package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;

import legacy.sumAwards;

public class Test_SumAwards extends Sprite {
    public function Test_SumAwards() {
        Cc.start(this);
        Cc.visible = true;
        
        var a1:Array = [
            {
                "id": null,
                "planeID": 3303,
                "type": "crew",
                "ui": {"mainSkillID": 1, "planeID": 3303, "skillPoints": 1},
                "value": 1
                
            },
            {
                "id": null,
                "planeID": 2,
                "type": "garbage",
                "ui": {"mainSkillID": 1, "planeID": 2, "skillPoints": 0},
                "value": 1
                
            },
            {
                "id": null,
                "planeID": 1111,
                "type": "crew",
                "ui": {"mainSkillID": 1, "planeID": 1111, "skillPoints": 0},
                "value": 1
                
            },
            {
                "id": null,
                "planeID": 2505,
                "type": "crew",
                "ui": {"mainSkillID": 1, "planeID": 2505, "skillPoints": 5},
                "value": 1
                
            },
            {
                "id": null,
                "planeID": 55,
                "type": "crew",
                "ui": {"mainSkillID": 1, "planeID": 55, "skillPoints": 5},
                "value": 1
                
            }];
        
        var a2:Array = sumAwards(a1);
        trace(a2);
    }
}
}
