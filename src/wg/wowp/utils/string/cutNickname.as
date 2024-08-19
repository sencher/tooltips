package wowp.utils.string 
{
	
	public function cutNickname(nickname:String, open:String="[", close:String="]"):Array 
	{
		var result:Array = [];
		var arr1:Array = nickname.split(open);
		result[0] = arr1[0];
		var l:String = arr1[1];
		if (l == null)
		{
			result[1] = "";
		}
		else
		{
			var arr2:Array = l.split(close);
			result[1] = open + arr2[0] + close;
		}
		
		return result;
	}

}