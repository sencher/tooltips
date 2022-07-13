package {

import flash.display.Sprite;
import flash.utils.describeType;

import legacy.MessageTypeID;

import legacy.MessageTypeIdToName;

public class Test_Static extends Sprite{
    public function Test_Static() {
        var o = [[[{IMessage:{chain:0, msgData:{from:{action:"", id:null, name:""}, id:783786707, items:[{id:1022, type:"accountconsumable", value:5}],
                    localized:""}, msgHeader:null, msgType:472, senderName:"", utcTime:1656949907.630281}}, 1143375283, "message"]], 0];
        
        var o2 = [[[{IMessage:{chain:0, msgData:{msgList:[
                        {msgData:{itemCount:3, itemID:901, itemType:"warcash"}, msgType:492},
                        {msgData:{itemCount:2, itemID:7, itemType:"piece", questChips:1}, msgType:477}]},
                msgHeader:null, msgType:150, senderName:"", utcTime:1656955568.99076}}, 1686389338, "message"]], 0]
        
//        trace(o2[0][0][0]["IMessage"].msgType);
//        trace(MessageTypeIdToName.dict[o[0][0][0]["IMessage"].msgType]);
//        trace(MessageTypeIdToName.dict[o2[0][0][0]["IMessage"].msgType]);
//        if (MessageTypeIdToName.dict[o2[0][0][0]["IMessage"].msgType == MessageTypeID.MESSAGE_GROUP) {
//            var list:Array = MessageTypeIdToName.dict[o2[0][0][0]["IMessage"].msgData.msgList as Array;
//            for each(var innerMessage:Object in list) {
//                trace(MessageTypeIdToName.dict[o2[0][0][0]["IMessage"].msgType]);
//            }
//        }
        
        trace(unpack(o[0][0][0]["IMessage"]));
        trace(unpack(o2[0][0][0]["IMessage"]));
        
        
        
    }
    
    private function unpack(value:Object):String{
        var result:String = "";
        if(value.msgType == MessageTypeID.MESSAGE_GROUP){
            var list:Array = value.msgData.msgList as Array;
            result += "[";
            for each(var innerMessage:Object in list) {
                result += unpack(innerMessage) + ", ";
            }
            result = result.substring(0, result.length-2) + "]";
        }else{
            result += MessageTypeIdToName.dict[value.msgType];
        }
        return result;
    }
}
}
