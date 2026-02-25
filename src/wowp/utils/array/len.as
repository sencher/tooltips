package wowp.utils.array 
{
	public function len(iterable:Object):int
	{
		if (iterable) return iterable.length;
		else return 0;
	}
}