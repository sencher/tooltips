package wowp.utils.display
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import scaleform.clik.utils.ConstrainedElement;
	import scaleform.clik.utils.Constraints;
	
	public class ConstraintsInteger extends Constraints
	{
		
		public function ConstraintsInteger(scope:Sprite, scaleMode:String = "counterScale")
		{
			super(scope, scaleMode);
		}
		
		override public function update(width:Number, height:Number):void
		{
			super.update(width, height);
			var clip:DisplayObject;
			for (var n:String in elements)
			{
				clip = (elements[n] as ConstrainedElement).clip;
				//trace(clip.name + " " + n + " from " + clip.x + " " + clip.y);
				clip.x = Math.round(clip.x);
				clip.y = Math.round(clip.y);
				//trace(clip.name + " " + n + " to " + clip.x + " " + clip.y);
			}
		}
	}

}