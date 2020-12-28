package utils.wg.utils.display.text.substitution {
	import flash.display.BitmapData;

	import wowp.controls.KeyLabel;
	import wowp.utils.domain.getDefinition;

	public dynamic class HotKeyIcon {
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{key}";
		static private const ICON_BASELINE_Y:Number = 15;

		private var bmd:BitmapData;

		public function HotKeyIcon(key:String, substring:String = null) {
			var keyLabel:KeyLabel = new (getDefinition("KeyLabelSmall"))() as KeyLabel;
			keyLabel.setText(key);
			bmd = new BitmapData(keyLabel.width, keyLabel.height, true, 0x000000);
			bmd.draw(keyLabel);
			this["image"] = bmd;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "hot_key_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}

		public function dispose():void {
			bmd.dispose();
		}
	}
}
