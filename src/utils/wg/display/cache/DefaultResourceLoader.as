package utils.wg.display.cache
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    
    public class DefaultResourceLoader extends ResourceLoader
    {
        private var _loader:Loader;
        private var _isLoad:Boolean;
        
        public function DefaultResourceLoader(path:String) {
            super(path);
        }
        
        
        override protected function load():void {
            var req:URLRequest = new URLRequest(_path);
            
            _isLoad = true;
            
            _loader = new Loader();
            _loader.load(req, new LoaderContext(false, ApplicationDomain.currentDomain));
            _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompletedHandler);
            _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
        }
        
        protected override function removeListeners():void {
            _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadCompletedHandler);
            _loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
        }
        
        private function loadCompletedHandler(e:Event):void
        {
            var content:Object = _loader.content;
            
            //	если загружали картинку, то загруженным ресурсом будет битмапдата
            if (content is Bitmap) {
                content = (content as Bitmap).bitmapData;
            }
            setLoadedContent(content);
            
            _isLoad = false;
        }
        
        private function loadErrorHandler(e:IOErrorEvent):void
        {
            trace("ResourceLoader::loadErrorHandler:", e.text);
            setLoadedContent(null);
        }
        
        
        override public function dispose():void
        {
            if (_content is BitmapData) {
                _content = null;
                //  не делать диспоз, иначе в других скринах вместо картинок могут появлятся черные прямоугольники
                //  воспроизводится на Scaleform 4.5.31 когда выйти в очередь нажав в кнопку "В бой" не дождавшись
                // полной прогрузки ангара
//                (_content as BitmapData).dispose();
            }
            if (_loader) {
                if (_isLoad) {
                    try {
                        _loader.close();
                    } catch (e:Error) {
                    
                    }
                }
                //_loader.unload();
                //_loader.unloadAndStop();
            }
            super.dispose();
            
        }
    }
}
