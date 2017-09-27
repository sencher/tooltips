package _11112222_fla
{
    import flash.display.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var mc1:c22223333;
        public var mc2:c33334444;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            trace("main timeline inited");
            stop();
            return;
        }// end function

    }
}
