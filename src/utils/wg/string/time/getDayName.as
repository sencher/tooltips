package utils.wg.string.time
{
	import wowp.utils.string.loc;
	
	public function getDayName(number:int):String {
		switch (number) {
			case 0:return loc("LOBBY_DB_SUNDAY");
			case 1:return loc("LOBBY_DB_MONDAY");
			case 2:return loc("LOBBY_DB_TUESDAY");
			case 3:return loc("LOBBY_DB_WEDNESDAY");
			case 4:return loc("LOBBY_DB_THURSDAY");
			case 5:return loc("LOBBY_DB_FRIDAY");
			case 6:return loc("LOBBY_DB_SATURDAY");
		}
		return "";
	}
	
}
