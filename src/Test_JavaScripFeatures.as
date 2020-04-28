package {
import flash.display.Sprite;

public class Test_JavaScripFeatures extends Sprite {
    public function Test_JavaScripFeatures() {

//        var x = 0;
//        for(;x<3;){
//            trace(x++);
//        }

//        outer: for (var i = 0; i < 3; i++) {
//            for (var j = 0; j < 3; j++) {
//                if (i==1) {
//                    continue outer;
//                }
//                trace(i,j);
//            }
//        }

//        var i = 0;
//        while (++i < 5) trace(i);
//        i = 0;
//        while (i++ < 5) trace(i);

//        showMessage("lala", 1);

//        function doNothing():void { /* пусто */ }
//        trace( doNothing() === undefined ); // true

        function sayHi() {
            trace( "Привет" );
        }

        trace( sayHi ); // выведет код функции
    }

//    private function showMessage(from, text = anotherFunction()) {
//        // anotherFunction() выполнится только если не передан text
//        // результатом будет значение text
//        trace( from + ": " + text );
//    }
//
//    private function anotherFunction():String {
//        return "111";
//    }
}
}
