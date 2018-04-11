package {
import flash.display.Sprite;
import flash.utils.Dictionary;

import utils.Utils;

public class Test_DictionaryKeys extends Sprite {
    public function Test_DictionaryKeys() {
        var d:Dictionary = new Dictionary();
        var s:Sprite = new Sprite();
        d[1] = {first:true};
        d[s] = "asd_sprite";
        d["zazo"] = 19;
        Utils.traceDictionaryKeys(d);

    }
}
}
