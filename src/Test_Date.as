package {
    import flash.display.Sprite;

    public class Test_Date extends Sprite{
        public function Test_Date() {
            var my_date:Date = new Date();
            var expire_date:Date = new Date(2013,10,16);
            trace(expire_date.time - my_date.time);
            trace(my_date);
            trace(expire_date);
        }
    }
}
