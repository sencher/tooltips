package wowp.utils.hyperlink
{
	import flash.display.Sprite;
	
	import wowp.controls.WeblinkButton;
	import wowp.utils.domain.createObject;
	
	public class HyperlinkData
	{
		public var fullMatch:String;
		public var label:String;
		public var linkID:String;
		public var btnWeb:WeblinkButton;
		public var hover:Sprite;
		public var lineNumber:int;
		
		public function get colorPlaceholder():String { return "{color" + linkID + "}" }
		
		public function HyperlinkData(fullMatch:String, label:String, linkID:String) {
			this.fullMatch = fullMatch;
			this.label = label;
			this.linkID = linkID;
			hover = new Sprite();
			if (HyperlinkConstants.isWebLink(linkID)) {
				btnWeb = createObject("WeblinkBtnClass") as WeblinkButton;
			}
		}
	}
}
