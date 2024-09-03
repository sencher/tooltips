package {

public class Test_ConstructorsQueue extends BaseTest {
    private var child:Child1 = new Child1();
    public function Test_ConstructorsQueue() {
        trace("Main.cons");
        //super();
        trace("Main.cons - part2");
        child.interesting = true;
    }
}
}

import flash.display.Sprite;

class Child1 extends Sprite{
    internal var interesting:Boolean;
    private var child:SubClass2 = new SubClass2();
    public function Child1():void{
        super();
        trace("Child1.cons", interesting);
    }
}

class Child2 extends Sprite{
    
    protected var interesting:Boolean;
    
    public function Child2():void{
        //super();
        trace("Child2.cons", interesting);
        //interesting = true;
    }
}

class SubClass1 extends Child2{
    public function SubClass1():void{
        //super();
        trace("SubClass1.cons", interesting);
        //super();
        trace("SubClass1.cons - part2", interesting);
    }
}

class SubClass2 extends SubClass1{
    private var child:SubClassChild = new SubClassChild();
    public function SubClass2():void{
        trace("SubClass2.cons", interesting);
//        super();
        trace("SubClass2.cons - part2", interesting);
    }
}

class SubClassChild extends Sprite{
    public function SubClassChild():void{
        trace("SubClassChild.cons");
        //super();
        trace("SubClassChild.cons - part2");
    }
}