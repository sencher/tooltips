package scaleform.clik.motion
{
	import flash.display.Stage;
	import flash.system.Capabilities;
	
	import scaleform.gfx.Extensions;
	
	public class TweenGlobalSettings
	{
		internal static var stage:Stage;
		internal static var isScaleForm:Boolean = Capabilities.manufacturer.indexOf("Scaleform") != -1 && !Extensions.isGFxPlayer;
		
		public static function setStage(pStage:Stage):void {
			stage = pStage;
		}
	}
}
