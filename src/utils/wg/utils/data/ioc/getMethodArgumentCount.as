package utils.wg.utils.data.ioc
{
	import flash.utils.describeType;

	/**
	 * возвращает
	 * @param object
	 * @param methodName
	 * @return
	 */
	public function getMethodArgumentCount(object:Object, methodName:String):int {
		//	так иногда падает
		//return object[methodName].length;

		//	так не работает, какие то траблы с XML в скейлформе
		// return describeType(target).method.(@name == prop).parameter.length();

		/**
		 * маленький велосипедик:
		 *
		 * каждый аргумент опысывается тегом parameter
		 *
		 * мы ищем тег method с атрибутом name который соотвествует имени функции, дальше просто
		 * подсчитываем количество тегов parameter
		 */
		var str:String = describeType(object).method.toXMLString();

		var arr:Array = str.split('<method name="' + methodName + '"');
		if (arr.length > 1) {
			arr = arr[1].split("</method>");
			arr = arr[0].split("<parameter");
			return arr.length - 1;
		}
		trace("getMethodArgumentCount::given object is not a function!");
		return 0;
	}
	
}
