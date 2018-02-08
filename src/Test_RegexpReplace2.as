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
        txtField.text = "<high><menu>Press a key to set [ <a href=\"event:cancel\"><b>cancel</b></a> ]</menu></high>";
        peerInfo.getTextField("tooltip_info_superbingo/txt_title").text = Env.getString(BingoKeySet.LB_INFO_TITLE_TOOLTIP_SUPERBINGO_ROOMLIST);
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

        //valid HTML
        tf.htmlText = str;
        txtField.htmlText = "<high><menu>Press a key to set [ <a href=\"event:cancel\"><b>cancel</b></a> ]</menu></high>";
        peerInfo.getTextField("tooltip_info_superbingo/txt_title").htmlText = Env.getString(BingoKeySet.LB_INFO_TITLE_TOOLTIP_SUPERBINGO_ROOMLIST);
        //invalid HTML
        txtField.htmlText == "<high><menu>Press a key to set [ <a href=\"event:cancel\"><b>cancel</b></a> ]</menu></high>";
        //peerInfo.getTextField("tooltip_info_superbingo/txt_title").htmlText = Env.getString(BingoKeySet.LB_INFO_TITLE_TOOLTIP_SUPERBINGO_ROOMLIST);
        /*peerInfo.getTextField("tooltip_info_superbingo/txt_title").htmlText = Env.getString(BingoKeySet.LB_INFO_TITLE_TOOLTIP_SUPERBINGO_ROOMLIST);*/
    }
}
}


