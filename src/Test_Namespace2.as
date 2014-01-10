/*В следующем примере показано, как пространства имен можно использовать для разграничения одноименных методов,
выполняющих разные задачи. В данном примере три метода hello() находятся в отдельных пространствах имен,
и каждый из них при вызове возвращает разную строку.*/

package {

    import flash.display.Sprite;

    public class Test_Namespace2 extends Sprite {
        public function Test_Namespace2() {
            var vocab:MultilingualVocabulary = new MultilingualVocabulary();

            trace(vocab.hello());    // hello

            var languages:Array = vocab.getLanguages();

            for (var i:uint; i < languages.length; i++) {
                var ns:Namespace = languages[i];
                if (ns != null) {
                    trace(ns.toString() + ": " + vocab.ns::hello());
                    // hello
                    // MultilingualVocabulary:Hawaiian: aloha
                    // MultilingualVocabulary:French: bon jour
                }
            }
        }
    }
}

class MultilingualVocabulary {
    public namespace French = "French";
    public namespace Hawaiian = "Hawaiian";
    private var languages:Array;

    public function MultilingualVocabulary() {
        languages = new Array(Hawaiian, French);
    }

    public function hello():String {
        return "hello";
    }

    Hawaiian function hello():String {
        return "aloha";
    }

    French function hello():String {
        return "bon jour";
    }

    public function getLanguages():Array {
        return languages;
    }
}