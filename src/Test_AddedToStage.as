package {
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.EventPhase;
    import flash.utils.getQualifiedClassName;

    public class Test_AddedToStage extends Sprite{
        private var counter:int = 0;
        public function Test_AddedToStage() {
            var mc1:MovieClip = new MovieClip();
            var mc2:MovieClip = new MovieClip();
            var mc3:MovieClip = new MovieClip();
            var mc4:MovieClip = new MovieClip();
            var mc5:MovieClip = new MovieClip();
            var ar:Array = [stage,mc1,mc2,mc3,mc4,mc5];

            for each (var i:* in ar)
            {
                addListeners(i);
            }
//            stage.addEventListener(Event.ADDED_TO_STAGE, addedToStage,true)
            addChild(mc1);
            mc1.addChild(mc2);
            mc2.addChild(mc3);

            traceDisplayListChildrens(mc2)
            traceDisplayListParents(mc2)
        }

        private function addListeners(i:*):void {
//            i.addEventListener(Event.ADDED_TO_STAGE, addedToStage,false)
//            i.addEventListener(Event.ADDED_TO_STAGE, addedToStage,true)
            try{
                i.name = "mc"+counter++;
            }catch (e:Error){}
        }

        private function addedToStage(event:Event):void {
            trace("ADDED " + event.target.name + "  " + event.target + ", " + event.currentTarget.name + "  " + event.currentTarget  + ",  " + event.eventPhase);
        }

        public function traceDisplayListChildrens(displayObject:DisplayObject, maxDepth:int = 20, levelSpace:String = " ", currentDepth:int = 0) {
            var className:String = String(getQualifiedClassName(displayObject));
            var indexOfString:int = className.lastIndexOf("::");
            className = (indexOfString < 0) ? className : className.slice(indexOfString + 2);
            var displayName:String =  String((displayObject.name.substr(0, 8) == "instance") ? "" : displayObject.name + " ");

            trace(levelSpace + displayName + className);

            if (displayObject is DisplayObjectContainer && currentDepth < maxDepth) {
                for (var i:int = 0; i < DisplayObjectContainer(displayObject).numChildren; i++) {
                    traceDisplayListChildrens(DisplayObjectContainer(displayObject).getChildAt(i), maxDepth, levelSpace + "    ", currentDepth + 1);
                }
            }
        }


        public function traceDisplayListParents(displayObject:DisplayObject, maxDepth:int = 20, levelSpace:String = " ", currentDepth:int = 0) {
            var className:String = String(getQualifiedClassName(displayObject));
            var indexOfString:int = className.lastIndexOf("::");
            className = (indexOfString < 0) ? className : className.slice(indexOfString + 2);
            var displayName:String = " ";
            if(displayObject.name)
                displayName =  String((displayObject.name.substr(0, 8) == "instance") ? "" : displayObject.name + " ");

            trace(levelSpace + displayName + className);

            if (displayObject is DisplayObjectContainer && currentDepth < maxDepth) {
                if(displayObject.parent != null)
                    traceDisplayListParents(DisplayObjectContainer(displayObject).parent, maxDepth, levelSpace + "    ", currentDepth + 1);
            }
        }
    }
}
