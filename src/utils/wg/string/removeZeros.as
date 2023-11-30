package utils.wg.string {

public function removeZeros(value:String) {
    return value.replace(/\.0+$/g, "");
}
}
