package folder {
    [RemoteClass] /*this will help cloning the item and retaining class information*/
    public class CustomClassVO{

        private var _variableName:String = '';

        public var variableValue:Object;

        public var array:Array;

        public function CustomClassVO(pVariableName:String = '', pVariableValue:Object = null, pArray:Array = null){
            _variableName = pVariableName;
            variableValue = pVariableValue;
            array = pArray;
        }

        public function get variableName():String {
            return _variableName;
        }

        public function set variableName(value:String):void {
            _variableName = value;
        }
    }
}
