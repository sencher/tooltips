/**************************************************************************

Filename    :   WeakRefDictionary.as

Copyright   :   Copyright 2011 Autodesk, Inc. All Rights reserved.

Use of this software is subject to the terms of the Autodesk license
agreement provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

**************************************************************************/
package scaleform.clik.utils {
    
	// IMPORTANT NOTE: THIS DICTIONARY TYPE CANNOT STORE DUPLICATE VALUES! 
	//                 IT IS USED BY FOCUSHANDLER AND HAS LIMITED USAGE
	
    import flash.utils.Dictionary;
    
    public class WeakRefDictionary {
        
    // Constants:
        
    // Public Properties:
        
    // Protected Properties:
        protected var _dictionary:Dictionary;
        
    // Initialization:
        public function WeakRefDictionary() {
            _dictionary = new Dictionary( true ); // Create a weak ref dictionary.    
        }
        
    // Public Getter / Setters:
        
    // Public Methods:
        
        // Value will be stored weak-ref. This means it will actualy be used as the key internally.
        public function setValue( key:Object, value:Object ):void {
            // Clear up any existing key-value pairs that share the same key.
			for (var dvalue:Object in _dictionary) {
				var dkey:Object = _dictionary[dvalue];
				if (key == dkey) {
					delete _dictionary[dvalue];
				}
			}
			
			_dictionary[value] = key;
        }
        
        // Brute force search for now.
        public function getValue( key:Object ):Object {
			for (var dvalue:Object in _dictionary) {
				var dkey:Object = _dictionary[dvalue];
				if (key == dkey) {
					return dvalue;
				}
			}
			return null;
        }
        
    // Protected Methods:
    }
    
}