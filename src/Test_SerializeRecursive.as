package {

import com.greensock.TweenLite;
import com.junkbyte.console.Cc;
import com.junkbyte.console.core.ConsoleUtils;

import flash.display.Sprite;

[SWF(height=600,width=500,frameRate=60)]
public class Test_SerializeRecursive extends Sprite {
    private var a:Object = {};
    private var b:Object = {};
    
    private var array:Array = [];
    private var c:Object = {};
    private var d:Object = {};
    
    private var test:*;
    
    private var s:Sprite = new Sprite();

    public function Test_SerializeRecursive() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = 600;
        Cc.width = 500;

        a.name = "a";
        b.name = "b";
        a.link = b;
        b.link = a;
        Cc.log(a);

        c.name = "c";
        d.name = "d";
        c.link = array;
        array.push(c);
        array.push(d);
        Cc.log(array);
        
        var level5:Object = {
            a1:{
                b1:{
                    c1:{
                        x:"bla1"
                    }
                },
                b2:{
                    c2:{
                        d2:{
                            x:"bla2"
                        }
                    }
                }
            },
            a2:{
                b21:{
                    c21:{
                        x:"bla21"
                    }
                },
                b22:{
                    c22:{
                        d22:{
                            x:"bla22"
                        }
                    }
                }
            }
        }
        Cc.log(level5);
        
        Cc.log({i:1689.552,i2:132154,s:"bla!",o:{}, a:[{a1:3},{a2:9,a7:223,a19:"hello"}], zlata:[{privet:"poka"}, {serezha:"chelovek"}, [{z:5}, {b:21}, {f:5, h:9, s:14}]]});
        Cc.log([{a1:3},{a2:-9}]);
    
        s.name = "hello";
        s.x = 250;
        addChild(s);
        
        unitTest(8, ConsoleUtils.untilComma("1689.552,i2:132154,s:\"bla!\""));
        unitTest(6, ConsoleUtils.untilComma("132154,s:\"bla!\""));
        unitTest(1, ConsoleUtils.untilComma("0,\"rotationY\":0,\"rotationZ\":0,\"scaleX\":1,\"cacheAsBitmap\":false,\"mouseChildren\":true,\"opaqueBackground\":null,\"scrollRect\":null,\"filters\":[],\"blendMode\":\"normal\",\"transform\":{\"pixelBounds\":limit,\"matrix3D\":null,\"colorTransform\":limit,\"perspectiveProjection\":null,\"concatenatedMatrix\":limit,\"matrix\":limit,\"concatenatedColorTransform\":limit},\"scaleY\":1,\"scale9Grid\":null,\"mouseEnabled\":true,\"doubleClickEnabled\":false,\"metaData\":null,\"rotation\":0,\"softKeyboardInputAreaOfInterest\":null,\"name\":\"instance1\",\"loaderInfo\":{\"bytes\":limit,\"bytesTotal\":94532,"));
        unitTest(2, ConsoleUtils.untilComma("-3,rer"));
        unitTest(7, ConsoleUtils.untilComma("-336.65,rer"));
        unitTest(5, ConsoleUtils.untilComma("false,rer"));
        unitTest(8, ConsoleUtils.untilComma("falserer"));
        
        unitTest(9, ConsoleUtils.findClosePair("{{{}}{{}}}"));
        unitTest(1, ConsoleUtils.findClosePair("{}{}"));
        unitTest(7, ConsoleUtils.findClosePair("{{{}{}}}{}"));
        unitTest(-1, ConsoleUtils.findClosePair("{{{}}{{}}"));
        unitTest(12, ConsoleUtils.findClosePair("[[a][b][c]{}]"));
        unitTest(8, ConsoleUtils.findClosePair("[[a,b,c]][[a][b][c]{}]"));
        unitTest(12, ConsoleUtils.findClosePair("{[[a,b,c]]{}}[[a][b][c]{}]"));
        unitTest(9, ConsoleUtils.findClosePair("{[]{[]}[]}[[{}{}]]"));
    
        TweenLite.delayedCall(1, init,null,true);
    }
    
    private function init():void{
        Cc.log(s);
    }
    
    private function unitTest(correctAnswer:*, result:*):void{
        if(correctAnswer == result){
            Cc.logc("test", correctAnswer);
        }else {
            Cc.errorc("test", correctAnswer, result);
        }
    }
}
}
