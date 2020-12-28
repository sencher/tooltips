package {
import flash.display.Sprite;

public class Test_VectorAlgebra extends Sprite {
    public function Test_VectorAlgebra() {
        var v:Vector3D = new Vector3D(8, 9, 10, 5, 5, 5);
        trace(v.length());
        trace(v);
        trace(v.findPartVector(v.length() * 0.5));

    }
}
}

class Vector3D {
    public var xEnd:Number;
    public var yEnd:Number;
    public var zEnd:Number;
    public var xStart:Number;
    public var yStart:Number;
    public var zStart:Number;

    public function Vector3D(xEnd:Number = 0, yEnd:Number = 0, zEnd:Number = 0, xStart:Number = 0, yStart:Number = 0, zStart:Number = 0) {
        this.xEnd = xEnd;
        this.yEnd = yEnd;
        this.zEnd = zEnd;
        this.xStart = xStart;
        this.yStart = yStart;
        this.zStart = zStart;
    }

    public function length():Number {
        var x = Math.pow(xEnd - xStart, 2);
        var y = Math.pow(yEnd - yStart, 2);
        var z = Math.pow(zEnd - zStart, 2);

        return Math.sqrt(Math.pow(xEnd - xStart, 2) + Math.pow(yEnd - yStart, 2) + Math.pow(zEnd - zStart, 2));
    }

    public function dX():Number {
        return xEnd - xStart;
    }

    public function dY():Number {
        return yEnd - yStart;
    }

    public function dZ():Number {
        return zEnd - zStart;
    }

    public function findPartVector(partLength:Number):Vector3D {
        var partLengthPercents:Number = partLength / length();
        return new Vector3D(
                xStart + dX() * partLengthPercents,
                yStart + dY() * partLengthPercents,
                zStart + dZ() * partLengthPercents,
                xStart,
                yStart,
                zStart
        );
    }


    public function toString():String {
        return "(" + xStart + ", " + yStart + ", " + zStart + "), (" + xEnd + ", " + yEnd + ", " + zEnd + ")";
    }
}
