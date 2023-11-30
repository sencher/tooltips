package utils.wg.display
{
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    import wowp.utils.string.size;
    
    /**
     * уменьшает текст до тех пор, пока он весь не влезет в указанный текстфилд
     * @param textField
     * @param text
     * @param minSize
     */
    public function fitTextFieldDecreaseText(textField:TextField, text:String, minSize:int = 8):void {
        var maxLines:int = textField.numLines;
        var tf:TextFormat = textField.defaultTextFormat;
        fitText(text, uint(tf.size));
        var autoSize:String = tf.align;
        
        function fitText(text:String, s:uint):void {
            textField.htmlText = size(text, s);
            textField.autoSize = autoSize;
            if (textField.numLines > maxLines && s > minSize) {
                fitText(text, s - 1);
            }
        }
    }
    
}
