package folder {
public class Time {

    public var seconds:int = 0;
    public var minutes:int = 0;
    public var hours:int = 0;
    public var days:int = 0;

    private var _units:TimeUnits;

    public function Time(miliseconds:Number = 0) {
        var totalSeconds:int = miliseconds / 1000;
        seconds = totalSeconds % 60;
        minutes = totalSeconds / 60 % 60;
        hours = totalSeconds / Math.pow(60, 2) % 24;
        days = totalSeconds / (Math.pow(60, 2) * 24) % 30;
        _units = new TimeUnits();
    }

    public function setUnits(units:TimeUnits):void {
        _units = units;
    }

    public function toString():String
    {
        var string:String = "";
        if (days) string += days + _units.days;// + ""
        if (hours) string += hours + _units.hours;
        if (minutes) string += minutes + _units.minutes;
        if (seconds) string += seconds + _units.seconds;

        return string;
    }
}
}
