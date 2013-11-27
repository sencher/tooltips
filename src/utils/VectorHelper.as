/**
 * Created with IntelliJ IDEA.
 * User: La
 * Date: 10.04.13
 * Time: 11:29
 * To change this template use File | Settings | File Templates.
 */
package utils {
    import avmplus.getQualifiedClassName;

    public class VectorHelper {

    public static function removeElement(v:*, e:*):void{
        if(!(v && e))
            return;

        var index:int = v.indexOf(e);
        if (index >= 0) {
            v.splice(index, 1);
        }
    }

    public static function pushIfNotPresent(v:*, e:*):Boolean {
        if(v && e && v.indexOf(e) == -1) {
            v.push(e);
            return true;
        }
        return false;
    }

    public static function merge(main:*, second:*, excludeDuplicates:Boolean = false):void {
        if(getQualifiedClassName(main) != getQualifiedClassName(second))
            return;

        var i:Object;
        for each(i in second) {
            if (excludeDuplicates) {
                pushIfNotPresent(main, i);
            } else {
                main.push(i);
            }
        }
    }

        public static function substract(main:*, second:*):void {
            if(getQualifiedClassName(main) != getQualifiedClassName(second))
                return;

            var i:Object;
            var index:int;
            for each(i in second) {
                index = main.indexOf(i);
                if(index > -1)
                    main.splice(index, 1);
            }
        }
}
}
