package {

public class Task_Palindrome extends BaseTest {

    private var array:Array = ["шалаш", "дерево", "Анна", 0110, 0101, "А муза рада музе без ума да разума", "Поебень Поебень Поебень", '"Пустите!" - Летит супу миска Максиму. - "Пустите, летит суп!"', 12321];
    
    public function Task_Palindrome() {
        for each (var e in array) {
            log(check(e), e);
        }
    }
    
    private function check(value:*):Boolean {
//        return value == String(value).replace(/[^\p{L}]/gu, '').toLowerCase().split("").reverse().join("");

//        var d = String(value)
//                .toLowerCase()
//                .replace(/\s|[,.!?"/-]/g, '')
    
        value = value
                .toString()
                .toLowerCase()
                .replace(/\s|[,.!?"/-]/g, "");
        
        
        return value == value
                .split("")
                .reverse()
                .join("");
    }
}
}
