package {
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.utils.describeType;

    public class Test_DescribeType extends Sprite{
        public function Test_DescribeType() {
            var classAsXML:XML = describeType(new TextField());
            var list : XMLList = classAsXML.*;
            var propMap : Object = new Object();
            var item : XML;

            for each (item in list) {
                var itemName : String = item.name().toString();
                switch(itemName) {
                    case "variable":
                        propMap[item.@name.toString()] = item.@type.toString();
                        break;
                    case "accessor":
                        var access : String = item.@access;
                        if((access == "readwrite") || (access == "writeonly")) {
                            propMap[item.@name.toString()] = item.@type.toString();
                        }
                        break;
                }
            }

// Output the contents of the propMap object
            for (var prop:String in propMap)
            {
                trace(prop, "-", propMap[prop]);
            }

        }
    }
}
