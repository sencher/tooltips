package utils.wg.debug {

import wowp.settings.views.events.DataEvent;

public class DebugEvent extends DataEvent{
    
    public static const MINIMUM:String = "minimum";
    public static const MAXIMUM:String = "maximum";
    public static const VALUE:String = "value";
    public static const POSITION:String = "position";
    public static const SET_GOLD:String = "set_gold";
    public static const SET_SILVER:String = "set_silver";
    public static const SET_EXPERIENCE:String = "set_experience";
    
    public function DebugEvent(type:String, data:*, bubbles:Boolean=false, cancelable:Boolean=false) {
        super(type, data, bubbles, cancelable);
    }
}
}
