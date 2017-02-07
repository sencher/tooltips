/**
 * Created by S.Senkov on 07.02.2017.
 */
package
{
	import fl.motion.MatrixTransformer;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	//http://www.flashandmath.com/howtos/rotation/?howtos/rotation
	public class Test_RotationPoint extends Sprite
	{
		private var purpleMat:Matrix;
		private var blueMat:Matrix;
		
		private var blueRotCenter:Point = new Point(30,30);
		
		private var purpleRotCenter:Point = new Point(450,220);
		
		private var blue:Shape = new Shape();
		
		private var purple:Shape = new Shape();
		
		private var curPurpleAng:int = 0;
		
		private var curBlueAng:int = 0;
		
		public function Test_RotationPoint()
		{
			
			this.addChild(blue);
			blue.x=140;
			blue.y=200;
			
			this.addChild(purple);
			purple.x=500;
			purple.y=190;
			
			drawShapes();
			
			purpleMat = purple.transform.matrix.clone();
			blueMat = blue.transform.matrix.clone();
			
			addEventListener(Event.ENTER_FRAME,onEnter);
		}
		
		function onEnter(e:Event):void {
			
			
			curPurpleAng=(curPurpleAng+2)%360;
			
			rotatePurple(curPurpleAng);
			
			
			curBlueAng=(curBlueAng-2)%360;
			
			rotateBlue(curBlueAng);
			
			
		}
		
		private function rotateBlue(deg:Number):void {
			
			var mat:Matrix= blueMat.clone();
			
			MatrixTransformer.rotateAroundInternalPoint(mat,blueRotCenter.x,blueRotCenter.y,deg);
			
			blue.transform.matrix=mat;
			
		}
		
		private function rotatePurple(deg:Number):void {
			
			var mat:Matrix= purpleMat.clone();
			
			MatrixTransformer.rotateAroundExternalPoint(mat,purpleRotCenter.x,purpleRotCenter.y,deg);
			
			purple.transform.matrix=mat;
			
		}
		
		function drawShapes():void {
			
			blue.graphics.lineStyle();
			
			blue.graphics.beginFill(0x000066);
			
			blue.graphics.drawRect(-60,-60,120,120);
			
			blue.graphics.endFill();
			
			//------------------
			
			blue.graphics.beginFill(0xCC0000);
			
			blue.graphics.drawCircle(blueRotCenter.x,blueRotCenter.y,3);
			
			blue.graphics.endFill();
			
			//--------------
			
			blue.graphics.lineStyle(2,0xFFFF00);
			
			blue.graphics.moveTo(-5,0);
			
			blue.graphics.lineTo(5,0);
			
			blue.graphics.moveTo(0,-5);
			
			blue.graphics.lineTo(0,5);
			
			//--------
			
			purple.graphics.lineStyle();
			
			purple.graphics.beginFill(0x660066);
			
			purple.graphics.drawRect(0,0,60,60);
			
			purple.graphics.endFill();
			
			//-----------
			
			purple.graphics.lineStyle(2,0xFFFF00);
			
			purple.graphics.moveTo(-5,0);
			
			purple.graphics.lineTo(5,0);
			
			purple.graphics.moveTo(0,-5);
			
			purple.graphics.lineTo(0,5);
			
			//----------
			
			this.graphics.lineStyle();
			
			this.graphics.beginFill(0xCC0000);
			
			this.graphics.drawCircle(purpleRotCenter.x,purpleRotCenter.y,3);
			
			this.graphics.endFill();
			
			
		}
	}
}
