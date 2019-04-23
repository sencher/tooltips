package {
import by.blooddy.crypto.serialization.JSONer;

import com.adobe.serialization.json.JSON;

import flash.display.Sprite;

public class Test_JsonToObject extends Sprite {
    public function Test_JsonToObject() {
        //default
        var jsonString:String = '{"asteroids":[[2500,2500,500,500,0,6]],"slow":[[2000,2000,200,300,0,6],[3000,3000,200,300,0,6]],"invisibility":[[1000,1000,200,300,0,6]]}';
//        var o:Object = JSON.parse(jsonString);
//        trace(o);
//        var decodedString:String = JSON.stringify(o);
//        trace(decodedString);

        //bloody
//        var o2:Object = JSONer.parse(jsonString);
//        trace(o2);
//        var decodedString2:String = JSONer.stringify(o);
//        trace(decodedString2);

//        var result:Object = by.blooddy.crypto.serialization.JSONer.parse( jsonString );
//        trace(result)

        var o3 = com.adobe.serialization.json.JSON.decode(jsonString);
        trace(o3);
        var s3 = com.adobe.serialization.json.JSON.encode(o3);
        trace(s3);

    }
}
}
