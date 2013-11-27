package utils {
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;

    import utils.VectorHelper;

    public class MovieClipUtils {
        /*  Return true if :
         displayObject.stage != null
         displayObject.visible = true
         all parents.visible = true
         */
        public static function isVisible(displayObject:DisplayObject):Boolean {
            if(displayObject.stage == null || displayObject.visible == false) return false;

            if(displayObject.parent != null && isVisible(displayObject.parent) == false) {
                return false;
            }
            return true;
        }

        public static function findMovieClipsByName(container:*, findString:String):Vector.<MovieClip> {
            var result:Vector.<MovieClip> = new Vector.<MovieClip>();

            if(!(container is DisplayObjectContainer)) return result;

            if(container.name == findString){
                result.push(container);
            }
            var currentObject:*;
            for (var i:int = 0; i < container.numChildren; i++) {
                currentObject = container.getChildAt(i);
                if(!(currentObject is DisplayObjectContainer)) return result;

                if (currentObject.name == findString) {
                    result.push(currentObject);
                }

                //the condition in the line below checks if object has any more children
                VectorHelper.merge(result, findMovieClipsByName(currentObject, findString), true);
            }
            return result;
        }
    }
}
