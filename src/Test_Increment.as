package {

import flash.display.Sprite;

public class Test_Increment extends Sprite {
    public function Test_Increment() {
        //The following example uses ++ as a pre-increment operator in a while loop to show that the value added to the array is the value that has been incremented:
        var preInc:Array = new Array();
        var i:int = 0;
        while (i < 10) {
            preInc.push(++i);
        }
        trace(preInc); // 1,2,3,4,5,6,7,8,9,10
        
        
        //The following example uses ++ as a post-increment operator in a whileloop to show that the value added to the array is the initial value:
        
        var postInc:Array = new Array();
        i = 0;
        while (i < 10) {
            postInc.push(i++);
        }
        trace(postInc); // 0,1,2,3,4,5,6,7,8,9
        
        
        //The following example uses ++ as a post-increment operator to make a whileloop run five times:
        i = 0;
        while (i++ < 5) {
            trace("this is execution " + i);
        }
        /* output:
           this is execution 1
           this is execution 2
           this is execution 3
           this is execution 4
           this is execution 5
        */
        trace("****************");
        
        i = 0;
        do {
            trace("this is execution " + i);
        } while (i++ < 5);
        
        
        var counterA:int, counterB:int;
        for (i = 0; i < 3; i++) {
            log(++counterA);// plus before function
            log(counterB++);// plus after function
            trace("***");
        }
        trace(counterA, counterB);
        
        
    }
    
    private function log(value:int):void {
        trace("log:", value);
    }
}
}
