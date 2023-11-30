package utils.wg.array
{
	
	/**
	 * возвращяет массив объектов, которые являются значениями полей field объектов исходного массива array
	 * если такого поля нету, то объект пропускается и значение этого поля в результирующий массив не добавляется
	 * @param	array
	 * @param	field
	 * @return
	 */
	public function getFieldArray(array:Object, field:String):Array 
	{
		var result:Array = [];
		for each(var obj:Object in array)
		{
			if (obj.hasOwnProperty(field))
			{
				result.push(obj[field]);
			}
		}
		return result;
	}

}