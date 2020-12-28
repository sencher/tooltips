package utils.wg.utils.display
{
	import flash.display.DisplayObject;
	
	public function setVisibility(value:Boolean, ...rest):void {
		for each(var d:DisplayObject in rest) {
			if (d) d.visible = value;
		}
	}
	
}
