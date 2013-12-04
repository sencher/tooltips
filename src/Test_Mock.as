package {
    import flash.display.Sprite;
    import flash.utils.describeType;
    import flash.utils.getDefinitionByName;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getQualifiedSuperclassName;

    public class Test_Mock extends Sprite{
        public function Test_Mock() {
            var o:Object = {a:1, b:new Sprite()};
//            var o:Object = {b:[object Sprite],a:1};
            trace(generateMock(o))
        }

        public function generateMock(o:Object):String
        {
            var result:String = "{";
            var i:*;
            for (i in o){
                biography(i)
                biography(o[i])
                if(getQualifiedClassName(o[i]) == "Object")
                {
                    trace("777")
                }else{
                    result += i + ":" + o[i] + ",";
                }
            }
            return result.slice(0,result.length-1) + "};";
        }

        private function biography(o:*):void
        {
            trace(
                "\r\n***** " + o,
                "\ngetQualifiedClassName "+ getQualifiedClassName(o),
                "\ngetQualifiedSuperclassName "+ getQualifiedSuperclassName(o),
//                "\ngetDefinitionByName "+ getDefinitionByName(o),
                "\ndescribeType "+ describeType(o)
            )
        }
    }
}
