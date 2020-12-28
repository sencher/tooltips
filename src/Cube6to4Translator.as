package {
//[SWF(width=800, height=300, backgroundColor=0x888888)]
public class Cube6to4Translator extends Cube4Fixer {

    public function Cube6to4Translator() {
        super ();
    }

    override protected function fillTranslate():void {
        translateDict["2-3f"] = "f";
        translateDict["2-3u"] = "u";
        translateDict["2-3r"] = "r";
        translateDict["2-3d"] = "d";
        translateDict["2-3l"] = "l";
        translateDict["2-3b"] = "b";

        translateDict["3f"] = "Fw";
        translateDict["3u"] = "Uw";
        translateDict["3r"] = "Rw";
        translateDict["3d"] = "Dw";
        translateDict["3l"] = "Lw";
        translateDict["3b"] = "Bw";

        translateDict["M"] = "m";
        translateDict["E"] = "e";
        translateDict["S"] = "s";
    }
}
}
