package utils.wg.utils.display
{
	import flash.display.DisplayObject;
	
	/**
	 * ложит объект object под under, если они уже находятся в правильном порядке и у них один и тот же парент, то ничего непроисходит, 
	 * иначе object перемещается в парент under и располагается под ним
	 * @param	object
	 * @param	under
	 */
	public function placeUnder(object:DisplayObject, under:DisplayObject):void 
	{
		if (under.parent == null) return;
		if (object.parent != under.parent)
		{
			under.parent.addChildAt(object, under.parent.getChildIndex(under));
		}
		else
		{
			if (under.parent.getChildIndex(object) > under.parent.getChildIndex(under))
			{
				under.parent.swapChildren(under, object);
			}
		}
	}

}