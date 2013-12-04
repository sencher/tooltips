/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 30.05.13
 * Time: 17:38
 * To change this template use File | Settings | File Templates.
 */
package {
import alts.AltButtonParams;

    import flash.display.MovieClip;

    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.utils.getQualifiedClassName;

    import utils.VectorHelper;

    public class Test_Vector extends Sprite{
    internal var i:AltButtonParams;
    public function Test_Vector() {
        var v1:Vector.<AltButtonParams> = new Vector.<AltButtonParams>();
        var v2:Vector.<AltButtonParams> = new Vector.<AltButtonParams>();

        var p1:AltButtonParams = new AltButtonParams();
        p1.type = AltButtonParams.BLUE;

        var p2:AltButtonParams = new AltButtonParams();
        p2.type = AltButtonParams.BLUE_WITH_ICON;

        var p3:AltButtonParams = new AltButtonParams();
        p3.type = AltButtonParams.GREEN;

        var p4:AltButtonParams = new AltButtonParams();
        p4.type = AltButtonParams.GREEN_WITH_ICON;

        var p5:AltButtonParams = new AltButtonParams();
        p5.type = AltButtonParams.ORANGE_WITH_ICON;

        v1.push(p1, p2, p3);

        traceVectorNames(v1);



        v2.push(p1, p3)
        for each (i in v1.reverse())
        {
            v2.splice(1,0,i);
        }
        traceVectorNames(v2);

        //or, more elegantly, this, if you cannot change aa

        var v3 = new Vector.<AltButtonParams>();
        var v4 = new Vector.<AltButtonParams>();
        v3.push(p1, p2, p3);
        v4.push(p3, p1, p2);
        var insertingIndex : int = 2;
        for each ( var i in v3 )
        {
            v4.splice( insertingIndex, 0, i );
            insertingIndex++;
        }
        traceVectorNames(v4);

        v1.push(p4, p5);
        var s1 = getQualifiedClassName(v1)
        var s2 = getQualifiedClassName(v2)
        trace(s1);
        trace(s2);
        trace(getQualifiedClassName(v1) == getQualifiedClassName(v2))
//        v4.to
        VectorHelper.merge(v4, v1, true);
//        v4 = v4.concat(v1);
        traceVectorNames(v4);

        var diffVec:Vector.<*> = new Vector.<*>();
        diffVec.push(new MovieClip(), new TextField());
        VectorHelper.merge(v2,diffVec);
        traceVectorNames(v2)
        VectorHelper.substract(v2,v1);
        traceVectorNames(v2);
    }

    private function traceVectorNames(v:*):void
    {
        trace("******************")
        for each(i in v)
        {
            trace(i.type);
        }
    }
}
}
