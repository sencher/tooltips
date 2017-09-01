package {
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

public class Test_Timer extends Sprite {
    private var _leaderboardTimer:Timer;
    private var _leaderboardReceived:Boolean;
    private var _leaderboardReceivedTime:int;

    public function Test_Timer() {
        stage.addEventListener(MouseEvent.CLICK, onClick)
    }

    private function onClick(event:MouseEvent):void {
        var date:Date = new Date();
        var time:int = date.time;
        trace("onClick", time, _leaderboardReceivedTime, time - _leaderboardReceivedTime)
        if(!_leaderboardTimer && time - _leaderboardReceivedTime > 10000){
            _leaderboardReceived = false;
            request();
        }

    }

    private function request():void {
        trace("request",_leaderboardReceived);
        if(!_leaderboardReceived) {
            ask_league_top_players();
            _leaderboardTimer = new Timer(1000);
            _leaderboardTimer.addEventListener(TimerEvent.TIMER, ask_league_top_players);
            _leaderboardTimer.reset();
            _leaderboardTimer.start();
        }
    }

    private function ask_league_top_players(event:TimerEvent = null):void {
        trace("ask_league_top_players");
        if(Math.random() > 0.8){
            response();
        }
    }

    private function response():void {
        if(_leaderboardTimer){
            _leaderboardReceived = true;
            _leaderboardReceivedTime = new Date().time;
            trace(_leaderboardReceivedTime);
            _leaderboardTimer.stop();
            _leaderboardTimer.removeEventListener(TimerEvent.TIMER, ask_league_top_players);
            _leaderboardTimer = null;
            trace("_leaderboardReceived",_leaderboardReceived);
        }
    }
}
}
