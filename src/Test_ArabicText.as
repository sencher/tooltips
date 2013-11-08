package {
    import flash.display.Sprite;
    import flash.text.AntiAliasType;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.external.*
    import fl.text.TLFTextField;
    import flash.text.TextFormat;

    import mx.core.FlexTextField;

    public class Test_ArabicText extends Sprite{
        public function Test_ArabicText() {

            import flashx.textLayout.formats.TextLayoutFormat;
            import flashx.textLayout.elements.TextFlow;


            var arabicTextField:TLFTextField = new TLFTextField();
            arabicTextField.antiAliasType = AntiAliasType.ADVANCED;
            arabicTextField.mouseEnabled = false;
            arabicTextField.selectable = false;

            arabicTextField.direction = flashx.textLayout.formats.Direction.RTL;

            var fmt:TextFormat = new TextFormat();
            fmt.color = 0xFFFFFF;
            fmt.font = "arialArabic"
            arabicTextField.embedFonts = false;
            arabicTextField.defaultTextFormat = fmt;
            arabicTextField.setTextFormat(fmt);
            addChild(arabicTextField)
        }
    }
}
