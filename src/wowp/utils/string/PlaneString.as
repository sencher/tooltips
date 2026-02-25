package wowp.utils.string
{
	import flash.display.BitmapData;
	import flash.text.TextField;
	
	import scaleform.gfx.TextFieldEx;
	
	import wowp.account.constants.ColorConstants;
	import wowp.account.model.AccountModel;
	import wowp.utils.display.cache.Cache;
	import wowp.utils.display.cache.ICacheClient;
	
	public class PlaneString implements ICacheClient
	{
		public static const LEVEL:int = 0;
		public static const NAME:int = 1;
		public static const TYPE:int = 2;
		public static const ICON:int = 3;
		public static const LONG_NAME:int = 4;
		public static const ICON_28:int = 5;
		
		public static const PLACEHOLDER:String = "{plane_string}";
		private static var _ids:uint;
		
		private var _colorRegular:uint = ColorConstants.TEXT_ACCENTED;
		private var _colorPremium:uint = ColorConstants.PREMIUM;
		
		private var _tf:TextField;
		private var _planeID:int;
		private var _fields:Array = [];
		private var _baselineY:int = 15;
		private var _colored:Boolean;
		private var _subst:String;
		private var _text:String;
		private var _fakePlaneData:Object;
		
		public static function init(tf:TextField, planeID:int):PlaneString {
			var ps:PlaneString = new PlaneString(tf, planeID);
			return ps;
		}
		
		public function PlaneString(tf:TextField, planeID:int):void {
			_tf = tf;
			_planeID = planeID;
		}
		
		public function get level():PlaneString {
			_fields.push(LEVEL);
			return this;
		}
		
		public function get name():PlaneString {
			_fields.push(NAME);
			return this;
		}
		
		public function get longName():PlaneString {
			_fields.push(LONG_NAME);
			return this;
		}
		
		public function get type():PlaneString {
			_fields.push(TYPE);
			return this;
		}
		
		public function get icon():PlaneString {
			_fields.push(ICON);
			return this;
		}
		
		public function get icon28():PlaneString {
			_fields.push(ICON_28);
			return this;
		}
		
		public function get colored():PlaneString {
			_colored = true;
			return this;
		}
		
		public function y(value:int):PlaneString {
			_baselineY = value;
			return this;
		}
		
		public function get end():PlaneString {
			substitute();
			return this;
		}
		
		/**
		 * In case when we must use this component for non-existent plane we can provide fake PlanData object which
		 * replicates all needed properties
		 * @param fakePlaneData
		 * @return
		 */
		public function fake(fakePlaneData:Object = null):PlaneString {
			//	must mimic PlaneData
			_fakePlaneData = fakePlaneData;
			return this;
		}
		
		private function substitute():void {
			var planeString:String;
			var parts:Array = [];
			var data:Object = AccountModel.instance.planesModel.getPlaneData(_planeID) || _fakePlaneData;
			if (!data) return;
			if (!_tf) return;
			
			var color:uint = _colored ? data.isPremium ? _colorPremium : _colorRegular : 0;
			
			for each (var field:int in _fields) {
				switch (field) {
					case LEVEL:
						parts.push(a2r(data.staticDescription.description.level));
						break;
					case NAME:
						parts.push(data.staticDescription.description.name);
						break;
					case LONG_NAME:
						parts.push(data.staticDescription.description.longName);
						break;
					case TYPE:
						parts.push(data.staticDescription.type.typeString);
						break;
					case ICON:
					case ICON_28:
						_ids++;
						_subst = "{plane" + _ids + "}";
						parts.push(_subst);
						break;
				}
			}
			planeString = parts.join(" ");
			planeString = planeString.replace(" {", "{").replace("} ", "}");
			
			_text = _tf.text.split(PLACEHOLDER).join(color ? paint(planeString, color) : planeString);
			
			if (_fields.indexOf(ICON) > -1) {
				_tf.htmlText = "";
				Cache.getResource(data.typeIcoPath, this);
			}
			if (_fields.indexOf(ICON_28) > -1) {
				_tf.htmlText = "";
				Cache.getResource(data.typeIcon28Path, this);
			}
		}
		
		public function onResourceLoaded(resource:Object):void {
			_tf.htmlText = _text;
			
			var subst:Object = {};
			subst.image = resource as BitmapData;
			subst.subString = _subst;
			subst.id = "plane_" + uint(_ids).toString();
			subst.baseLineY = _baselineY;
			TextFieldEx.setImageSubstitutions(_tf, subst);
		}
		
		public function onError():void {
			_tf.htmlText = "";
		}
	}
}
