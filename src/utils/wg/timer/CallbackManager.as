package utils.wg.timer
{
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import wowp.utils.array.safeSplice;
	import wowp.utils.data.binding.CallbackSet;
	
	public class CallbackManager
	{
		private const _holders:Vector.<Holder> = new <Holder>[];
		
		public function CallbackManager() {
		}
		
		public function clear():void {
			while (_holders.length > 0) {
				clearTimeout(_holders.pop().id);
			}
		}
		
		public function schedule(callback:CallbackSet, time:int):void {
			var holder:Holder = new Holder();
			holder.callback = callback;
			holder.id = setTimeout(completeHandler, time, holder);
			if (!holder.isCompleted) {
				_holders.push(holder);
			}
		}
		
		private function completeHandler(holder:Holder):void {
			safeSplice(_holders, holder);
			holder.apply();
		}
	}
}

import wowp.utils.data.binding.CallbackSet;

class Holder
{
	public var callback:CallbackSet;
	public var id:uint;
	public var isCompleted:Boolean;
	
	public function apply():void {
		callback.execute();
		isCompleted = true;
	}
}
