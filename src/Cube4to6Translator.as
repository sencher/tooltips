package {
[SWF(width=800, height=300, backgroundColor=0x888888)]
public class Cube4to6Translator extends Cube4Fixer {

    public function Cube4to6Translator() {
        super ();
    }

    override protected function fillTranslate():void {
        translateDict["f"] = "2-3f";
        translateDict["u"] = "2-3u";
        translateDict["r"] = "2-3r";
        translateDict["d"] = "2-3d";
        translateDict["l"] = "2-3l";
        translateDict["b"] = "2-3b";

        translateDict["Fw"] = "3f";
        translateDict["Uw"] = "3u";
        translateDict["Rw"] = "3r";
        translateDict["Dw"] = "3d";
        translateDict["Lw"] = "3l";
        translateDict["Bw"] = "3b";

        translateDict["M"] = "m";
        translateDict["E"] = "e";
        translateDict["S"] = "s";
    }
}
}
