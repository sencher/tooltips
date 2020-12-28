package utils.wg.utils.display
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	

	public function centerOnStage(d:DisplayObject):void 
	{
		if (d.stage != null)
		{
			d.x = int(d.stage.stageWidth / 2 - d.width / 2);
			d.y = int(d.stage.stageHeight / 2 - d.height / 2);
		}
	}


}