package components {
import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Shape;
import flash.geom.Rectangle;
import flash.text.TextField;
import flash.text.TextFormat;

import utils.Utils;

public class ObstacleTextField extends TextField {
    public var debug:Boolean;

    private const LEFT:String = "left";
    private const RIGHT:String = "right";
    private const MARGIN:int = 3;

    private var debugBoxes:Vector.<Shape>;

    private var textField:TextField;
    private var format:TextFormat;
    private var initBoundaries:Rectangle;
    private var initTextBoundaries:Rectangle;
    private var textFieldBoundaries:Rectangle;
    private var textBoundaries:Rectangle;
    private var initSize:Number;
    private var initX:Number;
    private var initY:Number;
    private var obstacles:Array;
    private var commonParent:DisplayObjectContainer;
    private var evasionStrategy:String;

    public function ObstacleTextField(tf:TextField, obstacles:Array, debug:Boolean = false) {
        textField = tf;
        setObstacles(obstacles);
        commonParent = Utils.getCommonParent(tf, obstacles);
        this.debug = debug;

//        format = tf.getTextFormat();
//        initSize = Number(format.size);
        initX = tf.x;
//        initY = tf.y;
//        initBoundaries = tf.getBounds(commonParent);
//        initTextBoundaries = getCharsBoundaries(textField);
        update();
    }

    public function setObstacles(array:Array):void {
        obstacles = Utils.removeNullElements(array);
    }

    public function update():void {

        if (debug && (!debugBoxes || debugBoxes.length != obstacles.length + 1)) {
            reInitDebug();
            debugBoxes.push(Utils.drawBox(0, 0, 100, 100, 0, 0xaa0000, 0.5));
            for (var i:int = 0; i < obstacles.length; i++) {
                debugBoxes.push(Utils.drawBox(0, 0, 100, 100, 0, 0x00aa00, 0.5));
            }
        }

        updateTextBoundaries();
        var intersection:Rectangle;
        var mostXIntersection:Rectangle;

        var minX:Number = Number.MAX_VALUE;
        var maxX:Number = Number.MIN_VALUE;
        var obstacleBounds:Rectangle;
        var intersections:Array = [];

        for each (var o:DisplayObject in obstacles) {
            obstacleBounds = o.getBounds(commonParent);
            if(obstacleBounds.x < textBoundaries.x){
                evasionStrategy = RIGHT;
            }else{
                evasionStrategy = LEFT;
            }

            intersection = textBoundaries.intersection(o.getBounds(commonParent));
            if (intersection.width) {
                if(evasionStrategy == LEFT) {
                    if (minX > intersection.x) {
                        mostXIntersection = intersection;
                    }
                }else{
                    if(maxX < intersection.x){
                        mostXIntersection = intersection;
                    }
                }
            }
        }

        if (mostXIntersection) {
            if(evasionStrategy == LEFT) {
                textField.x -= (textBoundaries.x + textBoundaries.width) - mostXIntersection.x + MARGIN;
            }else {
                textField.x += mostXIntersection.width + MARGIN;
            }
        } else {
            resetShift();
        }

        if (debug) {
            updateTextBoundaries();

            var tfBounds:Rectangle = textField.getBounds(commonParent);
            Cc.logch("Obstacle", tfBounds.x, textBoundaries.x, textBoundaries.x + textBoundaries.width);

            setBoxDimentions(debugBoxes[0], textBoundaries);
            for (i = 0; i < obstacles.length; i++) {
                setBoxDimentions(debugBoxes[i + 1], DisplayObject(obstacles[i]).getBounds(commonParent));
                Cc.logch("Obstacle",debugBoxes[i + 1].x);
            }
        }
    }

    private function updateTextBoundaries():void {
        textFieldBoundaries = textField.getBounds(commonParent);
        textBoundaries = getCharsBoundaries(textField);
    }

    private function reInitDebug():void {
        for each(var i:Shape in debugBoxes) {
            if (i.parent) {
                i.parent.removeChild(i);
            }
        }

        debugBoxes = new Vector.<Shape>();
    }

    private function setBoxDimentions(debugBox:DisplayObject, target:Rectangle, shift:Rectangle = null):void {
        if (commonParent && !debugBox.parent) {
            commonParent.addChild(debugBox);
        }

        if (!shift) shift = new Rectangle();

        debugBox.x = target.x + shift.x;
        debugBox.y = target.y + shift.y;
        debugBox.width = target.width;
        debugBox.height = target.height;
    }

    private function resetShift():void {
        if (!anyCollisions(new Rectangle(textBoundaries.x + (initX - textField.x), textBoundaries.y, textBoundaries.width, textBoundaries.height))) {
            textField.x = initX;
        }
    }

    private function anyCollisions(rectangle:Rectangle):Boolean {
        for each (var i:DisplayObject in obstacles) {
            var intersection:Rectangle = rectangle.intersection(i.getBounds(commonParent));
            if (intersection.width) {
                return true;
            }
        }
        return false;
    }

    private function getCharsBoundaries(tf:TextField):Rectangle {
        var r:Rectangle = tf.getCharBoundaries(0);
        for (var i:int = 1; i < tf.text.length; i++) {
            summCharRectangles(r, tf.getCharBoundaries(i));
        }

        r.x += textFieldBoundaries.x;
        r.y += textFieldBoundaries.y;
        return r;
    }

    private function summCharRectangles(main:Rectangle, additional:Rectangle):void {

        if (main.y < additional.y) {
            main.y = additional.y;
        }
        if (main.height < additional.height) {
            main.height = additional.height;
        }

        main.width += additional.width;
    }
}
}
