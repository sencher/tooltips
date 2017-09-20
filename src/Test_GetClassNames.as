package {
	import flash.display.Sprite;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	
	public class Test_GetClassNames extends Sprite {
		public function Test_GetClassNames() {
			//Import:class in FLA
			bigbg;bigIcons;/*HintButtonShared*/;SrvSharedTileList;PlayBold;PlayRegular;
			SrvRewardBigRendererShared;SrvRewardRendererShared;SrvItemListLite;
			
			var f:SrvShopFullRenderer = new SrvShopFullRenderer();
			trace(f, f.name, getQualifiedClassName(f), getQualifiedSuperclassName(f), typeof f);
			trace(String("true").toUpperCase());
		}
	}
}
