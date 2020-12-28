package utils.wg.utils.string
{
	import flash.geom.Rectangle;
	import flash.text.TextField;

	public function getPhraseLocation(phrase:String, field:TextField):Array
	{
		var locations:Array = [];
		var firstChar:int = field.text.indexOf(phrase);
		var lastChar:int = firstChar+phrase.length;
		var firstCharRect:Rectangle = field.getCharBoundaries(firstChar);
		if (!firstCharRect) {
			trace("getPhraseLocation(): cannot find boundaries:", field.name, phrase);
			return locations;
		}
		var crtLocation:Rectangle = new Rectangle(firstCharRect.left, firstCharRect.top, firstCharRect.width, firstCharRect.height);
		var crtChar:int = firstChar;
		while (++crtChar < lastChar)
		{
			if (!field.getCharBoundaries(crtChar)) {
				trace("getPhraseLocation(): cannot find boundaries for char:", crtChar);
				locations.push(crtLocation);
				return locations;
			}
			if (field.getCharBoundaries(crtChar).y == crtLocation.y)
			{
				crtLocation.width = field.getCharBoundaries(crtChar).x + field.getCharBoundaries(crtChar).width - int(crtLocation.x);
			}
			else
			{
				locations.push(crtLocation);
				var crtCharRect:Rectangle = field.getCharBoundaries(crtChar);
				crtLocation = new Rectangle(crtCharRect.left, crtCharRect.top, crtCharRect.width, crtCharRect.height);
			}
		}
		locations.push(crtLocation);
		return(locations);
	}
}