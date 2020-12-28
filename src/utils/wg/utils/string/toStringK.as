package utils.wg.utils.string
{
	/**
	 * округляется до вида: 10 000-10 999 = 10К+, 11 000 - 11 999 = 11К+ и т.д.
	 */
	
	public function toStringK(value:int, base:int = 10000, addSeparator:Boolean = true, separator:String = "K+"):String 
	{
		if (value < base) {
			return addSeparator ? stringAddSeparator(value) : value.toString();
		}
		var amount:int = value / 1000;
		return (addSeparator ? stringAddSeparator(amount) : amount.toString()) + separator;
	}

}