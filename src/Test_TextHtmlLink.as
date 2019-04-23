package {
import flash.display.Sprite;
import flash.events.TextEvent;
import flash.errors.IOError;
import flash.events.IOErrorEvent;
import flash.system.Capabilities;
import flash.net.navigateToURL;
import flash.net.URLRequest;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.display.Shape;
import flash.display.Graphics;

public class Test_TextHtmlLink extends Sprite {
    private  var myCircle:Shape = new Shape();

    public function Test_TextHtmlLink() {
        var myTextField:TextField = new TextField();
        myTextField.selectable = false;
        myTextField.autoSize = TextFieldAutoSize.LEFT;
        myTextField.multiline = true;
        myTextField.background = true;
        myTextField.htmlText = "Draw a circle with the radius of <u><a href=\"event:20\">20 pixels</a></u>.<br>"
                +  "Draw a circle with the radius of <u><a href=\"event:50\">50 pixels</a></u>.<br><br>"
                +  "<u><a href=\"event:os\">Learn about your operating system.</a></u><br>"
                +  "<u><a href=\"event:shit\">Trace Some Shit.</a></u><br>";

        myTextField.addEventListener(TextEvent.LINK, linkHandler);

        this.addChild(myTextField);
        this.addChild(myCircle);
    }

    private function linkHandler(e:TextEvent):void {
        var osString:String = Capabilities.os;

        if(e.text == "os") {

            if (osString.search(/Windows/) != -1 ){
                navigateToURL(new URLRequest("http://www.microsoft.com/"), "_self");
            }else if (osString.search(/Mac/) != -1 ) {
                navigateToURL(new URLRequest("http://www.apple.com/"), "_self");
            } else if (osString.search(/linux/i)!= -1) {
                navigateToURL(new URLRequest("http://www.tldp.org/"), "_self");
            }

        } else if(e.text == "shit") {
            trace("Some Shit!");
        }else{
            myCircle.graphics.clear();
            myCircle.graphics.beginFill(0xFF0000);
            myCircle.graphics.drawCircle(100, 150, Number(e.text));
            myCircle.graphics.endFill();
        }
    }
}
}