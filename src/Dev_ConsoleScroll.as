package {

import com.junkbyte.console.Cc;

public class Dev_ConsoleScroll extends BaseTest {
    public function Dev_ConsoleScroll() {
        for(var i:int = 0;i<10000;i++){
            Cc.green2cw(this, i);
        }
        showConsole();
    }
}
}
