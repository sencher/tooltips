package wowp.utils.string.time 
{
	import flash.external.ExternalInterface;
	
	public function getClientUTC():Number 
	{
		return ExternalInterface.call('system.getUTC');
	}

}