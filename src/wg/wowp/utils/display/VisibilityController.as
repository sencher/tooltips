package wowp.utils.display
{
    import flash.display.DisplayObject;
    
    import wowp.utils.array.addOnce;
    import wowp.utils.array.safeSplice;
    import wowp.utils.data.binding.Signal;
    
    /**
     * Управляет свойством visible дисплейных обьектов
     * Есть два режима управления:
     *          ANY - дисплейному объекту флаг visible устанавливается когда хотя бы один флаг установлен
     *          ALL - дисплейному объекту флаг visible устанавливается когда все флаги установлены
     *
     * Можно передавать дисплейные объекты в addDisplayObject и тогда им визибилити будет установлено автоматически
     * Можно использовать сигналы и свойство visible для установки видимости объекта вручную
     */
    public class VisibilityController
    {
        public static const ANY:int = 1;
        public static const ALL:int = 2;
        
        public const onBecomeVisible:Signal = new Signal();
        public const onBecomeInvisible:Signal = new Signal();
        public const onChanged:Signal = new Signal();
        
        private var _flags:Array = [];      //  все флаги
        private const _setFlags:Array = []; //  установленные на данный момент флаги
        private const _displayObjects:Vector.<DisplayObject> = new <DisplayObject>[];
        private var _mode:int = ALL;
        
        private var _visible:Boolean = false;
        
        public function VisibilityController(...flags) {
            _flags = flags;
        }
        
        public function isSet(flag:*):Boolean {return _setFlags.indexOf(flag) != -1;}
        
        public function reset():void {
            _setFlags.length = 0;
            resolve();
        }
        
        public function dispose():void {
            _setFlags.length = _flags.length = _displayObjects.length = 0;
            _visible = false;
        }
        
        public function setMode(value:int):void {
            _mode = value;
            resolve();
        }
        
        public function getMode():int {return _mode;}
        
        public function get visible():Boolean {return _visible;}
        
        public function addDisplayObject(displayObject:DisplayObject):void {
            addOnce(_displayObjects, displayObject);
            displayObject.visible = _visible;
        }
        
        public function removeDisplayObject(displayObject:DisplayObject):void {
            safeSplice(_displayObjects, displayObject);
        }
        
        private function resolve():void {
            switch (_mode) {
                case ANY:
                    resolveAny();
                    break;
                case ALL:
                    resolveAll();
                    break;
            }
        }
        
        private function resolveAny():void {
            var visible:Boolean = _setFlags.length > 0;
            if (_visible != visible) {
                _visible = visible;
                updateDisplayObjects();
                dispatch();
            }
        }
        
        private function resolveAll():void {
            var visible:Boolean = true;
            var len:int = _flags.length;
            if (len != _setFlags.length) {
                visible = false;
            } else {
                for (var i:int = 0; i < len; i++) {
                    if (_setFlags.indexOf(_flags[i]) == -1) {
                        visible = false;
                        break;
                    }
                }
            }
            if (_visible != visible) {
                _visible = visible;
                updateDisplayObjects();
                dispatch();
            }
        }
        
        private function updateDisplayObjects():void {
            var len:int = _displayObjects.length;
            for (var i:int = 0; i < len; i++) {
                _displayObjects[i].visible = _visible;
            }
        }
    
        private function dispatch():void {
            if (_visible) {
                onBecomeVisible.fire();
            } else {
                onBecomeInvisible.fire();
            }
            onChanged.fire();
        }
        
        public function update(flag:*, value:Boolean):void {
            if (value) {
                setVisible(flag);
            } else {
                setInvisible(flag);
            }
        }
        
        public function setVisible(flag:*):void {
            if (_flags.indexOf(flag) != -1) {
                if (_setFlags.indexOf(flag) == -1) {
                    _setFlags[_setFlags.length] = flag;
                    resolve();
                }
            }
        }
        
        public function setInvisible(flag:*):void {
            if (_flags.indexOf(flag) != -1) {
                var index:int = _setFlags.indexOf(flag);
                if (index != -1) {
                    _setFlags.splice(index, 1);
                    resolve();
                }
            }
        }
    }
}
