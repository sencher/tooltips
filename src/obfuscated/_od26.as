package obfuscated {
    import flash.display.Bitmap;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.text.TextField;

    import utils.Hash;

    public class _od26 extends  Sprite{
        private var _vf15:uint = 0;
        private var child:*;
        private var _qw14:String = "";
        private var _qe12:MovieClip = new MovieClip();

        public function _od26() {

            var _mq10:TextField = new TextField();
            var _ku21:TextField = new TextField();
            var _vd11:TextField = new TextField();
            var b:Bitmap = new Bitmap();
            _qe12.addChild(_mq10);
            _qe12.addChild(_ku21);
            _qe12.addChild(b);
            _mq10.name = irrcrpt("wi4", 3);
            _ku21.name = irrcrpt("wi5", 3);
            _mq10.text = irrcrpt("gjstu", 1)
            _ku21.text = irrcrpt("vhfrqg", 3)
            _ku21.y = 50;
            addChild(_qe12);

            _vd11.name = irrcrpt("vh5", 2);
            _vd11.text = irrcrpt("vjktf", 2);

            //Object
            var object:Object = {};
            _mw10(function(key:String, value:String){
                object[key] = value;
            });
            _qc16(object);

            //replace
            delete object[_ku21.name];
            object[_vd11.name] = _vd11.text;
            _qc16(object);

            //Hash
            var _ar26:Hash = new Hash();
            _mw10(function(key:String, value:String){
                _ar26.setKeyIfEmpty(key,  value);
            });
            _qc16(_ar26);

            //replace
            _ar26.removeKey(_ku21.name);
            _ar26.setKeyIfEmpty(_vd11.name,_vd11.text);
            _qc16(_ar26);

            //Array
            var _os16:Array = [];
            _mw10(function(key:String, value:String){
                    _os16.push([key, value]);
            });
            _qc16(_os16);

            //replace
            for each (child in _os16){
                if(child[0] == _ku21.name){
                    _os16[_os16.indexOf(child)] = [_vd11.name, _vd11.text];
                }
            }
            _qc16(_os16);

            //Vector
            var vector:Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
            _mw10(function(key:String, value:String){
                vector.push(_jj20(key, value));
            });
            _qc16(vector);

            //replace
            for each (child in vector){
                if(child[0] == _ku21.name){
                    vector[vector.indexOf(child)] = _jj20(_vd11.name, _vd11.text);
                }
            }
            _qc16(vector);
        }

        private function _qc16(object:Object):void {
            var _th20:String = object.constructor.toString();
            _qw14 = _th20 + " ";
            for (child in object) {
                switch (_th20){
                    case irrcrpt("[fodvv Remhfw]", 3):
                        _qw14 += child + ":" + object[child] + irrcrpt(", ", 1);
                        break;
                    case irrcrpt("[dmbtt Bssbz]", 1):
                    case irrcrpt("[encuu Xgevqt.<*>]", 2):
                        _qw14 +=  object[child][0] + ":" + object[child][1] + irrcrpt(", ", 3);
                        break;
                    case irrcrpt("[gpeww Lewl]", 4):
                        _qw14 +=  child + ":" + object.getKey(child) + irrcrpt(", ", 5);
                        break;
                }

            }
            trace(_qw14);
        }

        private function _mw10(callback:Function):void
        {
            for (_vf15 = 0; _vf15 < _qe12.numChildren; _vf15++){
                child = _qe12.getChildAt(_vf15);
                if(child is TextField)
                    callback(child.name, child.text);
            }
        }

        private function _jj20(key:String, value:String):Vector.<String>{
            var _jt16:Vector.<String> = new Vector.<String>();
            _jt16.push(key, value);
            return _jt16;
        }
    }
}
