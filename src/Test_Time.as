package {
import flash.display.Sprite;
import flash.utils.getTimer;

import folder.StringHelper;

import folder.Time;

public class Test_Time extends Sprite{

    private var ms:int;
    public var d:Date;
    private var d2:Test_Date;
//    public var value:Number = 25157762345;
    public var value:Number = (2592000000)*(8.5/30);

    public function Test_Time() {

        d = new Date();//0,0,0,0,0,0,value);
        d.setTime(value);
//        d.setMilliseconds(value)
//        trace(d.getTime())
        trace(d.monthUTC+"m "+d.dateUTC+"d "+d.hoursUTC+"h "+d.minutesUTC+"m "+d.secondsUTC+"s "+d.millisecondsUTC+"ms")
//        trace(d.valueOf())
//        trace(d.toString())
//        trace(d.toTimeString())
//        trace(d.valueOf())
//
//        d2 = new Date(0);
//        trace(d2.valueOf())
//        var a:* = d.valueOf() - d2.valueOf();
//        trace(a);


        var ts:Number = value / 1000;
        var tm:Number = ts / 60;
        var th:Number = tm / 60;
        var td:Number = th / 24;

        var s:int = ts % 60;
        var m:int = tm % 60;//Math.pow(60,2);
        var h:int = th % 24;
        var dd:int = td % 30;

        var m2:int = ts / 60 % 60;
        var h2:int = ts / Math.pow(60, 2) % 24;
        var dd2:int = ts / (Math.pow(60, 2) * 24) % 30;

//        var s3:int = (value / 1000) % 60;
//        var m3:int = tm % 60;
//        var h3:int = th % 24;
//        var d3:int = td % 30;
        var t:Time = new Time(value);
        trace(t.toString());
        trace("1111 "+ d.toString())
        trace("2222 "+ d.toLocaleTimeString())
        trace("3333 "+ d.toUTCString())
        trace(get_date_str(d))
        trace(get_simple_date_string(value/1000))
    }

    public function n1ame():void {

    }

    public static function get_date_str(date:Date, delimiter:String = " "):String {
        var str:String = date.getFullYear().toString();
        var month:String = (date.getMonth() + 1).toString();
        var day:String = date.getDate().toString();
        str = str + delimiter + (month.length == 1 ? "0" + month : month);
        str = str + delimiter + (day.length == 1 ? "0" + day : day);
        return str;
    }

    public static function get_simple_date_string(time:int):String {
        var seconds:int = time % 60;
        time = time / 60;
        var minutes:int = time % 60;
        time = time / 60;
        var hours:int = time;

        return StringHelper.substitute("{0}:{1}:{2}", hours,
                (minutes < 10 ? "0" : "") + minutes,
                (seconds < 10 ? "0" : "") + seconds);
    }
}
}
