package {

import avmplus.describeTypeJSON;

import flash.display.Sprite;
import flash.utils.describeType;

import utils.GamuaFloxUtils;

public class Test_CloneConstructorParams extends Sprite {
    public function Test_CloneConstructorParams() {
//        var b1:Beautiful = new Beautiful(1);
//        var b2:Beautiful = GamuaFloxUtils.cloneObject(b1);
        //trace(b1.id, b2.id);
    
//        var c = _class.constructor;
//        trace(_class.length, _class.constructor.length);
        
        var c = Beautiful;
        var cons = c.constructor;
        trace(cons.length);
        var desc = describeType(c).toXMLString();
        trace( desc)
        var desc2 = describeType(cons).toXMLString();
        trace( desc2);
    
    
        var TestClass = function(data) {
            var self = this;
            this.data = data;
            this.boundWork = function() {
                return self.constructor.prototype.unboundWork.apply(self, arguments);
            };
        };
    
        TestClass.prototype.unboundWork = function() {
            return this.data;
        };
    
        var a = new TestClass("a");
        var b = new TestClass("b");
    
        trace(a.boundWork()); // a
        trace(b.boundWork()); // b
    
        trace(a.unboundWork()); // a
        trace(b.unboundWork()); // b
    
        trace(a.boundWork.call(b)); // a
        trace(a.boundWork.call(undefined)); // a
    
        trace(a.unboundWork.call(b)); // b
    
        var method = a.unboundWork;
        method() // undefined. ACK!
    
        method = a.boundWork;
        method() // a. TADA MAGIC!
    
    
        var objA:MyObj = new MyObj("A");
        var objB:MyObj = new MyObj("B");
    
        objA.sayName();
        objB.sayName();
    
        objA.sayName.apply(objB, []); // a
        objA.sayName.call(objB); // a
    
        objA.pSayName.call(objB) // b <---
    }
}
}

class Beautiful{
    public var id:int;
    
    public function Beautiful(id:int, zz:String):void {
        this.id = id;
    }
}

internal dynamic class MyObj
{
    private var _name:String;
    public function MyObj(name:String)
    {
        _name = name;
    }
    public function sayName():void
    {
        trace(_name);
    }
    
    MyObj.prototype.pSayName = function():void {
        trace(this._name);
    };
}
