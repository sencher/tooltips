package
{
import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Point;
import flash.filters.*;

public class GreyscaleDemo extends Sprite
{
    public function GreyscaleDemo()
    {
        //https://stackoverflow.com/questions/5861133/coloring-grayscale-image-as3
        var bmd:BitmapData = new GradientBMD(720,480);

        var matrix:Array = new Array();
        matrix = matrix.concat([1,0,0,0,255]);
        matrix = matrix.concat([0,1,0,0,0]);
        matrix = matrix.concat([0,0,1,0,0]);
        matrix = matrix.concat([0,0,0,1,0]);

        var colorFilter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
        bmd.applyFilter(bmd, bmd.rect, new Point(0,0), colorFilter);

        var bitmap:Bitmap = new Bitmap(bmd);
        this.addChild(bitmap);
    }
}
}