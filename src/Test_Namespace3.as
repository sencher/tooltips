/*В следующем примере имена из пространства имен применяются для выбора подходящего значения переменной.
Здесь показано, как сохранять значение пространства имен в виде переменной и использовать ее
для ссылок на объекты в этом пространстве имен. В примере определяются пространства имен и цвета,
соответствующие состояниям мыши для прямоугольной кнопки. Каждый раз при создании кнопки
в примере применяется подходящий цвет (красный – для курсора за пределами кнопки;
желтый – для курсора на кнопке; белый – для нажатия) путем ссылки на переменную bgcolor
для соответствующего пространства имен (out, over, down).*/

package {
    import flash.display.Sprite;

    public class Test_Namespace3 extends Sprite {
        public function Test_Namespace3() {
            addChild(new StateButton("Press Me."));
        }
    }
}

import flash.display.Sprite;
import flash.text.TextField;
import flash.events.Event;
import flash.events.MouseEvent;

class StateButton extends Sprite{
    private namespace out;
    private namespace over;
    private namespace down;
    private var label:TextField;
    private var labelTxt:String;
    private var ns:Namespace;
    out var bgColor:Number = 0xFF0000;
    over var bgColor:Number = 0xFFFF00;
    down var bgColor:Number = 0xFFFFFF;

    public function StateButton(str:String) {
        buttonMode = true;
        labelTxt = str;
        ns = out;
        draw();
        addLabel();
        addListeners();
    }

    private function addLabel():void {
        label = new TextField();
        label.text = labelTxt;
        label.width = 50;
        label.height = 20;
        label.mouseEnabled = false;
        addChild(label);
    }

    private function addListeners():void {
        addEventListener(MouseEvent.MOUSE_UP, mouseOverHandler);
        addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
        addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
    }

    private function mouseOutHandler(e:Event):void {
        ns = out;
        draw();
    }

    private function mouseOverHandler(e:Event):void {
        ns = over;
        draw();
    }

    private function mouseDownHandler(e:Event):void {
        ns = down;
        draw();
    }

    private function draw():void {
        this.graphics.clear();
        this.graphics.beginFill(ns::bgColor);
        this.graphics.drawRect(0, 0, 60, 20);
    }
} 