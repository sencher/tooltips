package components {
import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Shape;
import flash.geom.Rectangle;
import flash.text.TextField;

import utils.Utils;

public class ObstacleTextField extends TextField {
    public var debug:Boolean;

    private const MARGIN:int = 3;

    private var debugBoxes:Vector.<Shape>;

    private var textField:TextField;
    private var textFieldBoundaries:Rectangle;
    private var textBoundaries:Rectangle;
    private var initX:Number;
    private var obstacles:Array;
    private var commonParent:DisplayObjectContainer;
    private var evasionStrategy:int;

    public function ObstacleTextField(tf:TextField, obstacles:Array, debug:Boolean = false) {
        textField = tf;
        setObstacles(obstacles);
        commonParent = Utils.getCommonParent(tf, obstacles);
        this.debug = debug;

        initX = tf.x;
        update();
    }

    public function setObstacles(array:Array):void {
        obstacles = Utils.removeNullElements(array);
    }

    public function update():void {
        evasionStrategy = 0;
        if (debug && (!debugBoxes || debugBoxes.length != obstacles.length + 1)) {
            reInitDebug();
            debugBoxes.push(Utils.createBox(0, 0, 100, 100, 0, 0xaa0000, 0.5));
            for (var i:int = 0; i < obstacles.length; i++) {
                debugBoxes.push(Utils.createBox(0, 0, 100, 100, 0, 0x00aa00, 0.5));
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

            intersection = textBoundaries.intersection(o.getBounds(commonParent));
            if (intersection.width) {
                obstacleBounds = o.getBounds(commonParent);
                if (obstacleBounds.x < textBoundaries.x) {
                    evasionStrategy++;
                } else {
                    evasionStrategy--;
                }
                intersections.push([intersection, obstacleBounds]);
            }
        }

        //LEFT
        if (evasionStrategy < 0) {
            for each (var array:Array in intersections) {
                if (minX > array[0].x) {
                    minX = array[0].x;
                    mostXIntersection = array[0];
                }
            }
            //RIGHT
        } else if (evasionStrategy > 0) {
            for each (var array:Array in intersections) {
                if (maxX < array[0].width) {
                    maxX = array[0].width;
                    mostXIntersection = array[0];
                }
            }
        }

        var shiftX:Number;
        if (mostXIntersection) {
            if (evasionStrategy < 0) {
                shiftX = textBoundaries.x + textBoundaries.width - mostXIntersection.x + MARGIN;
                if (!anyCollisionsAfterMove(-shiftX)) {
                    textField.x -= shiftX;
                }
            } else {
                shiftX = mostXIntersection.width + MARGIN;
                if (!anyCollisionsAfterMove(shiftX)) {
                    textField.x += shiftX;
                }
            }
        } else {
            resetShift();
        }

        if (debug) {
            updateTextBoundaries();

            var tfBounds:Rectangle = textField.getBounds(commonParent);
            Cc.logc("Obstacle", tfBounds.x, textBoundaries.x, textBoundaries.x + textBoundaries.width);

            setBoxDimentions(debugBoxes[0], textBoundaries);
            for (i = 0; i < obstacles.length; i++) {
                setBoxDimentions(debugBoxes[i + 1], DisplayObject(obstacles[i]).getBounds(commonParent));
                Cc.logc("Obstacle", debugBoxes[i + 1].x);
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
        if (!anyCollisionsAfterMove(initX - textField.x)) {
            textField.x = initX;
        }
    }

    private function anyCollisionsAfterMove(shiftX:Number):Boolean {
        var futureBoundaries:Rectangle = textBoundaries.clone();
        futureBoundaries.x += shiftX;

        for each (var i:DisplayObject in obstacles) {
            var intersection:Rectangle = futureBoundaries.intersection(i.getBounds(commonParent));
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

        if(r.width > tf.width){
            r.width = tf.width;
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
