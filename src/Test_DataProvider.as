package {

import flash.display.Sprite;

import scaleform.clik.data.DataProvider;

import wowp.utils.array.toArray;

public class Test_DataProvider extends Sprite {
    public function Test_DataProvider() {
        
        var s1:Sprite = new Sprite();
        s1.name = "first";
        var s2:Sprite = new Sprite();
        s2.name = "second";
        var s3:Sprite = new Sprite();
        s3.name = "third";
        var s4:Sprite = new Sprite();
        s4.name = "forth";
        var s5:Sprite = new Sprite();
        s5.name = "fifth";
        
        var vector1:Vector.<Sprite> = new Vector.<Sprite>();
        var vector2:Vector.<Sprite> = new Vector.<Sprite>();
        var vector3:Vector.<Sprite> = new Vector.<Sprite>();
        var vector4:Vector.<Sprite> = new Vector.<Sprite>();
        var vector5:Vector.<Sprite> = new Vector.<Sprite>();
        
        vector1.push(s1, s2);
        vector2.push(s1, s2);
        vector3.push(s1, s2, s3);
        vector4.push(s1, s3, s2);
        vector5.push(s1, s2, s3, s4, s5);
        
        var a1:Array = [s1, s2];
        var a2:Array = [s1, s2];
        var a3:Array = [s1, s2, s3];
        var a4:Array = [s1, s3, s2];
        var a5:Array = [s1, s2, s3, s4, s5];
        
//        trace(vector);
        
        
        
        var dp1:DataProvider = new DataProvider(toArray(vector1));
        var dp2:DataProvider = new DataProvider(toArray(vector2));
        var dp3:DataProvider = new DataProvider(toArray(vector3));
        var dp4:DataProvider = new DataProvider(toArray(vector4));
        var dp5:DataProvider = new DataProvider(toArray(vector5));
        
        trace(dp1.isEqualWith(dp2, false));
        trace(dp1.isEqualWith(dp3, false));
        trace(dp3.isEqualWith(dp4, false));
        trace(dp1.isEqualWith(dp5, false));
        trace(dp4.isEqualWith(dp3, false));
        trace("*****");
        trace(dp1.isEqualWith(dp2, true));
        trace(dp1.isEqualWith(dp3, true));
        trace(dp3.isEqualWith(dp4, true));
        trace(dp1.isEqualWith(dp5, true));
        trace(dp4.isEqualWith(dp3, true));
        trace("*****");
        trace(dp3.isEqualWith(a4));
        trace(dp3.isEqualWith(vector4));
        trace(dp3.isEqualWith(a4, true));
        trace(dp3.isEqualWith(vector4, true));
        
//        trace("dp1 == dp2",dp1 == dp2);
//        trace("dp1[0] == dp2[0]",dp1[0] == dp2[0]);
//        trace("dp1[1] == dp2[1]",dp1[1] == dp2[1]);
    }
}
}
