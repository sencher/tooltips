package utils {
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.utils.describeType;

    public class Utils {
        public static function trEvent(event:Event):void {
            trace(event.currentTarget.name, event.type);
        }

        public static function trAllChilds(mc:MovieClip):void {
            for (var i:uint = 0; i < mc.numChildren; i++) {
                trace('\t|\t ' + i + '.\t name:' + mc.getChildAt(i).name + '\t type:' + typeof (mc.getChildAt(i)) + '\t' + mc.getChildAt(i));
            }
        }


        public static function mergeObjects(main:Object, second:Object, override:Boolean = false):void {
            var i:Object;
            for (i in second) {
                if (override || !main[i]) {
                    main[i] = second[i];
                }
            }
        }

        public static function substractObjects(main:Object, second:Object):void {
            var i:Object;
            for (i in second) {
                delete main[i];
            }
        }

        public static function clone(source:*):*{
            var classAsXML:XML = describeType(source);
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

            var _class:Class = source.constructor;
            var result:* = new _class();

            for (var prop:String in propMap){
                result[prop] = source[prop];
            }
            return result;
        }
    }
}
