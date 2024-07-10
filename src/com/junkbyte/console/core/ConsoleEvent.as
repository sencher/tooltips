package com.junkbyte.console.core {

import flash.events.Event;

public class ConsoleEvent extends Event {
    public static const UPDATE_JSON_PANEL:String = "updateJsonPanel";
    public var data:*;
    
    public function ConsoleEvent(type:String, data:*, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
        this.data = data;
    }
    
    public override function clone():Event {
        return new ConsoleEvent(type, data, bubbles, cancelable);
    }
}
}
