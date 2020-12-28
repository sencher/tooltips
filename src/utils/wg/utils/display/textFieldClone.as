package utils.wg.utils.display
{
	import flash.text.TextField;
	
	public function textFieldClone(field:TextField):TextField 
	{
		var result:TextField;
		
		result = new TextField();						
		result.x = field.x;
		result.y = field.y;
		result.width = field.width;
		result.height = field.height
		result.defaultTextFormat = field.getTextFormat();
		result.filters = field.filters;
		result.alpha = field.alpha;
		
		result.text = field.text;
		
		return result;
	}
	
}