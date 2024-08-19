package {

import flash.display.Sprite;

public class Test_RegexpCapturePart extends BaseTest {
    public function Test_RegexpCapturePart() {
        var formalGreeting:String = "Hello, John Smith.";
        log(informalizeGreeting(formalGreeting));    // Hi, John.
        
        var validEmail:String = "name@domain.com";
        log(validateEmail(validEmail));        // true
        
        var invalidEmail:String = "foo";
        log(validateEmail(invalidEmail));  // false
        
        var validPhoneNumber:String = "415-555-1212";
        log(validatePhoneNumber(validPhoneNumber));    // true
        
        var invalidPhoneNumber:String = "312-867-530999";
        log(validatePhoneNumber(invalidPhoneNumber));  // false
    }
    
    private function informalizeGreeting(str:String):String {
        var pattern:RegExp = new RegExp("hello, (\\w+) \\w+", "i");
        return str.replace(pattern, "Hi, $1");
    }
    
    private function validateEmail(str:String):Boolean {
        var pattern:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
        var result:Object = pattern.exec(str);
        if (result == null) {
            return false;
        }
        return true;
    }
    
    private function validatePhoneNumber(str:String):Boolean {
        var pattern:RegExp = /^\d{3}-\d{3}-\d{4}$/;
        var result:Object = pattern.exec(str);
        if (result == null) {
            return false;
        }
        return true;
    }
}
}