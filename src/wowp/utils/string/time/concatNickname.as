package wowp.utils.string.time 
{
	
	public function concatNickname(nickname:String, clan:String, open:String="[", close:String="]"):String
	{
		if (clan != null && clan.length > 0)
		{
			return nickname + open + clan + close;
		}
		return nickname;
	}

}