package utils.wg.utils.string.time
{
	import flash.external.ExternalInterface;
	
	public function getClientUTC():Number 
	{
		return ExternalInterface.call('system.getUTC');
	}

}