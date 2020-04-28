package {
import fl.controls.TextArea;

import flash.display.Sprite;

public class Test_AdobeAnimateComponents extends Sprite {
    public function Test_AdobeAnimateComponents() {
        var myText:String = "";
        myText += "<p>You can use the <b> tag to create <b>bold</b> text.</p>";
        myText += "<p>You can use the <i> tag to create <i>italic</i> text.</p>";
        myText += "<p>You can use the <u> tag to create <u>underlined</a> text.</p>";
        myText += "<p>You can use the <a> tag to create <a href='http://www.adobe.com'>links to other sites</a>.</p>";
        myText += "<p>You can use the <br> tag to create<br>new lines of text<br>whenever you want.</p>";
        myText += "<p>You can use the <font> tag to specificy different font <font color='#FF0000'>colors</font>, <font size='16'>sizes</font>, or <font face='Times New Roman'>faces</font>.</p>";
        myText += "<p>You can use the <img> tag to load images or SWF files:<br><img src='http://www.helpexamples.com/flash/images/logo.png'>.</p>";

        var myTextArea:TextArea = new TextArea();
        myTextArea.setSize(320, 100);
        myTextArea.move(10, 10);
        myTextArea.htmlText = myText;
        addChild(myTextArea);
    }
}
}
