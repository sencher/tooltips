package com.junkbyte.console.view {
public class ConsoleScrollState {
    
    public var scrollV:int;
    public var scrollPercent:Number;
    public var scrollVisible:Boolean;
    public var atBottom:Boolean;
    
    public function ConsoleScrollState(scrollV:int = 0, scrollPercent:Number = 0, scrollVisible:Boolean = false, atBottom:Boolean = false) {
        this.scrollV = scrollV;
        this.scrollPercent = scrollPercent;
        this.scrollVisible = scrollVisible;
        this.atBottom = atBottom;
    }
}
}