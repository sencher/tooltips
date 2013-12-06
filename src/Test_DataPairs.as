package {
    import flash.display.Bitmap;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.text.TextField;

    import utils.Hash;

    public class Test_DataPairs extends  Sprite{
        private var i:uint = 0;
        private var child:*;
        private var s:String = "";
        private var mc:MovieClip = new MovieClip();

        public function Test_DataPairs() {

            var tf1:TextField = new TextField();
            var tf2:TextField = new TextField();
            var b:Bitmap = new Bitmap();
            mc.addChild(tf1);
            mc.addChild(tf2);
            mc.addChild(b);
            tf1.name = "tf1";
            tf2.name = "tf2";
            tf1.text = "first"
            tf2.text = "second"
            tf2.y = 50;
            addChild(mc);

            //Object
            var object:Object = {};
            extractChildsToSaveFunction(function(key:String, value:String){
                object[key] = value;
            });

            for (child in object){
                s +=  child + ", " + object[child] + ", ";
            }
            trace(s);

            //Array
            var array:Array = [];
            extractChildsToSaveFunction(function(key:String, value:String){
                    array.push([key, value]);
            });

            s = "";
            for each (child in array){
                s +=  child[0] + ", " + child[1] + ", ";
            }
            trace(s);

            //Hash
            var hash:Hash = new Hash();
            extractChildsToSaveFunction(function(key:String, value:String){
                hash.setKeyIfEmpty(key,  value);
            });

            s = "";
            for (child in hash){
                s +=  child + ", " + hash.getKey(child) + ", ";
            }
            trace(s);

            //Vector
            var vector:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
            extractChildsToSaveFunction(function(key:String, value:String){
                var stringVector:Vector.<String> = new Vector.<String>();
                stringVector.push(key, value);
                vector.push(stringVector);
            });

            s = "";
            for each(child in vector){
                s +=  child[0] + ", " + child[1] + ", ";
            }
            trace(s);
        }

        private function extractChildsToSaveFunction(callback:Function):void
        {
            for (i = 0; i < mc.numChildren; i++){
                child = mc.getChildAt(i);
                if(child is TextField)
                    callback(child.name, child.text);
            }
        }
    }
}
