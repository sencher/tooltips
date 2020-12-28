package utils.wg.utils.data.binding
{
    public class FlagSignal
    {
        protected var _slots:Vector.<Function> = new <Function>[];
        
        private var _isSet:Boolean = false;
        
        public function add(slot:Function):void
        {
            if (_slots.indexOf(slot) == -1) {
                _slots[_slots.length] = slot;
            }
            if (_isSet) {
                slot();
            }
        }
        
        public function remove(slot:Function):void
        {
            var index:int = _slots.indexOf(slot);
            if (index != -1) {
                _slots.splice(index, 1);
            }
        }
        
        public function set():void {
            if (!_isSet) {
                _isSet = true;
                fire();
            }
        }
        
        public function reset():void {
            _isSet = true;
        }
        
        public function dispose():void {
            _slots.length = 0;
        }
        
        protected function fire():void
        {
            var proc:Vector.<Function> = _slots.slice();
            for each(var slot:Function in proc) {
                if (_slots.indexOf(slot) != -1) {
                    slot();
                }
            }
        }
    }
}
