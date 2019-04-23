package {
import flash.display.Sprite;

public class Test_StringRegexp extends Sprite {

    public var FONT_NAME_VAGROUNDED_BT:String = "VAGRounded BT";
    public var FONT_NAME_VAG_ROUNDED_BT:String = "VAG Rounded BT";
    public var FONT_NAME_VAG_ROUNDED_LT_CYR_BOLD:String = "VAG Rounded LT CYR Bold";
    public var MULTI_FONT_VAG_ROUNDED:String = "mVAG Rounded LT CYR Bold";

    public var FONT_NAME_MYRIAD_PRO:String = "Myriad Pro";
    public var FONT_NAME_MYRIAD_PRO_SEMIBOLD:String = "Myriad Pro Semibold";
    public var MULTI_FONT_MYRIAD_PRO_SEMIBOLD:String = "mMyriad Pro Semibold";
    public var FONT_NAME_MYRIAD_PRO_BOLD:String = 'Myriad Pro Bold';
    public var MULTI_FONT_MYRIAD_PRO_BOLD:String = 'mMyriad Pro Bold';

    public var FONT_NAME_TIMES_NEW_ROMAN:String = "Times New Roman";
    public var MULTI_FONT_TIMES_NEW_ROMAN:String = "mTimes New Roman";

    public var FONT_NAME_ARIAL:String = "Arial";
    public var FONT_NAME_ARIAL_BOLD:String = "Arial Bold";
    public var FONT_NAME_ARIAL_BLACK:String = "Arial Black";
    public var MULTI_FONT_ARIAL:String = "mArial";
    public var MULTI_FONT_ARIAL_BOLD:String = "mArial Bold";
    public var MULTI_FONT_ARIAL_BLACK:String = "mArial Black";

    public var FONT_NAME_DIGITAL:String = "DS-Digital";
    public var FONT_NAME_DIGITAL_BOLD:String = "DS-Digital Bold";

    public var FONT_NAME_OPEN_SANS_SEMIBOLD:String = "Open Sans SemiBold";
    public var MULTI_FONT_OPEN_SANS_SEMIBOLD:String = "mOpen Sans Semibold";

    public var FONT_NAME_OFFICINA_SANS_BOLD:String = "ITC Officina Sans LT Bold";
    public var FONT_NAME_OFFICINA_SERIF_BOOK:String = "ITCOfficinaSerif LT Book";

    private static const REG_VAG_ROUNDED:RegExp = /vag.*rounded/i;
    private static const REG_VAG_ROUNDED_CYR:RegExp = /vag.*rounded.*cyr/i;
    private static const REG_TIMES_NEW_ROMAN:RegExp = /times.*new.*roman/i;
    private static const REG_ARIAL:RegExp = /arial/i;
    private static const REG_ARIAL_BOLD:RegExp = /arial.*bold/i;
    private static const REG_ARIAL_BLACK:RegExp = /arial.*black/i;
    private static const REG_OPEN_SANS:RegExp = /open.*sans/i;
    private static const REG_MYRIAD_PRO:RegExp = /myriad.*pro/i;
    private static const REG_MYRIAD_PRO_BOLD:RegExp = /myriad.*pro((?!semi).)*bold/i;
    
    public function Test_StringRegexp() {
//        var regVagRounded:RegExp = /vag.*rounded/i;
//        trace(regVagRounded.test(" VAG2RoundedLTCYR-Bold"));
//        trace(regVagRounded.test("VaG     RoundedLTCYR-Bold"));
//        trace(regVagRounded.test("mVAG2Rounded   LTCYR-Bold"));
//        trace(regVagRounded.test("-VAG-Rounded-LTCYR-Bold-    \/"));
//        trace(regVagRounded.test(FONT_NAME_VAGROUNDED_BT));
//        trace(regVagRounded.test(FONT_NAME_VAG_ROUNDED_BT));
//        trace(regVagRounded.test(FONT_NAME_VAG_ROUNDED_LT_CYR_BOLD));
//        trace(regVagRounded.test(MULTI_FONT_VAG_ROUNDED));

        trace(REG_VAG_ROUNDED_CYR.test("VAG Rounded LT CYR Bold"));
        trace(REG_VAG_ROUNDED.test("VAG Rounded LT CYR Bold"));

//        trace(REG_MYRIAD_PRO_BOLD.test(FONT_NAME_MYRIAD_PRO));
//        trace(REG_MYRIAD_PRO_BOLD.test(FONT_NAME_MYRIAD_PRO_SEMIBOLD));
//        trace(REG_MYRIAD_PRO_BOLD.test(MULTI_FONT_MYRIAD_PRO_SEMIBOLD));
//        trace(REG_MYRIAD_PRO_BOLD.test(FONT_NAME_MYRIAD_PRO_BOLD));
//        trace(REG_MYRIAD_PRO_BOLD.test(MULTI_FONT_MYRIAD_PRO_BOLD));
//        trace(REG_MYRIAD_PRO_BOLD.test('mMyriad Pro Bold bold'));
//        trace(REG_MYRIAD_PRO_BOLD.test('mMyriad Pro Bold bold'));
//        trace(REG_MYRIAD_PRO_BOLD.test(' Myriad Pro Bold bold'));
//        trace(REG_MYRIAD_PRO_BOLD.test(' MyriadPro fff Bold bold'));
//        trace(REG_MYRIAD_PRO_BOLD.test(' MyriadPro semi ff bold'));
//        trace(REG_MYRIAD_PRO_BOLD.test(' MyriadPro semi bold bold'));
//        trace(REG_MYRIAD_PRO_BOLD.test(' MyriadPro semi bold semi'));

    }
}
}
