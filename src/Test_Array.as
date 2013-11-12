/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 30.05.13
 * Time: 14:55
 * To change this template use File | Settings | File Templates.
 */
package {

    import flash.display.Sprite;

public class Test_Array extends Sprite{
    public function Test_Array() {
        var arr:Array = [1,2,3];
        arr.unshift(0)
        trace(arr);

        var ar1:Array = [1,2,3,4,5,6,7,8,9];
        var ar2:Array = ['a','b','c','d','e','f','g','h'];
        var ar3:Array = ['i','j','k','l'];

//        var ar1 = ar1.concat(ar2, ar3);
        ar1.concat(ar2).concat(ar3);
        trace(ar1)


        // To make a single array out of a 2 dimensional array you can use this function:
        var ar4 = [ar1, ar2, ar3];
        var ar5 = flatten(ar4);
        trace(ar4)
        trace(ar5)

        //You can also use varargs to merge multiple arrays:
        var ar6 = merge(ar1, ar2, ar3);
        trace(ar6)


        var arr1:Array = [1,2,3,4,5]
        var arr2:Array = [6,7,8,9,10]

        arr1.push.apply(this, arr2); // merge
//        arr1.push(arr2);
// arr1.push.call(this, arr2); // don't use this. see comment below

        trace(arr1) // 1,2,3,4,5,6,7,8,9,10
    }

    private function flatten(arrays:Array):Array {
        var result:Array = [];
        for(var i:int=0;i<arrays.length;i++){
            result = result.concat(arrays[i]);
        }
        return result;
    }

    private function merge(...arrays):Array {
        var result:Array = [];
        for(var i:int=0;i<arrays.length;i++){
            result = result.concat(arrays[i]);
        }
        return result;
    }
}
}
