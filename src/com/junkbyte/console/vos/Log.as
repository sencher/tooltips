/*
* 
* Copyright (c) 2008-2010 Lu Aye Oo
* 
* @author 		Lu Aye Oo
* 
* http://code.google.com/p/flash-console/
* 
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
* 
*/
package com.junkbyte.console.vos {
	import com.junkbyte.console.Console;
	import com.junkbyte.console.ConsoleConfig;
	
	import flash.utils.ByteArray;
	
	/**
	 * @private
	 */
	public class Log{
		public var line:uint;
		public var text:String;
		public var ch:String;
		public var priority:int;
		public var repeat:Boolean;
		public var html:Boolean;
		public var time:uint;
		//public var stack:String;
		
		public var timeStr:String;
		public var lineStr:String;
		public var chStr:String;
		//
		public var next:Log;
		public var prev:Log;
		private var _console:Console;
		//
		public function Log(console:Console, txt:String, cc:String, pp:int, repeating:Boolean = false, ishtml:Boolean = false){
			_console = console;
			text = txt;
			ch = cc;
			priority = pp;
			repeat = repeating;
			html = ishtml;
		}
		public function toBytes(bytes:ByteArray):void{
			var t:ByteArray = new ByteArray();
			t.writeUTFBytes(text);// because writeUTF can't accept more than 65535
			bytes.writeUnsignedInt(t.length);
			bytes.writeBytes(t);
			bytes.writeUTF(ch);
			bytes.writeInt(priority);
			bytes.writeBoolean(repeat);
		}
		public static function FromBytes(console:Console, bytes:ByteArray):Log{
			var t:String = bytes.readUTFBytes(bytes.readUnsignedInt());
			var c:String = bytes.readUTF();
			var p:int = bytes.readInt();
			var r:Boolean = bytes.readBoolean();
			return new Log(console, t, c, p, r, true);
		}
		
		public function plainText():String{
			if(text.indexOf(ConsoleConfig.STACK_HREF_TEXT) < 0) {
				return text.replace(/<.*?>/g, "").replace(/&lt;/g, "<").replace(/&gt;/g, ">");
			}else{
				var pattern:RegExp = /event:.*_(.*)'/g;
				var linkId:int = int(String(text.match(pattern)[0]).replace(pattern, "$1"));
				return text.replace(/<.*> /g,"") + "\n" + _console.refs.getRefById(linkId);
			}
		}
		public function toString():String{
			return "[trace " + priority + "] " + "["+ch+"] " + plainText();
		}
		
		public function clone():Log{
			var l:Log = new Log(_console, text, ch, priority, repeat, html);
			l.line = line;
			l.time = time;
			//l.stack = stack;
			return l;
		}
	}
}