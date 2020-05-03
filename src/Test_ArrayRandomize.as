package {
import flash.display.Sprite;

public class Test_ArrayRandomize extends Sprite {
    public function Test_ArrayRandomize() {
        var arr:Array = [];
        for (var i:int = 0; i < 10; i++) {
            arr.push(i);
        }
        arr.sort(randomize);
        trace(arr);

        var vegetables:Array = new Array("spinach",
                "green pepper",
                "Cilantro",
                "Onion",
                "Avocado");

        vegetables.sort();
        trace(vegetables); // Avocado,Cilantro,Onion,green pepper,spinach
        vegetables.sort(Array.CASEINSENSITIVE);
        trace(vegetables); // Avocado,Cilantro,green pepper,Onion,spinach

        var users:Array = new Array();
        users.push(new User("Bob", 3));
        users.push(new User("barb", 35));
        users.push(new User("abcd", 3));
        users.push(new User("catchy", 4));

        trace(users); // Bob:3,barb:35,abcd:3,catchy:4

        users.sortOn("name");
        trace(users); // Bob:3,abcd:3,barb:35,catchy:4

        users.sortOn("name", Array.CASEINSENSITIVE);
        trace(users); // abcd:3,barb:35,Bob:3,catchy:4

        users.sortOn("name", Array.CASEINSENSITIVE | Array.DESCENDING);
        trace(users); // catchy:4,Bob:3,barb:35,abcd:3

        users.sortOn("age");
        trace(users); // abcd:3,Bob:3,barb:35,catchy:4

        users.sortOn("age", Array.NUMERIC);
        trace(users); // Bob:3,abcd:3,catchy:4,barb:35

        users.sortOn("age", Array.DESCENDING | Array.NUMERIC);
        trace(users); // barb:35,catchy:4,Bob:3,abcd:3

        var indices:Array = users.sortOn("age", Array.NUMERIC | Array.RETURNINDEXEDARRAY);
        trace(indices);
        
        var index:uint;
        for (i = 0; i < indices.length; i++) {
            index = indices[i];
            trace(users[index].name, ": " + users[index].age);
        }
        // Results:
        // Bob : 3
        // abcd : 3
        // catchy : 4
        // barb : 35
    }

    private function randomize(a:*, b:*):int {
        return (Math.random() < .5) ? 1 : -1;
    }


}
}

class User {
    public var name:String;
    public var age:Number;

    public function User(name:String, age:uint) {
        this.name = name;
        this.age = age;
    }

    public function toString():String {
        return this.name + ":" + this.age;
    }
}