package {
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	import utils.Utils;
	
	public class Test_ColorARGB extends Sprite {
		private const RED:uint = 0xFFFF00;
		private const GREEN:uint = 0x00FF00;
		private const BLUE:uint = 0x0000FF;
		
		private const RED_A:Number = 0x88FF0000;
		private const GREEN_A:Number = 0x8800FF00;
		private const BLUE_A:Number = 0x880000FF;
		
		private var box:Box;
		private var box2:Box;
		private var box3:Box;
		private var box4:Box;
		public function Test_ColorARGB() {
			box = new Box(0,0);
			box2 = new Box(100,0);
			box3 = new Box(200,0);
			box4 = new Box(300,0);
			addChild(box);
			addChild(box2);
			addChild(box3);
			addChild(box4);
			box.addEventListener(MouseEvent.CLICK, onClick);
			box2.addEventListener(MouseEvent.CLICK, onClick);
			box3.addEventListener(MouseEvent.CLICK, onClick);
			box4.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(event:MouseEvent):void {
			//trace(event.ctrlKey, event.shiftKey, event.altKey);
			var ctrl = event.ctrlKey;
			var shift = event.shiftKey;
			var alt = event.altKey;
			if(alt){
				if(ctrl){
					if(shift){
						trace("1");
					}else{
						trace("2");
					}
				}else {
					if(shift){
						trace("3");
					}else{
						trace("4");
					}
				}
			}else{
				if(ctrl){
					if(shift){
						trace("5");
					}else{
						trace("6");
					}
				}else {
					if(shift){
						trace("7");
						Box(event.currentTarget).changeShapeColor(RED, 1);
					}else{
						trace("8");
						Box(event.currentTarget).changeShapeColor2(BLUE_A);
					}
				}
			}
			//Box(event.currentTarget).changeShapeColor2(BLUE_A);
		}
		
//		private function onClick(event:MouseEvent):void {
//
//			Box(event.currentTarget).changeShapeColor(RED, 1);
//		}
		
		private function returnARGB(rgb:Number, newAlpha:Number):uint{
			//newAlpha has to be in the 0 to 255 range
			var argb:uint = 0;
			argb += (newAlpha<<24);
			argb += (rgb);
			return argb;
		}
	}
}

import flash.display.Shape;
import flash.display.Sprite;
import flash.geom.ColorTransform;

import utils.Utils;

class Box extends Sprite{
	private var shape:Shape;
	public function Box(xx:int, yy:int) {
		shape = Utils.createBox(xx, yy);
		addChild(shape);
	}
	
	internal function changeShapeColor(color:Number, alphaMultiplier:Number = 1):void {
		var trans:ColorTransform = shape.transform.colorTransform;
		trace(trans.color);
		trans.color = color;
		trace(trans.color);
		trans.alphaMultiplier = alphaMultiplier;
		trace(trans.color);
		shape.transform.colorTransform = trans;
	}
	
	internal function changeShapeColor2(colorWithAlpha:Number):void {
		var a:Number = colorWithAlpha >>> 24;
		var r:Number = (colorWithAlpha ^ (a << 24) ) >>> 16;
		var g:Number = ((colorWithAlpha ^ (a << 24) ) ^ (r << 16)) >>> 8;
		var b:Number = ((colorWithAlpha ^ (a << 24) ) ^ (r << 16)) ^ (g << 8);
		
		
//		var trans:ColorTransform = new ColorTransform(0,0,1,1,0,0,255,0);//blue * 1 alpha
		var trans:ColorTransform = new ColorTransform(0,0,0,a/255,r,g,b,0);
		trace(trans.color);
		//trans.color = colorWithAlpha;
//		trans.alphaMultiplier = 1;
//		trans.alphaOffset = 255;
		shape.transform.colorTransform = trans;
	}
}