package
{
import Interfaces.File1;

import flash.sampler.*;
import flash.system.*;
import flash.display.Sprite;
public class Test_Private extends Sprite
{
    public function Test_Private()
    {
        var f1:File1 = new File1();
        var name_iter = getMemberNames(f1);
        var o:Object = {};
        for each(var name:QName in name_iter) {
            trace("******")
            trace(name)
            if(name){
                trace(name.localName)
                if(name.localName == "a")
                {
                    var a:int = int(name);
                }
//                    trace("777777 " + f1["a"])
            }
            //o[name.localName] = "got it";
        }

        name_iter = getMemberNames(this);
        var count=0;
        for(var dum in name_iter) {
            count++;
        }
        trace(count == 1);

        // my member
        trace("buttonMode" in o);
        // inherited member
        trace("filters" in o);
        // inherited function
        trace("dispatchEvent" in o);

        var name_iter = getMemberNames(Test_Private, true);
        var o={};
        for each(var name:QName in name_iter) {
            o[name.localName] = "got it";
        }

        // my member
        trace("buttonMode" in o);
        // inherited member
        trace("filters" in o);
        // inherited function
        trace("dispatchEvent" in o);

    }
}
}