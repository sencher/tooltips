package ConsoleObjectWatch {
public class Human {
    public static const MALE:String = "male";
    public static const FEMALE:String = "female";

    public var name:String;
    private var gender:String;
    private var age:int;

    public function Human(name:String, gender:String, age:int) {
        this.name = name;
        this.gender = gender;
        this.age = age;
    }

    public function toString():String {
        return name + " human " + gender + " age: " + age;
    }
}
}
