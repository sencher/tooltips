package {

import com.junkbyte.console.Cc;

import mx.utils.ObjectUtil;

import utils.Utils;

public class Test_ObjectClone extends BaseTest {
    private static var debug:Boolean = true;
    
    public function Test_ObjectClone() {
        showConsole();
        Cc.green2(debug);
        var str:String = "aaa/bbb\ccc";
        var split:Array = str.split(".");
        Cc.sky(split);
        Cc.sky(split[1]);
        Utils.drawGrid(stage,25);
        var c1:Object = {id: "child1"};
        var c2:Object = {id: "child2"};
        var c3:Object = {id: "child3"};
        var c4:Object = {id: "child4"};
        var c5:Object = {id: "child5"};
        var o1:Object = {"c1.swf": c1, "c2.swf": c2, "c3.dds": c3, "c4.dds": c4, "c5.xml": c5};
        Cc.green2("original:", o1);
        Cc.green2("copy:", ObjectUtil.copy(o1));
        Cc.green2("clone:", ObjectUtil.clone(o1));
        Cc.green2("copyAndSortByExtension:", copyAndSortByExtension(o1));
        Cc.green2("sortByExtension:", sortByExtension(o1));
        delete o1["c2.swf"];
        o1["c4.dds"].id = "changed!";
    }
    
    private const EXTENSION:RegExp = /(.*)\.(.*)/;
    public function copyAndSortByExtension(value:Object):Object{
        var extension:String;
        var result:Object = {};
        var copy:Object = ObjectUtil.copy(value);
        for(var key:* in copy){
            extension = key.split(".")[1];
            if(extension){
                if(!result[extension]){
                    result[extension] = {};
                }
                result[extension][key] = copy[key];
            }
        }
        
        return result;
    }
    
    public function sortByExtension(value:Object):Object{
        var extension:String;
        var result:Object = {};
        for(var key:* in value){
            extension = key.split(".")[1];
            if(extension){
                if(!result[extension]){
                    result[extension] = {};
                }
                result[extension][key] = value[key];
            }
        }
        
        return result;
    }
}
}
