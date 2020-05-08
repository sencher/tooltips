package {

import flash.display.Sprite;

import utils.Utils;

public class Test_RegexpCheck extends Sprite {

    public function Test_RegexpCheck() {
        var s:String = "dog123";
        var regNum:RegExp = /[0-9]/;

        trace("String: " + s);

        // one-off check using the 'new RegExp' class
        trace("Char 2 is a letter = " + (new RegExp("[A-Za-z]")).test(s.substr(1, 1)));

        // looped check using RegExp var created above
        for (var i:int = 0; i < s.length; i++) {
            trace("Char " + (String(i + 1)) + " is a number = " + regNum.test(s.substr(i, 1)));
        }

        // set a boolean with the result of the RegExp test
        var stringIsNumber:Boolean = new RegExp("[0-9]").test(new String("A"));
        trace("'A' is a number = " + stringIsNumber);

        trace(Utils.isNumber("4"));
        trace(Utils.isNumber("A"));
        trace(Utils.isNumber(""));
        trace(Utils.isUpperCase("4"));
        trace(Utils.isUpperCase("A"));
        trace(Utils.isUpperCase(""));
        trace(Utils.isLowerCase("4"));
        trace(Utils.isLowerCase("A"));
        trace(Utils.isLowerCase("a"));
    }
}
}
