package {
import flash.display.Sprite;
import flash.events.Event;

public class Test_AddChild extends Sprite{
    public function Test_AddChild() {
        addEventListener(Event.ADDED_TO_STAGE, addedToS)
        addEventListener(Event.ADDED, added)
        addEventListener(Event.REMOVED_FROM_STAGE, removedFS)
        addEventListener(Event.REMOVED, removed)
        var s:Sprite = new Sprite();
        addChild(s);
        removeChild(s);

    }

    private function removedFS(event:Event):void {
        trace("removedFS")
    }

    private function addedToS(event:Event):void {
        trace("addedToS")
    }

    private function removed(event:Event):void {
        trace("removed")
    }

    private function added(event:Event):void {
        trace("added")
    }
}
}
