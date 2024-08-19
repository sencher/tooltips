package wowp.utils.string
{
    import flash.text.TextField;

    public class StringUtils
    {
        private static var _instance:StringUtils;
        public function StringUtils()
        {
            if(_instance)
            {
                throw new Error("We cannot create a new instance. Please use StringUtils.getInstance()");
            }
        }

        public static function getInstance(): StringUtils
        {
            if(!_instance)
            {
                _instance = new StringUtils();
            }
            return _instance;
        }

        public function setTextToTextField(txtField:TextField, text:*):void{
            if(txtField)
            {
                if(text){
                    txtField.text = text.toString();
                }
                else
                {
                    txtField.text = "";
                }
            }
        }

		public function setPercentToTextField(txtField:TextField, text:*):void{
			if(txtField)
			{
				if(text == -1)
				{
					txtField.text = "";
				}
				else if(text)
				{
					// хак, scaleform неправильно преобразует Number в String. Например, 9.53 в 9.5299999999
					txtField.text = Math.round(text * 100) * 0.1 * 0.1 + "%";
					/* алгоритм на случай, если выше сделанный хак не поможет
					var text100:String = Math.round(100.0 * Number(text)).toString();
					if (text >= 1)
					{
						text100 = (text100.substr(0, text100.length - 2) + "." + text100.substr(text100.length - 2, 2)).split(".00").join("");
					}
					else
					{
						text100 = "0." + (text >= 0.1 ? "" : "0") + text100;
						if (text100.charAt(text100.length-1) == "0") text100 = text100.substr(0, text100.length-1);
					}*/
				}
				else
				{
					txtField.text = "0%";
				}
			}
		}

		public function setIntToTextField(txtField:TextField, text:*):void{
			if(txtField)
			{
				if(text)
				{
					txtField.text = int(text).toString();
				}
				else
				{
					txtField.text = "0";
				}
			}
		}

		public function setNumberToTextField(txtField:TextField, text:*):void{
			if(txtField)
			{
				if(text)
				{
					txtField.text = Number(text).toString();
				}
				else
				{
					txtField.text = "0";
				}
			}
		}

		public function setRoundNumberToTextField(txtField:TextField, text:*):void{
			if(txtField)
			{
				if(text)
				{
					txtField.text = (Math.round(Number(text))).toString();
				}
				else
				{
					txtField.text = "0";
				}
			}
		}
		
		public function setNumberWithSpacesToTextField(txtField:TextField, text:String):void
		{
			if (txtField)
			{
				if (text)
				{
					var countDigits:int = 3;
					var blocks:Array = [];
					var resText:String = "";
					var length:int = text.length - countDigits;
					
					for (var i:int = length; i >= 0; i -= countDigits)
					{
						blocks.push(text.substr(i, countDigits));
					}
					
					if ((i + countDigits) > 0)
					{
						blocks.push(text.substr(0, i + countDigits));
					}
					
					length = blocks.length - 1;
					
					for (i = length; i >= 0; --i)
					{
						resText += blocks[i] + " ";
					}
					
					txtField.text = resText;
				}
				else
				{
					txtField.text = "0";
				}
			}
		}
	}
}
