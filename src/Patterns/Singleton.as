/**
 * Created by SenCheR on 06.09.2016.
 */
package Patterns
{
	public final class Singleton{
		private static var _instance:Singleton;

		public var field:int = 9;

		public function Singleton(){
			if(_instance){
				throw new Error("Singleton... use .instance");
			}
			_instance = this;
		}

		public static function get instance():Singleton{
			if(!_instance){
				new Singleton();
			}
			return _instance;
		}
	}
}
