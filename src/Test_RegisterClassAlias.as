package {
    import flash.display.Sprite;
    import flash.net.registerClassAlias;
    import flash.utils.ByteArray;

    public class Test_RegisterClassAlias extends Sprite {
        public function Test_RegisterClassAlias() {
            registerClassAlias("com.example.eg", RegisteredClass);
//            registerClassAlias("com.example2.eg", UnRegisteredClass);

            var sourceRegistered:RegisteredClass = new RegisteredClass();
            var sourceUnRegistered:UnRegisteredClass = new UnRegisteredClass();

            var ba:ByteArray = new ByteArray();
            ba.writeObject(sourceRegistered);
            ba.position = 0;
            var clone:* = ba.readObject();
            trace(clone is RegisteredClass); // true

            ba = new ByteArray();
            ba.writeObject(sourceUnRegistered);
            ba.position = 0;
            var clone:* = ba.readObject();
            trace(clone is UnRegisteredClass); // false
        }
    }
}

class RegisteredClass {}
class UnRegisteredClass {}
