//package com.gamua.flox.utils
package utils {
import flash.utils.describeType;
import flash.utils.getQualifiedClassName;

import legacy.HashMap;

import legacy.math.Long;

public class GamuaFloxUtils {

    /** Creates a deep copy of the object.
     *  Beware: all complex data types will become mere 'Object' instances. Supported are only
     *  primitive data types, arrays and objects. Any properties marked with "NonSerialized"
     *  meta data will be ignored by this method.
     *
     *  maxDepth - limits recursion when cycle links
     *
     *  <p>Optionally, you can pass a 'filter' function. It will be called on any child object.
     *  You can use this filter to create custom serializations. The following sample exchanges
     *  every 'Date' instance with a custom string.</p>
     *
     *  <pre>
     *  clone:Object = cloneObject(original, function(object:Object):Object
     *      {
     *          if (object is Date) return DateUtil.toString(object as Date);
     *          else return null; // 'null' causes default behaviour
     *      });</pre>
     */
    public static function cloneObject(object:*, maxDepth:int = 2, filter:Function = null):* {
        if (filter != null) {
            var filteredClone:Object = filter(object);
            if (filteredClone) return filteredClone;
        }
        var i:int;
        if (object is Number || object is String || object is Boolean || object == null)
            return object;
        else if (object.hasOwnProperty("clone"))
            return object.clone();
        else if (maxDepth > 0 && object is Array) {
                var arrayClone:Array = [];
                var length:int = object.length;
                for (i = 0; i < length; ++i) arrayClone[i] = cloneObject(object[i], maxDepth - 1, filter);
                return arrayClone;
        } else if (maxDepth > 0 && object is Vector.<*>) {
            var vectorClone:* = object.slice(0,0);
                var length:int = object.length;
                for (i = 0; i < length; ++i) vectorClone[i] = cloneObject(object[i], maxDepth - 1, filter);
                return vectorClone;
        } else {
            var _class:Class = object.constructor;
            var objectClone:* = new _class();
            var typeDescription:XML = null;

            if (maxDepth > 0 && getQualifiedClassName(object) == "Object") {
                for (var key:String in object)
                    objectClone[key] = cloneObject(object[key], maxDepth - 1, filter);
            }
            else {
                typeDescription = describeType(object);
                var properties:XMLList = typeDescription.variable + typeDescription.accessor;

                for each (var property:XML in properties) {
                    var propertyName:String = property.@name.toString();
                    var access:String = property.@access.toString();
                    var nonSerializedMetaData:XMLList = property.metadata.(@name == "NonSerialized");

                    if (maxDepth > 0 && access != "writeonly" && nonSerializedMetaData.length() == 0)
                        objectClone[propertyName] = cloneObject(object[propertyName], maxDepth - 1, filter);
                }
            }

            return objectClone;
        }
    }
}
}