package {
import flash.display.Sprite;
import flash.events.ErrorEvent;
import flash.events.MouseEvent;
import flash.events.UncaughtErrorEvent;

public class Test_UncaughtErrorEvent extends Sprite
{
    public function Test_UncaughtErrorEvent()
    {
        loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, uncaughtErrorHandler);

        drawUI();
    }

    private function uncaughtErrorHandler(event:UncaughtErrorEvent):void
    {
        if (event.error is Error)
        {
            var error:Error = event.error as Error;
            // do something with the error
        }
        else if (event.error is ErrorEvent)
        {
            var errorEvent:ErrorEvent = event.error as ErrorEvent;
            // do something with the error
        }
        else
        {
            // a non-Error, non-ErrorEvent type was thrown and uncaught
        }
    }

    private function drawUI():void
    {
        var btn:Sprite = new Sprite();
        btn.graphics.clear();
        btn.graphics.beginFill(0xFFCC00);
        btn.graphics.drawRect(0, 0, 100, 50);
        btn.graphics.endFill();
        addChild(btn);
        btn.addEventListener(MouseEvent.CLICK, clickHandler);
    }

    private function clickHandler(event:MouseEvent):void
    {
        throw new Error("Gak!");
    }
}
}
