package {

import flash.system.System;

public class Tes_Clipboard extends BaseTest {
    public function Tes_Clipboard() {
        System.setClipboard("This will be placed in the clipboard");
        log("inited")
    }
}
}
