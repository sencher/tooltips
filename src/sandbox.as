package {
    import com.junkbyte.console.Cc;
    import flash.display.Sprite;
    import flash.events.Event;

    [SWF(width="1000", height="800", frameRate="60", backgroundColor="#000000")]
    public class sandbox extends Sprite {
        public function sandbox() {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(e:Event = null):void {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            
            // Initialize Console
            Cc.start(this);
            Cc.config.commandLineAllowed = true;
            Cc.width = 1000;
            Cc.height = 500;
            Cc.config.alwaysOnTop = true;
            
            for (var i:int = 0; i < 10000; i++) {
                if (i % 1000 == 0) {
                    var obj:Object = {
                        id: i,
                        level1: [
                            {
                                level2: [
                                    { name: "Leaf " + i + "-1", values: [i, i+1, i+2] },
                                    { name: "Leaf " + i + "-2", values: [i+3, i+4, i+5] }
                                ],
                                meta: "some meta"
                            },
                            "Level 1 string"
                        ],
                        info: {
                            timestamp: new Date().getTime(),
                            channel: "CH" + (i % 10)
                        }
                    };
                    Cc.ch("!Objects", obj);
                } else {
                    Cc.ch("CH" + (i % 10), "Line " + i + " some random text to fill up the console and test the performance of the new optimizations.");
                }
            }
            
            runTest();
            testStacks();
        }

        private function testStacks():void {
            callPathA("initial");
            recursivePath(5);
        }

        private function recursivePath(depth:int):void {
            if (depth > 0) {
                recursivePath(depth - 1);
            } else {
                Cc.greenw("Recursive stack trace test");
            }
        }

        private function callPathA(val:String):void {
            callPathB(val + " > A");
        }

        private function callPathB(val:String):void {
            var anonymous:Function = function(v:String):void {
                callPathC(v + " > anonymous");
            };
            anonymous(val + " > B");
        }

        private function callPathC(val:String):void {
            Cc.greenw("Stack trace test: " + val);
        }

        private function runTest():void {
            // Test Case 1: flashTrace = true
            Cc.config.flashTrace = true;
            trace(">>> START TEST: flashTrace = true");
            
            Cc.green("This is green line");
            Cc.green("asd < 5");
            Cc.green("asd > 5");
            Cc.greenw("asd < 5 with stack");
            Cc.greenw("asd > 5 with stack");
            Cc.greenj("json with <", {a: "<"});
            Cc.greenj("json with >", {a: ">"});
            Cc.greenc("TEST", "This is greenc (channel TEST)");
            Cc.greenw("This is greenw (with stack)");
            Cc.greenj("This is greenj", {id: 1, name: "test"});
            Cc.greencw("TEST", "This is greencw (channel + stack)");
            Cc.greencj("TEST", "This is greencj (channel + json)", {foo: "bar"});
            Cc.greenwj("This is greenwj (stack + json)", [1, 2, 3]);
            Cc.greencwj("TEST", "This is greencwj (all)", {all: true});
            
            trace("<<< END TEST: flashTrace = true\n");

            // Test Case 2: flashTrace = false
            Cc.config.flashTrace = false;
            trace(">>> START TEST: flashTrace = false (Expect NO Cc traces below)");
            
            Cc.green("SILENT green");
            Cc.greenc("SILENT", "SILENT greenc");
            Cc.greenw("SILENT greenw");
            Cc.greenj("SILENT greenj", {silent: true});
            Cc.greencw("SILENT", "SILENT greencw");
            Cc.greencj("SILENT", "SILENT greencj", {silent: true});
            Cc.greenwj("SILENT greenwj", {silent: true});
            Cc.greencwj("SILENT", "SILENT greencwj", {silent: true});
            
            trace("<<< END TEST: flashTrace = false");
        }
    }
}
