package {
    import flash.display.Bitmap;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.text.TextField;

    import utils.Hash;

    public class Test_DataPairs extends  Sprite{

        private const CREATE:String = "Create";
        private const REPLACE:String = "Replace";
        private const SKIP_DUPLICATE:String = "Skip Duplicate";
        private const OVERRIDE_DUPLICATE:String = "Override Duplicate";
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
            var overString:String = "Overrided!";

            //OBJECT
            var object:Object = {};
            extractChildsToSaveFunction(function(key:String, value:String){
                object[key] = value;
            });
            trObject(object, CREATE);

            //replace
            delete object[tf2.name];
            object[tf3.name] = tf3.text;
            trObject(object, REPLACE);

            //skip duplicate
            object[tf3.name] ||= overString;
            trObject(object, SKIP_DUPLICATE);

            //override duplicate
            object[tf3.name] = overString;
            trObject(object, OVERRIDE_DUPLICATE);

            //HASH
            var hash:Hash = new Hash();
            extractChildsToSaveFunction(function(key:String, value:String){
                hash.setKeyIfEmpty(key,  value);
            });
            trObject(hash, CREATE);

            //replace
            hash.removeKey(tf2.name);
            hash.setKeyIfEmpty(tf3.name,tf3.text);
            trObject(hash, REPLACE);

            //skip duplicate
            hash.setKeyIfEmpty(tf3.name,overString);
            trObject(hash, SKIP_DUPLICATE);

            //override duplicate
            hash.setKey(tf3.name,overString);
            trObject(hash, OVERRIDE_DUPLICATE);

            //ARRAY
            var array:Array = [];
            extractChildsToSaveFunction(function(key:String, value:String){
                    array.push([key, value]);
            });
            trObject(array, CREATE);

            //replace
            for each (child in array){
                if(child[0] == tf2.name){
                    array[array.indexOf(child)] = [tf3.name, tf3.text];
                }
            }
            trObject(array, REPLACE);

            //skip duplicate
            var isDuplicate:Boolean;
            for each (child in array){
                if(child[0] == tf3.name){
                    isDuplicate = true;
                    break;
                }
            }
            if(!isDuplicate) array.push([overString, overString]);

            trObject(array, SKIP_DUPLICATE);

            //override duplicate
            for each (child in array){
                if(child[0] == tf3.name){
                    array[array.indexOf(child)][1] = overString;
                }
            }
            trObject(array, OVERRIDE_DUPLICATE);

            //VECTOR
            var vector:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
            extractChildsToSaveFunction(function(key:String, value:String){
                vector.push(createVectorPair(key, value));
            });
            trObject(vector, CREATE);

            //replace
            for each (child in vector){
                if(child[0] == tf2.name){
                    vector[vector.indexOf(child)] = createVectorPair(tf3.name, tf3.text);
                }
            }
            trObject(vector, REPLACE);

            //skip duplicate
            var isDuplicate:Boolean;
            for each (child in vector){
                if(child[0] == tf3.name){
                    isDuplicate = true;
                    break;
                }
            }
            if(!isDuplicate) vector.push([overString, overString]);

            trObject(vector, SKIP_DUPLICATE);

            //override duplicate
            for each (child in vector){
                if(child[0] == tf3.name){
                    vector[vector.indexOf(child)][1] = overString;
                }
            }
            trObject(vector, OVERRIDE_DUPLICATE);
        }

        private function trObject(object:Object, prefix:String = ""):void {
            var classString:String = object.constructor.toString();
            s = classString + " " + prefix + " ";
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
