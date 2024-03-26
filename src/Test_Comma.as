package {

import flash.display.Sprite;

public class Test_Comma extends Sprite {
    public function Test_Comma() {
        
        var i:int, j:int;
        
        //The following example uses the comma (,) operator in a for loop:
        for (i = 0, j = 0; i < 3 && j < 3; i++, j += 2) {
            trace("i = " + i + ", j = " + j);
        }
        // output:
        // i = 0, j = 0
        // i = 1, j = 2
        
        
        //The following example uses the comma operator without the parentheses operator to show that the comma operator is of lower precedence than the assignment (=) operator:
        var v:Number = 0;
        v = 4, 5, 6;
        trace(v); // 4
        
        
        //The following example uses the comma operator with parentheses and illustrates that the comma operator returns the value of the last expression:
        var v:Number = 0;
        v = (4, 5, 6);
        trace(v); // 6
        
        
        //The following example uses the comma operator without parentheses and illustrates that the comma operator causes all of the expressions to be evaluated sequentially. The first expression, v + 4, is assigned to the variable v because the assignment (=) operator is of higher precedence than the comma operator. The second expression, z++, is evaluated and z is incremented by one.
        var v:Number = 0;
        var z:Number = 0;
        v = v + 4 , z++, v + 6;
        trace(v); // 4
        trace(z); // 1
        
        
        //The following example is identical to the previous example except for the addition of parentheses, which changes the order of operations such that the comma operator is evaluated before the assignment (=) operator:
        var v:Number = 0;
        var z:Number = 0;
        v = (v + 4, z++, v + 6);
        trace(v); // 6
        trace(z); // 1
    }
}
}
