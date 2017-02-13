/**
 * Created by S.Senkov on 06.02.2017.
 */
package
{
	import com.junkbyte.console.Cc;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	import starling.utils.deg2rad;
	
	[SWF(width=1200,height=1000)]
	public class Test_CirclesElipse4 extends Sprite
	{
	private var X1:Number = 400;
	private var Y1:Number = 400;
	private var X2:Number = 700;
	private var Y2:Number = 700;
	private var RADIUS:Number = 60;
	private var RADIUS_MIN:Number = 30;
		
	private var ELLIPSE_X:Number = 500;
	private var ELLIPSE_Y:Number = 500;
	private var ELLIPSE_WIDTH:Number = 100;
	private var ELLIPSE_HEIGHT:Number = 500;
	private var ELLIPSE_ROTATION:Number = 0;
	private var ELLIPSE_DENSITY:Number = 6;
		
	private var curRotation:Number = 0;
	private var container:Sprite = new Sprite();
		
	private var tf:TextField = new TextField();
		public function Test_CirclesElipse4()
		{
//			Cc.start(this);
//			Cc.visible = true;
			tf.height = 1000;
			tf.width = 200;
			addChild(tf);
			
//			ELLIPSE_X = Math.random()*1000;
//			ELLIPSE_Y = Math.random()*1000;
//			ELLIPSE_WIDTH = Math.random()*1000;
//			ELLIPSE_HEIGHT = Math.random()*1000;
//			ELLIPSE_ROTATION = Math.random()*360;
			
//			var debug:String ="421.4574797078967 234.8647005856037 756.6431704908609 389.9144730530679 252.04937115311623";
//			var debArray:Array = debug.split(" ");
//			ELLIPSE_X = debArray[0];
//			ELLIPSE_Y = debArray[1];
//			ELLIPSE_WIDTH = debArray[2];
//			ELLIPSE_HEIGHT = debArray[3];
//			ELLIPSE_ROTATION = debArray[4];
			
			tf.appendText("\n " + ELLIPSE_X +" "+ELLIPSE_Y +" "+ELLIPSE_WIDTH +" "+ELLIPSE_HEIGHT +" "+ELLIPSE_ROTATION);
			addChild(container);
			
			
			var halfLength:Number;
			var width:Number;
			if(ELLIPSE_HEIGHT >= ELLIPSE_WIDTH){
				halfLength = ELLIPSE_HEIGHT / 2;
				width = ELLIPSE_WIDTH;
				generateCircles(ELLIPSE_X, ELLIPSE_Y - halfLength, ELLIPSE_X, ELLIPSE_Y + halfLength, width/2, ELLIPSE_ROTATION, ELLIPSE_DENSITY);
				generateBoxes(ELLIPSE_X, ELLIPSE_Y - halfLength, ELLIPSE_X, ELLIPSE_Y + halfLength, width/2, ELLIPSE_ROTATION, ELLIPSE_DENSITY);
				drawLine(ELLIPSE_X, ELLIPSE_Y - halfLength, ELLIPSE_X, ELLIPSE_Y + halfLength, ELLIPSE_ROTATION);
			}else{
				halfLength = ELLIPSE_WIDTH /2 ;
				width = ELLIPSE_HEIGHT;
				generateCircles(ELLIPSE_X - halfLength, ELLIPSE_Y, ELLIPSE_X + halfLength, ELLIPSE_Y, width/2, ELLIPSE_ROTATION, ELLIPSE_DENSITY);
				generateBoxes(ELLIPSE_X - halfLength, ELLIPSE_Y, ELLIPSE_X + halfLength, ELLIPSE_Y, width/2, ELLIPSE_ROTATION, ELLIPSE_DENSITY);
				drawLine(ELLIPSE_X - halfLength, ELLIPSE_Y, ELLIPSE_X + halfLength, ELLIPSE_Y, ELLIPSE_ROTATION);
			}
			
			drawEllipse(ELLIPSE_X, ELLIPSE_Y, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, ELLIPSE_ROTATION);
			
			stage.addEventListener(MouseEvent.CLICK, onClick);
//			stage.addEventListener(MouseEvent.MOUSE_MOVE, onClick);
			
			//trace(isPointInEllipse(point.x,point.y,0, 0, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, 0));
			
//			for (var dx:int = 345; dx < 760; dx++){
//				for (var dy:int = 440; dy < 460; dy++){
//					checkInsideAndDraw(dx,dy);
//				}
//			}
			
		}
		
		private function drawPoint(x:Number, y:Number, inside:Boolean):void{
			var pointView:Shape = new Shape();
//			pointView.graphics.lineStyle(3,0x00ff00);
			pointView.graphics.beginFill(inside ? 0x0000FF : 0xFF0000);
			pointView.graphics.drawRect(x,y,1,1);
			pointView.graphics.endFill();
			addChild(pointView);
		}
		
		private var ellipse:Shape;
		
		private function drawEllipse(x1:Number, y1:Number, w:Number, h:Number, angle:Number):void
		{
			tf.appendText("\ndrawEllipse " + arguments.toString());
			ellipse = new Shape();
			ellipse.graphics.lineStyle(2/*, 0x990000, .75*/);
//			ellipse.graphics.beginFill(0x00FF00);
			ellipse.graphics.drawEllipse(-w/2, -h/2, w, h);
			ellipse.x = x1;
			ellipse.y = y1;
			ellipse.rotation = angle;
			/*container.*/addChild(ellipse);
//			addEventListener(MouseEvent.CLICK, onClick)
		}
		
		private function onClick(event:MouseEvent):void
		{
//			trace(event.stageX, event.stageY);
//			var inside:Boolean =isPointInEllipse(event.stageX, event.stageY,ELLIPSE_X, ELLIPSE_Y, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, ELLIPSE_ROTATION );
//			trace(inside)
//			drawPoint(event.stageX, event.stageY, inside);
			
			checkInsideAndDraw(event.stageX, event.stageY);
			
//			line.rotation +=10;
//			ellipse.rotation += 10;
//			container.rotation += 10;
			
//			curRotation += 10;
//			removeChild(ellipse);
//			//ellipse.rotation += 7;
//			drawEllipse(ellipse.x, ellipse.y,  ELLIPSE_WIDTH, ELLIPSE_HEIGHT, curRotation)
		}
		
		private function checkInsideAndDraw(x:Number, y:Number):void{
			var inside:Boolean = isPointInEllipse(x, y);
			//trace(x,y,inside);
			drawPoint(x,y,inside);
		}
		
		private var line:Shape = new Shape();
		
		private function drawLine(x1:Number, y1:Number, x2:Number, y2:Number, angle:Number):void
		{
			
			line.graphics.lineStyle(2, 0x990000, .75);
			line.graphics.beginFill(0x00FF00);
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			var centerX:Number = (x1 + x2)/2;
			var centerY:Number = (y1 + y2)/2;
			line.graphics.moveTo(-dx/2, -dy/2);
			line.graphics.lineTo(dx/2, dy/2);
			line.x = centerX;
			line.y = centerY;
			line.rotation = angle;
			addChild(line);
		}
	
		private function drawCircle(x:Number,y:Number,r:Number):void
		{
			if(r < 1) return;
			
			var circle:Shape = new Shape();
			circle.graphics.beginFill(0xFF794B);
			circle.graphics.drawCircle(x, y, r);
			circle.graphics.endFill();
			container.addChild(circle);
		}
		
		private function getLength(x1:Number, y1:Number, x2:Number, y2:Number):Number{
			return Math.sqrt(Math.pow(x2-x1,2) + Math.pow(y2-y1,2));
		}
		
		private function generateCircles(x1:Number, y1:Number, x2:Number, y2:Number, radius:Number, angle:Number, density:int):void {
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			var centerX:Number = (x1 + x2)/2;
			var centerY:Number = (y1 + y2)/2;
			
			container.x = centerX;
			container.y = centerY;
			container.rotation = angle;
			
			var length:Number = getLength(x1,y1,x2,y2);
			var steps:Number = density+1;
			var curX:Number = x1;
			var curY:Number = y1;
			var curR:Number;
			var lenghtFromCenter:Number;
			
			for(var i:Number = 1; i<steps; i++){
				if (x1==x2){
					curY = y1 + i * dy / steps;
					curX = (y2 * x1 - y1 * x2 - (x1 - x2) * curY) / dy;
				}else{
					curX = x1 + i * dx / steps;
					curY = (x2 * y1 - x1 * y2 - (y1 - y2) * curX) / dx;
				}

				
				lenghtFromCenter = getLength(curX,curY,centerX,centerY);
				curR = Math.sqrt(1-Math.pow(lenghtFromCenter,2)/Math.pow(length/2,2))*radius;
				
				if (curR>(length/2-lenghtFromCenter))
					curR=(length/2-lenghtFromCenter);
					
				drawCircle(curX-centerX,curY-centerY,curR);
			}
		}
		
		private function isPointInEllipse(xp:Number, yp:Number):Boolean{
			
//			var x = ELLIPSE_X, ELLIPSE_Y, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, ELLIPSE_ROTATION
			
			//var aaa = Math.pow(Math.cos(angle)*(xp-x) + Math.sin(angle)*(yp-y),2)/Math.pow(h,2) + Math.pow(Math.sin(angle)*(xp-x) - Math.cos(angle)*(yp-y),2)/Math.pow(w,2);
//			var bbb = Math.pow(Math.cos(angle)*(xp-x) + Math.sin(deg2rad(angle))*(yp-y),2)/Math.pow(w/2,2) + Math.pow(Math.sin(angle)*(xp-x) - Math.cos(angle)*(yp-y),2)/Math.pow(h/2,2);
			
			var cosA:Number = Math.cos(deg2rad(ELLIPSE_ROTATION));
			var sinA:Number = Math.sin(deg2rad(ELLIPSE_ROTATION));
			var dd:Number = ELLIPSE_WIDTH/2*ELLIPSE_WIDTH/2;
			var DD:Number = ELLIPSE_HEIGHT/2*ELLIPSE_HEIGHT/2;
			
			var a:Number = Math.pow(cosA*(xp-ELLIPSE_X)+sinA*(yp-ELLIPSE_Y),2);
			var b:Number = Math.pow(sinA*(xp-ELLIPSE_X)-cosA*(yp-ELLIPSE_Y),2);
			var ellipse:Number = (a/dd)+(b/DD);
			
//			trace(aaa<= 1,bbb<= 1,ellipse<= 1)
			if (ellipse <= 1)
				return true;
			else
				return false;
		}
		
		private var boxSize:Number = 50;
		
		private function generateBoxes(x:Number, y:Number, w:Number, h:Number, radius:Number, angle:Number, density:int):void
		{
//			drawBox(10,10,50,50,45)
			var r:flash.geom.Rectangle = new flash.geom.Rectangle(0,0,boxSize,boxSize);
			checkInEllipse(r);
			drawBox(0,0,50,50,0);
			drawBox(0,0,50,50,45);
		}
		
		private function checkInEllipse(r:Rectangle):Boolean
		{
			trace(isPointInEllipse(r.x,r.y));
			return false;
		}
		
		private function drawBox(x:Number, y:Number, w:Number, h:Number, angle:Number):void
		{
			var box:Shape = new Shape();
			box.graphics.lineStyle(1, 0x990000, .75);
			box.graphics.beginFill(0x00FF00);
			box.graphics.drawRect(x-w/2,y-h/2,w,h);
			box.rotation = angle;
			container.addChild(box);
		}
	}
}
