package utils {
    import flash.display.MovieClip;
    import flash.events.Event;

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
    }
}
