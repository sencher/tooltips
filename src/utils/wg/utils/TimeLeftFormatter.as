package utils.wg.utils
{
	import wowp.core.LocalizationManager;
	import wowp.utils.string.stringReplace;

	public class TimeLeftFormatter
	{
		private static const LOC:Function = LocalizationManager.getInstance().textByLocalizationID;
		
		public static const DAY_SECONDS:int = 60 * 60 * 24;
		public static const HOUR_SECONDS:int = 60 * 60;
		public static const MINUTE_SECONDS:int = 60;
		
		protected var _days:int;
		protected var _hours:int;
		protected var _minutes:int;
		
		protected var _leftStr:String;
		protected var _leftDimension:String;
		
		public function TimeLeftFormatter(seconds:int) 
		{
			_days = Math.ceil(seconds / DAY_SECONDS);
			_hours = Math.ceil(seconds / HOUR_SECONDS);
			_minutes = Math.ceil(seconds / MINUTE_SECONDS);

			if (_minutes < 60)
			{
				_leftStr = _minutes.toString();
				_leftDimension = LOC("COUNTER_MINUTES");
			}
			else if (_hours < 24)
			{
				_leftStr = _hours.toString();
				_leftDimension = LOC("COUNTER_HOURS");
			}
			else
			{
				_leftStr = _days.toString();
				_leftDimension = Utils.trimWhitespace(stringReplace(LOC("LOBBY_COUNTER_DAYS"), "{days}", ""));
			}
		}
		
		public function toString():String
		{
			return (_leftStr ? _leftStr + " " : "") + _leftDimension;
		}
		
		public function get days():int 
		{
			return _days;
		}
		
		public function get hours():int 
		{
			return _hours;
		}
		
		public function get minutes():int 
		{
			return _minutes;
		}
		
		public function get leftStr():String 
		{
			return _leftStr;
		}
		
		public function get leftDimension():String 
		{
			return _leftDimension;
		}
	}

}