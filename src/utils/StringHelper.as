package utils {
public class StringHelper {
    public function StringHelper() {
    }

    public static function is_empty(string:String):Boolean {
        return string == null || string == "";
    }

    /**
     *  Removes all whitespace characters from the beginning and end
     *  of the specified string.
     *
     *  @param str The String whose whitespace should be trimmed.
     *
     *  @return Updated String where whitespace was removed from the
     *  beginning and end.
     */
    public static function trim(str:String):String
    {
        if (str == null) return '';

        var startIndex:int = 0;
        while (isWhitespace(str.charAt(startIndex)))
            ++startIndex;

        var endIndex:int = str.length - 1;
        while (isWhitespace(str.charAt(endIndex)))
            --endIndex;

        if (endIndex >= startIndex)
            return str.slice(startIndex, endIndex + 1);
        else
            return "";
    }

    /**
     *  Removes all whitespace characters from the beginning and end
     *  of each element in an Array, where the Array is stored as a String.
     *
     *  @param value The String whose whitespace should be trimmed.
     *
     *  @param delimiter The String that delimits each Array element in the string.
     *
     *  @return Updated String where whitespace was removed from the
     *  beginning and end of each element.
     */
    public static function trimArrayElements(value:String, delimiter:String):String
    {
        if (value != "" && value != null)
        {
            var items:Array = value.split(delimiter);

            var len:int = items.length;
            for (var i:int = 0; i < len; i++)
            {
                items[i] = StringHelper.trim(items[i]);
            }

            if (len > 0)
            {
                value = items.join(delimiter);
            }
        }

        return value;
    }

    /**
     *  Returns <code>true</code> if the specified string is
     *  a single space, tab, carriage return, newline, or formfeed character.
     *
     *  @param character The String that is is being queried.
     *
     *  @return <code>true</code> if the specified string is
     *  a single space, tab, carriage return, newline, or formfeed character.
     */
    public static function isWhitespace(character:String):Boolean
    {
        switch (character)
        {
            case " ":
            case "\t":
            case "\r":
            case "\n":
            case "\f":
                return true;

            default:
                return false;
        }
    }

    /**
     *  Substitutes "{n}" tokens within the specified string
     *  with the respective arguments passed in.
     *
     *  @param str The string to make substitutions in.
     *  This string can contain special tokens of the form
     *  <code>{n}</code>, where <code>n</code> is a zero based index,
     *  that will be replaced with the additional parameters
     *  found at that index if specified.
     *
     *  @param rest Additional parameters that can be substituted
     *  in the <code>str</code> parameter at each <code>{n}</code>
     *  location, where <code>n</code> is an integer (zero based)
     *  index value into the array of values specified.
     *  If the first parameter is an array this array will be used as
     *  a parameter list.
     *  This allows reuse of this routine in other methods that want to
     *  use the ... rest signature.
     *  For example <pre>
     *     public function myTracer(str:String, ... rest):void
     *     {
     *         label.text += StringUtil.substitute(str, rest) + "\n";
     *     } </pre>
     *
     *  @return New string with all of the <code>{n}</code> tokens
     *  replaced with the respective arguments specified.
     *
     *  @example
     *
     *  var str:String = "here is some info '{0}' and {1}";
     *  trace(StringUtil.substitute(str, 15.4, true));
     *
     *  // this will output the following string:
     *  // "here is some info '15.4' and true"
     */
    public static function substitute(str:String, ... rest):String
    {
        if (str == null) return '';

        // Replace all of the parameters in the msg string.
        var len:uint = rest.length;
        var args:Array;
        if (len == 1 && rest[0] is Array)
        {
            args = rest[0] as Array;
            len = args.length;
        }
        else
        {
            args = rest;
        }

        for (var i:int = 0; i < len; i++)
        {
            if (args[i] is Array) {
                str = str.replace(new RegExp("\\{"+args[i][0]+"\\}", "g"), args[i][1]);
            } else {
                str = str.replace(new RegExp("\\{"+i+"\\}", "g"), args[i]);
            }
        }

        return str;
    }

    public static function replace_selector(str:String, selector:String, value:int):String {
        var pattern:RegExp = new RegExp("\\["+selector+":(.+?)\\]", "g");
        return str.replace(pattern, function():String {
            return arguments[1].split("|")[value];
        });
    }

    public static function concat_with_delimiter(src:String, add:String, delimiter:String = ","):String{
        if (src == null || !src.length){
            return add;
        }
        src += delimiter;
        src += add;
        return src;
    }

    public static function str_plus_int(str:String, add:int):String{
        if (str == null || !str.length){
            return add.toString();
        }
        return (int(str) + add).toString();
    }

    /**
     *  Returns String is broken into substrings
     *
     *  @param str The String which is necessary for breaking
     *  @param len Length of str lines
     *
     *  @return  new string broken into substrings
     */
    public static function break_string(str:String, len:int = 1):String {
        var new_str:String = "";
        var last_prob:int = -1;

        while(str != "") {
            last_prob = -1;
            for(var i:int = 0; i < len && i < str.length; i++) {
                if(str.charAt(i) == " ") {
                    last_prob = i;
                }
            }
            if(i != str.length) {
                new_str += str.substr(0, last_prob) + " \n";
                str = str.substr(last_prob+1, str.length);
            }
            else {
                new_str += str.substr(0, i) + " \n";
                str = str.substr(i+1, str.length);
            }
        }
        return new_str;
    }

    /**
     *  Transform the first char to lower case
     *
     *  @param str The String which is necessary for transforming
     *
     *  @return  New line with the transformed first symbol to lower case
     */
     public static function first_char_to_lower_case(str:String):String {
         return (!is_empty(str)) ? str.substr(0,1).toLowerCase() + str.substr(1) : "";
    }

    public static function time_to_string(time:int):String {
        var seconds:int = time % 60;
        time = time / 60;
        var minutes:int = time % 60;
        time = time / 60;
        var hours:int = time;

        return substitute("{0}:{1}:{2}", hours,
                (minutes < 10 ? "0" : "") + minutes,
                (seconds < 10 ? "0" : "") + seconds);
    }

    public static function do_subst_str(str:String, subst_obj:Object, text_getter:Function):String{
        for(var what:String in subst_obj){
            var to:String = text_getter( subst_obj[what] );
            if (to != null)
                str = str.replace( new RegExp("\\{"+what+"\\}", "g"), to );
        }
        return str;
    }

    public static function camelcase(xml_name:String):String{
        var new_string:String = "";
        var upcase:Boolean = true;
        var i:int = 0;
        while (i<xml_name.length){
            if(xml_name.charAt(i)=='_'){
                upcase = true;
                i++;
                continue;
            }
            if(upcase){
                new_string = new_string + xml_name.charAt(i).toUpperCase();
                upcase = false;
            }
            else{
                new_string = new_string + xml_name.charAt(i);
            }
            i++;
        }
        return new_string;
    }

}
}