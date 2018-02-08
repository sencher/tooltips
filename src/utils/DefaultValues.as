package utils {
public class DefaultValues {
    public static var FONT_NAME_VAG_ROUNDED_BT:String = "VAGRounded BT";
    public static var FONT_NAME_VAG_ROUNDED_CYRILLIC:String = "VAG Rounded LT CYR Bold";
    public static var FONT_NAME_TIMES_NEW_ROMAN:String = "Times New Roman";
    public static var FONT_NAME_OFFICINA_SERIF:String = "ITC Officina Serif LT Bold";
    public static var FONT_NAME_OFFICINA_SERIF_CYRILLIC:String = "ITCOfficinaSerif LT Book";
    public static var FONT_NAME_ARIAL:String = "Arial";
    public static var FONT_NAME_ARIAL_BOLD:String = "Arial Bold";
    public static var FONT_NAME_ARIAL_BLACK:String = "Arial Black";
    public static var FONT_NAME_MYRIAD_PRO:String = "Myriad Pro";

    [Embed(source='../../FLA_experiments/fonts/myriad_pro_light_bold.swf', fontName='Myriad Pro Light', fontWeight='bold')]
    public static var FONT_MYRIAD_PRO_LIGHT_BOLD_CLASS:Class;

    [Embed(source='../../FLA_experiments/fonts/MyriadPro-Bold.otf', fontName='Myriad Pro', mimeType="application/x-font", embedAsCFF="false")]
    public static var FONT_MYRIAD_PRO_BOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/times.ttf", fontFamily="Times New Roman", mimeType="application/x-font", embedAsCFF="false")]
    private const FONT_TIMES_NEW_ROMAN:Class;

    [Embed(source="../../FLA_experiments/fonts/arial.ttf", fontFamily="Arial", mimeType="application/x-font", embedAsCFF="false")]
    private const FONT_ARIAL:Class;

    [Embed(source="../../FLA_experiments/fonts/arialbd.ttf", fontFamily="Arial Bold", mimeType="application/x-font", embedAsCFF="false")]
    private const FONT_ARIAL_BOLD:Class;

    [Embed(source="../../FLA_experiments/fonts/ariblk.ttf", fontFamily="Arial Black", mimeType="application/x-font", embedAsCFF="false")]
    private const FONT_ARIAL_BLACK:Class;

    [Embed(source="../../FLA_experiments/fonts/futura-bold-condensed.ttf", fontFamily="Futura Bold Condensed", mimeType="application/x-font", embedAsCFF="false")]
    private const FONT_FUTURA_BOLD_CONDENSED2:Class;

    [Embed(source="../../FLA_experiments/fonts/FuturaBT-ExtraBlackCondensed.ttf", fontFamily="Futura Extra Black Condensed BT", mimeType="application/x-font", embedAsCFF="false")]
    private const FONT_FUTURA_EXTRA_BLACK_CONDENSED:Class;

    [Embed(source='../../FLA_experiments/fonts/futura-bold-condensed.swf', fontName='Futura BdCn BT', fontWeight='bold')]
    private const FONT_FUTURA_BOLD_CONDENSED:Class;
}
}
