package utils.wg.display
{
	import flash.display.DisplayObjectContainer;
	/**
	 * удаляет всех чайлдов у контейнера дисплейных объектов
	 */
	public function clearDisplayObjectContainer(container:DisplayObjectContainer):void
	{
		while (container.numChildren > 0)
		{
			container.removeChildAt(0);
		}
	}


}