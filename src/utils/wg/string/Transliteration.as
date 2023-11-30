package utils.wg.string
{
	public class Transliteration
	{
		private static const charTable:Object = {"а": "a", "б": "b", "в": "v", "г": "g", "д": "d", "е": "e", "ё": "e", "ж": "zh",
			"з": "z", "и": "i", "й": "y", "к": "k", "л": "l", "м": "m", "н": "n", "о": "o", "п": "p", "р": "r", "с": "s",
			"т": "t", "у": "u", "ф": "f", "х": "h", "ц": "ts", "ч": "ch", "ш": "sh", "щ": "shch", "ъ": "'", "ь": "'", "ы": "y",
			"э": "e", "ю": "yu", "я": "ya",
			"А": "A", "Б": "B", "В": "V", "Г": "G", "Д": "D", "Е": "E", "Ё": "E", "Ж": "Zh",
			"З": "Z", "И": "I", "Й": "Y", "К": "K", "Л": "L", "М": "M", "Н": "N", "О": "O", "П": "P", "Р": "R", "С": "S",
			"Т": "T", "У": "U", "Ф": "F", "Х": "H", "Ц": "Ts", "Ч": "Ch", "Ш": "Sh", "Щ": "Shch", "Ъ": "'", "Ь": "'", "Ы": "Y",
			"Э": "E", "Ю": "Yu", "Я": "Ya" };

		public static function convert(value:String):String
		{
			for (var char:String in charTable)
			{
				value = value.split(char).join(charTable[char]);
			}
			return value;
		}
	}
}
