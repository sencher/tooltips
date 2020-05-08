package {
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;

import utils.Utils;

public class Test_SimulateClick extends Sprite {
	private var button:Sprite;
	public function Test_SimulateClick() {
		button = Utils.createButton();
		button.addEventListener(MouseEvent.CLICK, onClick);
		addChild(button);
		button.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		
		var myObjects: Array = stage.getObjectsUnderPoint(new Point(5, 5));
		trace(myObjects);
		
		myObjects = stage.getObjectsUnderPoint(new Point(120, 120));
		trace(myObjects);
		myObjects[0].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
	}
	
	private function onClick(event:MouseEvent):void {
		trace("click", event.target, event.currentTarget);
	}
}
}
