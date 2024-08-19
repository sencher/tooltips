package wowp.utils.string {

import flash.text.TextField;

public function adjustTextFieldWidth(textfield:TextField):void {
    //DEBUG
//    textfield.border = true;
    
    textfield.width = textfield.textWidth + 10;
}
}