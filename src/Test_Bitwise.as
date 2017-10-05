package {
	import flash.display.Sprite;
	
	public class Test_Bitwise extends Sprite {
		//http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/operators.html#bitwise_AND
		public function Test_Bitwise() {
			//The following example performs a bitwise AND of 13 (binary 1101) and 11 (binary 1011) by comparing the bit representations of the numbers.
			// The resulting integer is composed of a sequence of bits, each of which is set to 1 only if the bits of both operands at the same position are 1.
//			var insert:Number = 13;
//			var update:Number = 11;
//			traceIntAndBin(insert & update); // 9 (or 1001 binary)
			
			//some magic here
//			trace(0xFFFFFFFF); // 4294967295
//			trace(0xFFFFFFFF & 0xFFFFFFFF); // -1
//			trace(0xFFFFFFFF & -1); // -1
//			trace(4294967295 & -1); // -1
//			trace(4294967295 & 4294967295); // -1
			
//			var x:Number = 15;
//			var y:Number = 9;
//			traceIntAndBin(x &= y); // 9
			
//			// 15 decimal = 1111 binary
//			var a:Number = 15;
//			// 9 decimal = 1001 binary
//			var b:Number = 9;
//			// 1111 | 1001 = 1111
//			traceDecAndBin(a | b); // returns 15 decimal (1111 binary)
			
//			// 15 decimal = 1111 binary
//			// 9 decimal = 1001 binary
//			var a:Number = 15 ^ 9;
//			// 1111 ^ 1001 = 0110
//			// returns 6 decimal (0110 binary)
//			traceDecAndBin(a);
			
			
//			var num1:uint = 0xFF;
//			var num2:uint = uint(num1 << 24); // uint() prevents runtime error
//			trace(num2);
			
			
//			var a = 1 << 10;
//			var b = 7 << 8;
//			traceDecAndBin(a);// 1024
//			traceDecAndBin(b);// 1792
//
//			var c:Number = 65535;
//			var d:Number = c >> 8;
//			traceDecAndBin(c);
//			traceDecAndBin(d);// 255
//
//			var a:Number = -1 >>> 1;
//			traceDecAndBin(a); // 2147483647
//			var a2:Number = -1 >> 1;
//			traceDecAndBin(a2); // 2147483647

//			var x:Number = 4;
//			// Shift all bits one slot to the left.
//			x <<= 1;
//			// 4 decimal = 0100 binary
//			// 8 decimal = 1000 binary
//			trace(x); // 8
//
//			trace(decToBin(7));
//			trace(binToDec(111));
//
//			var a:uint = 0x7777;
//			var b:uint = ~0x7777;
//			trace(decToBin(a));
//			trace(decToBin(b));
			trace(int.MAX_VALUE);
			trace(uint.MAX_VALUE);
			trace(Number.MAX_VALUE);
			trace(int.MAX_VALUE >= Number.MAX_VALUE);
			trace(int.MAX_VALUE >= uint.MAX_VALUE);
			trace(uint.MAX_VALUE >= Number.MAX_VALUE);
			
			trace("Parsing")
			//var colorWithAlpha:Number = 0xfedcba9876543210;//cuts to ...6543000
			var colorWithAlpha:Number = 0xfedcba98765;
			trace(colorWithAlpha >= Number.MAX_VALUE)
			var a:Number = colorWithAlpha >>> 24;
			var r:Number = (colorWithAlpha ^ (a << 24) ) >>> 16;
			var g:Number = ((colorWithAlpha ^ (a << 24) ) ^ (r << 16)) >>> 8;
			var b:Number = ((colorWithAlpha ^ (a << 24) ) ^ (r << 16)) ^ (g << 8);
			traceDecHexBin(colorWithAlpha);
			traceDecHexBin(a);
			traceDecHexBin(r);
			traceDecHexBin(g);
			traceDecHexBin(b);
			
			var decimal:int = 163;
			trace("decimal: " + decimal);
			var hex:String = decToHex(decimal, 4);
			trace("hex: " + hex);
		}
		
		private function traceDecAndBin(value:*):void {
			trace(value, decToBin(value));
		}
		
		private function traceDecHexBin(decimal:*):void {
			trace(decimal, decToHex(decimal), decToBin(decimal));
		}
		
		private function decToBin(decimal:*):String {
			return uint(decimal).toString(2);
		}
		
		private function binToDec(binary:*):uint {
			return parseInt(String(binary), 2);
		}
		
		function decToHex(decimal:*, padding:int = 2):String {
			var hex:String = Number(decimal).toString(16);
			while (hex.length < padding)
			{
				hex = "0" + hex;
			}
			return hex.toUpperCase();
		}
	}
}
