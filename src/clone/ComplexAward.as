package clone {

import clone.ChildData;

import flash.utils.ByteArray;
import flash.utils.describeType;

public class ComplexAward {
    // Static variables
    public static var globalCounter:int = 100;
    public static const TYPE_PREMIUM:String = "Premium_Type";
    
    // Public variables
    public var id:int;
    public var publicName:String;
    public var child:ChildData; // Nested custom class
    public var rawData:Object;   // Generic inner object
    
    // Protected & Private variables
    protected var protectedSecret:int = 42;
    private var _title:String;  // Private variable behind a getter/setter
    
    // Both private tracking variations
    private var _constructorUid:Number;
    private var _runtimeUid:Number = 0;
    
    public function ComplexAward() {
        // Track 1: Generated automatically on creation
        _constructorUid = Math.floor(Math.random() * 100000);
    }
    
    // Track 2: Generated only on manual demand post-construction
    public function generateRuntimeUid():void {
        _runtimeUid = Math.floor(Math.random() * 100000);
    }
    
    // Getter/Setter
    public function get title():String { return _title; }
    public function set title(value:String):void { _title = value; }
    
    // Getters for tracking visibility
    public function get constructorUid():Number { return _constructorUid; }
    public function get runtimeUid():Number { return _runtimeUid; }
    
    // Static function
    public static function getInfo():String {
        return "ComplexAward Class Template";
    }
    
    // Internal custom copy method (The safe approach)
    public function manualClone():ComplexAward {
        var copy:ComplexAward = new ComplexAward(); // Constructor fires! Generates its own fresh _constructorUid
        
        copy.id = this.id;
        copy.publicName = this.publicName;
        copy.title = this.title;
        copy.protectedSecret = this.protectedSecret;
        
        // Manually porting the runtime state over
        copy._runtimeUid = this._runtimeUid;
        
        if (this.child != null) {
            copy.child = new ChildData(this.child.childName);
        }
        if (this.rawData != null) {
            copy.rawData = {};
            for (var key:String in this.rawData) {
                copy.rawData[key] = this.rawData[key];
            }
        }
        return copy;
    }
    
    // Automated Brute-Force Clone via Runtime Reflection
    public function reflectionClone():ComplexAward {
        var copy:ComplexAward = new ComplexAward();
        
        // Get the XML blueprint of this instance type
        var description:XML = describeType(this);
        
        // 1. Loop through all class variables (public, protected, and private)
        for each (var variable:XML in description.variable) {
            var propName:String = variable.@name;
            try {
                // Bracket notation works on private fields because execution is INSIDE the class scope
                copy[propName] = this[propName];
            } catch (e:Error) {
                // Safe guard for un-copyable fields
            }
        }
        
        // 2. Loop through all readwrite properties (getters/setters)
        for each (var accessor:XML in description.accessor) {
            if (accessor.@access == "readwrite") {
                var accName:String = accessor.@name;
                try {
                    copy[accName] = this[accName];
                } catch (e:Error) {
                    // Safe guard for accessor errors
                }
            }
        }
        
        // 3. Manually duplicate structural/nested references to keep clones unlinked
        if (this.child != null) {
            copy.child = new ChildData(this.child.childName);
        }
        if (this.rawData != null) {
            copy.rawData = {};
            for (var key:String in this.rawData) {
                copy.rawData[key] = this.rawData[key];
            }
        }
        
        return copy;
    }
    
    public function toString():String {
        return "[ComplexAward id=" + id +
                ", publicName=" + publicName +
                ", _title=" + _title +
                ", protectedSecret=" + protectedSecret +
                ", _constructorUid=" + _constructorUid +
                ", _runtimeUid=" + _runtimeUid +
                ", child=" + (child ? child.toString() : "null") +
                ", rawData.gold=" + (rawData ? rawData.gold : "null") + "]";
    }
}
}