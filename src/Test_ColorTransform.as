package {
    import flash.display.Sprite;
    import flash.display.GradientType;
    import flash.geom.ColorTransform;
    import flash.events.MouseEvent;

    public class Test_ColorTransform extends Sprite {
        public function Test_ColorTransform() {
            var target:Sprite = new Sprite();
            draw(target);
            addChild(target);
            target.useHandCursor = true;
            target.buttonMode = true;
            target.addEventListener(MouseEvent.CLICK, clickHandler)
        }
        public function draw(sprite:Sprite):void {
            var red:uint = 0xFF0000;
            var green:uint = 0x00FF00;
            var blue:uint = 0x0000FF;
            var size:Number = 100;
            sprite.graphics.beginGradientFill(GradientType.LINEAR, [red, blue, green], [1, 0.5, 1], [0, 200, 255]);
            sprite.graphics.drawRect(0, 0, 100, 100);
        }
        public function clickHandler(event:MouseEvent):void {
            var rOffset:Number = transform.colorTransform.redOffset + 25;
            var bOffset:Number = transform.colorTransform.redOffset - 25;
//            this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, rOffset, 0, bOffset, 0);
            this.transform.colorTransform = new ColorTransform(1, 1, 1, 1,-255,-255,-255);
        }
    }
}
