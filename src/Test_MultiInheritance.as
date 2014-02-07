package {
    import flash.display.Sprite;

    import inheritance.IFirst;
    import inheritance.ISecond;

    import mx.collections.errors.CursorError;

    public class Test_MultiInheritance extends Sprite implements IFirst, ISecond{
        public function Test_MultiInheritance() {
            play();
            pause();
            stop();
        }

        public function play():void {
            trace("play");
        }

        public function pause():void {
            trace("pause");
        }

        public function stop():void {
            trace("stop");
            try
            {
                throw new Error();
            }
            catch (exception:CursorError) {
                trace(exception);
            }
            catch (exception:Error )
            {
                trace(exception.getStackTrace());
            }
             finally
            {
                trace("finally");
            }
        }
    }
}
