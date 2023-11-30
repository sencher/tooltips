package utils.wg.data.ioc
{
	public interface IUnitInjector
	{
		/**
		 * Этот метод инжектирует данные из источника source в обьект-цель target
		 * @param target - Обьект-цель куда инжектируются данные
		 */
		function inject(target:Object):void;
		function get targetClass():Class;
		function get target():Object;
	}
}
