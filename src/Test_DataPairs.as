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
            var tf3:TextField = new TextField();
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

            tf3.name = "tf3";
            tf3.text = "third";

            //Object
            var object:Object = {};
            extractChildsToSaveFunction(function(key:String, value:String){
                object[key] = value;
            });
            trObject(object);

            //replace
            delete object[tf2.name];
            object[tf3.name] = tf3.text;
            trObject(object);

            //Hash
            var hash:Hash = new Hash();
            extractChildsToSaveFunction(function(key:String, value:String){
                hash.setKeyIfEmpty(key,  value);
            });
            trObject(hash);

            //replace
            hash.removeKey(tf2.name);
            hash.setKeyIfEmpty(tf3.name,tf3.text);
            trObject(hash);

            //Array
            var array:Array = [];
            extractChildsToSaveFunction(function(key:String, value:String){
                    array.push([key, value]);
            });
            trObject(array);

            //replace
            for each (child in array){
                if(child[0] == tf2.name){
                    array[array.indexOf(child)] = [tf3.name, tf3.text];
                }
            }
            trObject(array);

            //Vector
            var vector:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
            extractChildsToSaveFunction(function(key:String, value:String){
                vector.push(createVectorPair(key, value));
            });
            trObject(vector);

            //replace
            for each (child in vector){
                if(child[0] == tf2.name){
                    vector[vector.indexOf(child)] = createVectorPair(tf3.name, tf3.text);
                }
            }
            trObject(vector);
        }

        private function trObject(object:Object):void {
            var classString:String = object.constructor.toString();
            s = classString + " ";
            for (child in object) {
                switch (classString){
                    case "[class Object]":
                        s += child + ":" + object[child] + ", ";
                        break;
                    case "[class Array]":
                    case "[class Vector.<*>]":
                        s +=  object[child][0] + ":" + object[child][1] + ", ";
                        break;
                    case "[class Hash]":
                        s +=  child + ":" + object.getKey(child) + ", ";
                        break;
                }

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

        private function createVectorPair(key:String, value:String):Vector.<String>{
            var stringVector:Vector.<String> = new Vector.<String>();
            stringVector.push(key, value);
            return stringVector;
        }
    }
}
