package wowp.utils.timeout {

import com.junkbyte.console.Cc;

import flash.utils.clearTimeout;
import flash.utils.setTimeout;

public class TimeoutValidator implements IValidator {
    public var interesting:Boolean;
    
    private static var _ids:Array = [];
    
    private var _timeoutID:uint;
    private var _isInvalid:Boolean = false;
    
    private var _validateCallback:Function;
    private var _validateArgs:Array;
    
    public function TimeoutValidator(validateCallback:Function) {
        _ids[_ids.length] = this;
        _validateCallback = validateCallback;
    }
    
    public function dispose():void {
        cancel();
        _validateCallback = null;
    }
    
    public function invalidate(...args):void {
//        if (interesting) Cc.orangecw(this, "invalidate", args);
        _isInvalid = true;
        _validateArgs = args;
        clearTimeout(_timeoutID);
        _timeoutID = setTimeout(validate, 1);
    }
    
    private function validate():void {
//        if (interesting) Cc.purplecw(this, "validate");
        _isInvalid = false;
        clearTimeout(_timeoutID);
        if (_validateCallback != null) {
            _validateCallback.apply(null, _validateArgs);
        }
    }
    
    public function validateNow():void {
        validate();
    }
    
    public static function destroy():void {
        trace("TimeoutValidator::destroy");
        for each(var validator:TimeoutValidator in _ids) {
            validator.dispose();
        }
    }
    
    public function cancel():void {
//        if (interesting) Cc.redcw(this, "cancel");
        _isInvalid = false;
        clearTimeout(_timeoutID);
        _validateArgs = null;
    }
    
    public function get isInvalid():Boolean {
        return _isInvalid;
    }
}
    
}