package utils.wg.utils.display
{
	import flash.display.DisplayObject;
	public class ResizeHelper 
	{
		public static const TYPE_FLAG_MOVING:int = 1;
		public static const TYPE_FLAG_RESIZING:int = 2;

		protected var _elements:Array = [];
		
		public function ResizeHelper() 
		{
		}
		
		public function addElement(obj:DisplayObject, type:int):void
		{
			_elements.push(new MovingElement(obj, type));
		}
		
		public function initPositions():void
		{
			for each(var entry:MovingElement in _elements)
			{
				entry.initialX = int(entry.obj.x);
				entry.initialY = int(entry.obj.y);
				entry.initialWidth = int(entry.obj.width);
				entry.initialHeight = int(entry.obj.height);
			}
		}
		
		public function resize(xOffset:Number, yOffset:Number):void
		{
			for each(var entry:MovingElement in _elements)
			{
				if (entry.type & TYPE_FLAG_MOVING)
				{
					entry.obj.x = int(entry.initialX + xOffset);
					entry.obj.y = int(entry.initialY + yOffset);
				}
				if (entry.type & TYPE_FLAG_RESIZING)
				{
					entry.obj.width = int(entry.initialWidth + xOffset);
					entry.obj.height = int(entry.initialHeight + yOffset);
				}
			}
		}
		
		public function dispose():void
		{
			for each(var entry:MovingElement in _elements)
			{
				entry.obj = null;
			}
			_elements = null;
		}
	}

}
import flash.display.DisplayObject;

class MovingElement
{
	public var obj:DisplayObject;
	public var type:int;
	public var initialX:Number = 0;
	public var initialY:Number = 0;
	public var initialHeight:Number = 0;
	public var initialWidth:Number = 0;
	
	public function MovingElement(newObj:DisplayObject, newType:int)
	{
		obj = newObj;
		type = newType;
	}
}