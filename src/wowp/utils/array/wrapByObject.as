package wowp.utils.array
{
	
	/**
	 * создает массив, в котором каждый элемент будет оберткой вокруг соответствующего объекта исходного массива, объект передается в конструктор обертки
	 * @param    array
	 * @param    wrapperClass
	 * @param 	 target - массив или вектор куда нужно пушить реузультирующие объекты
	 * @return
	 */
	public function wrapByObject(array:Array, wrapperClass:Class, target:Object = null):Array
	{
		var result:Array = [];
		var i:int = 0;
		var len:int = array.length;
		for (i; i < len; ++i) {
			result[i] = new wrapperClass(array[i]);
			if (target != null) {
				target.push(result[i]);
			}
		}
		return result;
	}

}