package wowp.utils.object {

import flash.utils.describeType;

public function mergeObjects(receiver:Object, source:Object, overrideMain:Boolean = false):void {
    var classAsXML:XML = describeType(receiver);
    if (classAsXML.@isDynamic.toString() == "true") {
        var i:Object;
        for (i in source) {
            if (overrideMain || !receiver[i]) {
                receiver[i] = source[i];
            }
        }
    } else {
        var list:XMLList = classAsXML.*;
        var propMap:Object = new Object();
        var item:XML;
        
        for each (item in list) {
            var itemType:String = item.name().toString();
            var itemName:String = item.@name.toString();
            var itemAccess:String = item.@access.toString();
            if (itemName == "metaData" || (itemType == "accessor" && itemAccess != "readwrite")) continue;
            
            switch (itemType) {
                case "variable":
                case "accessor":
                    if (source.hasOwnProperty(itemName)) {
                        if (overrideMain || !receiver[itemName]) {
                            receiver[itemName] = source[itemName];
                        }
                    }
                    propMap[item.@name.toString()] = item.@type.toString();
                    break;
            }
        }
    }
}
}
