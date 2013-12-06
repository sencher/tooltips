package {
    import flash.system.Security;
    import flash.display.Loader;
    import flash.events.*;
    import flash.net.URLRequest;
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class Test_Youtube extends MovieClip {
        public var player:Object;
        private var playBtn:PlayBtn;
        private var pauseBtn:PauseBtn;
        private var stopBtn:StopBtn;

        public function Test_Youtube(/*vidId:String*/) {
            var vidId:String = "1IM1WCFwzY8";
            player = {};

            Security.allowDomain("http://www.youtube.com");
            var loader1:Loader = new Loader();
            loader1.contentLoaderInfo.addEventListener(Event.INIT, onLoaderInit);
            loader1.load(new URLRequest("http://www.youtube.com/apiplayer?version=3"));

            function onLoaderInit(event:Event):void {
                addChild(loader1);
                loader1.content.addEventListener("onReady", onPlayerReady);
                loader1.content.addEventListener("onError", onPlayerError);
                loader1.content.addEventListener("onStateChange", onPlayerStateChange);
                loader1.content.addEventListener("onPlaybackQualityChange", onVideoPlaybackQualityChange);

                playBtn = new PlayBtn();
                pauseBtn = new PauseBtn();
                stopBtn = new StopBtn();


                playBtn.x = pauseBtn.x = stopBtn.x = 430;
                playBtn.y = 20;
                pauseBtn.y = 50;
                stopBtn.y = 80;


                playBtn.addEventListener(MouseEvent.CLICK, playP);
                pauseBtn.addEventListener(MouseEvent.CLICK, pauseP);
                stopBtn.addEventListener(MouseEvent.CLICK, stopP);


                addChild(playBtn);
                addChild(pauseBtn);
                addChild(stopBtn);
            }

            function onPlayerReady(event:Event):void {
                // Event.data contains the event parameter, which is the Player API ID
                trace("player ready:", Object(event).data);

                // to load a particular YouTube video.
                player = loader1.content;
                player.addEventListener(MouseEvent.CLICK, setPsize);
                player.loadVideoById(vidId);
                player.setSize(448, 252);


            }


            function onPlayerError(event:Event):void {
                // Event.data contains the event parameter, which is the error code
                trace("player error:", Object(event).data);
            }

            function onPlayerStateChange(event:Event):void {
                // Event.data contains the event parameter, which is the new player state
                trace("player state:", Object(event).data);


                if (Object(event).data == 1) {
                    //if(loading!=null){
                    //removeChild(loading);
                    //loading=null;
                    //}
                }

            }

            function onVideoPlaybackQualityChange(event:Event):void {
                // Event.data contains the event parameter, which is the new video quality
                trace("video quality:", Object(event).data);
            }
        }

        public function setPsize(evt:MouseEvent):void {
            player.setSize(640, 360);
        }

        public function playP(evt:MouseEvent):void {
            if (player) {

                player.playVideo();
            }
        }

        public function pauseP(evt:MouseEvent):void {
            if (player) {

                player.pauseVideo();
            }
        }

        public function stopP(evt:MouseEvent):void {
            if (player) {

                player.stopVideo();
            }
        }

        public function muteP(evt:MouseEvent):void {
            if (player) {

                player.mute();
            }

        }

        public function unMuteP(evt:MouseEvent):void {
            if (player) {

                player.unMute();
            }
        }

        //player.isMuted():Boolean

        //player.setVolume(volume:Number):Void

    }
}