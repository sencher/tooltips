package {
import by.blooddy.crypto.Base64;

import flash.display.Sprite;
import flash.utils.ByteArray;

public class Test_Base64 extends Sprite {
    //https://www.reddit.com/r/hearthstone/comments/6f2xyk/how_to_encodedecode_deck_codes/
    private var deckCode:String = "AAEBAaoIAfmsAgAA";
    private var deckCode2:String = "AAECAaoIAAAA";
    private var test:String = "test";
    
    public function Test_Base64() {
        
        var result:ByteArray = Base64.decode(deckCode);
        var result2:ByteArray = Base64.decode(deckCode2);
        traceByteArrays(result, result2);
//        trace(result[4]);
//        result[4] = 7;//hexToDecimal(1066);
//        trace(result[4]);
//        traceByteArray(result);
//        var encodedString:String = Base64.encode(result);
//        trace(encodedString);


//        var decimal:int = 163;
//        trace("decimal: " + decimal);
//        var hex:String = decimalToHex(decimal, 4);
//        trace("hex: " + hex);
//
//        trace(hexToDecimal(1066));
    }
    
    private function decimalToHex($decimal:int, $padding:int = 2):String {
        var hex:String = Number($decimal).toString(16);
        while (hex.length < $padding) {
            hex = "0" + hex;
        }
        return hex.toUpperCase();
    }
    
    private function hexToDecimal(hex:*):int {
        return parseInt(hex, 16);
    }
    
    private function traceByteArray(ba:ByteArray):void {
//        readAll(ba);
        for (var i:int = 0; i < ba.length; i++) {
            trace(ba[i]);
        }
    }
    
    private function traceByteArrays(ba1:ByteArray, ba2:ByteArray):void {
//        readAll(ba);
        var length:int = ba1.length > ba2.length ? ba1.length : ba2.length;
        for (var i:int = 0; i < length; i++) {
            trace(ba1[i], ba2[i]);
        }
    }
    
    private function readAll(ba:ByteArray):void {
        trace("*************");
        try {
            ba.position = 0;
            trace("readUTF", ba.readUTF());
        } catch (e:Error) {
            trace("readUTF error");
        }
        
        try {
            ba.position = 0;
            trace("readBoolean", ba.readBoolean());
        } catch (e:Error) {
            trace("readBoolean error");
        }
        
        try {
            ba.position = 0;
            trace("readByte", ba.readByte());
        } catch (e:Error) {
            trace("readByte error");
        }
        
        try {
            ba.position = 0;
            trace("readDouble", ba.readDouble());
        } catch (e:Error) {
            trace("readDouble error");
        }
        
        try {
            ba.position = 0;
            trace("readFloat", ba.readFloat());
        } catch (e:Error) {
            trace("readFloat error");
        }
        
        try {
            ba.position = 0;
            trace("readInt", ba.readInt());
        } catch (e:Error) {
            trace("readInt error");
        }
        
        try {
            ba.position = 0;
            trace("readShort", ba.readShort());
        } catch (e:Error) {
            trace("readShort error");
        }
        
        try {
            ba.position = 0;
            trace("readUnsignedByte", ba.readUnsignedByte());
        } catch (e:Error) {
            trace("readUnsignedByte error");
        }
        
        try {
            ba.position = 0;
            trace("readUnsignedInt", ba.readUnsignedInt());
        } catch (e:Error) {
            trace("readUnsignedInt error");
        }
        
        try {
            ba.position = 0;
            trace("readUnsignedShort", ba.readUnsignedShort());
        } catch (e:Error) {
            trace("readUnsignedShort error");
        }
        
        try {
            ba.position = 0;
            trace("readUTFBytes", ba.readUTFBytes(ba.length));
        } catch (e:Error) {
            trace("readUTFBytes error");
        }
        
        //https://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/charset-codes.html
        try {
            ba.position = 0;
            trace("readMultiByte/windows-1251", ba.readMultiByte(ba.length, "windows-1251"));
        } catch (e:Error) {
            trace("readMultiByte/windows-1251 error");
        }
        
    }
}
}
