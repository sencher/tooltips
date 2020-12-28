package utils.wg.utils.domain
{
	import flash.system.Capabilities;
	
	import scaleform.gfx.Extensions;
	
	public function isScaleform():Boolean
	{
		return Capabilities.manufacturer.indexOf("Scaleform") != -1 && !Extensions.isGFxPlayer;
	}
}