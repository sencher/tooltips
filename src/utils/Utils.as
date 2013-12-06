package utils {
    import flash.display.MovieClip;
    import flash.events.Event;

    public class Utils {
        public static function trEvent(event:Event):void {
            trace(event.currentTarget.name , event.type);
        }

        public static function trAllChilds(mc:MovieClip){
            for (var i:uint = 0; i < mc.numChildren; i++){
                trace ('\t|\t ' +i+'.\t name:' + mc.getChildAt(i).name + '\t type:' + typeof (mc.getChildAt(i))+ '\t' + mc.getChildAt(i));
            }
        }
    }
}
