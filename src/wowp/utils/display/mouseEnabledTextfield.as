package wowp.utils.display
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;
	
	public function mouseEnabledTextfield(mc:DisplayObjectContainer, isEnabled:Boolean = false):void 
	{
		if (!mc) return;
			
		var child:DisplayObject;
		var len:int = mc.numChildren;
		var tf:TextField;
		for (var i:int = 0; i < len; i++)
		{
			child = mc.getChildAt(i);
			if (child is TextField)
			{
				tf = child as TextField;
				tf.mouseEnabled = isEnabled;
			}
		}
	}
	
}