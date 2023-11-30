package utils.wg.string {

public function nbsp(value:int = 1):String {
    var result:String = "";
    for (var i:int = 0; i < value; i++) {
        result += "&nbsp;"
    }
    return result;
}

}
