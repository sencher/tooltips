package ConsoleObjectWatch {
public class World {
    private var _humans:Vector.<Human> = new Vector.<Human>();
    public function World() {
    }

    public function addHuman(human:Human):void {
        _humans.push(human);
    }

    public function get humans():Vector.<Human> {
        return _humans;
    }

    public function set humans(value:Vector.<Human>):void {
        _humans = value;
    }
}
}
