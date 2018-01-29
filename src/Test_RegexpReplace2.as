package {

import flash.display.Sprite;
/*
    ^([ \f\t]*)((?:(?!this)[^\/\n])*)\.text\s*=[ \f\t]*([^$;\n=]+)
    $1UIUtils.updateLabel($2, $3)
 */
public class Test_RegexpReplace2 extends Sprite {
    public function Test_RegexpReplace2() {
        //valid
        ttt.text = Localisation(STR_CODE);
        ttt.text=  Localisation(STR_CODE);
        ttt.text= Localisation(STR_CODE);
        ttt.text = Localisation(STR_CODE)
        ttt.text=Localisation(STR_CODE);
        tt.hghgt.text=Localisation(STR_CODE);
        UIUtils.updateLabel(tf, str, true);

        //invalid
        preFilled.setVisible(field.text == "");
        ttt.textLocalisation(STR_CODE);
        ttt.text Localisation(STR_CODE);
        ttttext=Localisation(STR_CODE)
        tt.hghgt.text=;
        tt.hghgt.text=
        //_captionField.text = cover.caption;
    /*    _captionField.text = cover.caption;*/
        this.text = text;
    }
}
}


