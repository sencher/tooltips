package wowp.utils.display
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	public function fixGlobalCoords(d:DisplayObject):void {
		if (d && d.parent) {
			var p:Point = d.parent.localToGlobal(new Point(d.x, d.y));
			var delta:Number = 0;
			if (p.x > 0) {
				delta = p.x - int(p.x);
			} else {
				delta = int(p.x) - p.x;
			}
			
			if (delta != 0) {
				d.x += delta;
			}
			
			if (p.y > 0) {
				delta = p.y - int(p.y);
			} else {
				delta = int(p.y) - p.y;
			}
			
			if (delta != 0) {
				d.y += delta;
			}
		}
	}
	
}
