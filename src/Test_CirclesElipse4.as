/**
 * Created by S.Senkov on 06.02.2017.
 */
package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	import starling.utils.deg2rad;

	//Starling 251
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
	private var ELLIPSE_WIDTH:Number = 300;
	private var ELLIPSE_HEIGHT:Number = 500;
	private var ELLIPSE_ROTATION:Number = 45;
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
//				generateBoxes(ELLIPSE_X, ELLIPSE_Y - halfLength, ELLIPSE_X, ELLIPSE_Y + halfLength, width/2, ELLIPSE_ROTATION, ELLIPSE_DENSITY);
				drawLine(ELLIPSE_X, ELLIPSE_Y - halfLength, ELLIPSE_X, ELLIPSE_Y + halfLength, ELLIPSE_ROTATION);
			}else{
				halfLength = ELLIPSE_WIDTH /2 ;
				width = ELLIPSE_HEIGHT;
				generateCircles(ELLIPSE_X - halfLength, ELLIPSE_Y, ELLIPSE_X + halfLength, ELLIPSE_Y, width/2, ELLIPSE_ROTATION, ELLIPSE_DENSITY);
//				generateBoxes(ELLIPSE_X - halfLength, ELLIPSE_Y, ELLIPSE_X + halfLength, ELLIPSE_Y, width/2, ELLIPSE_ROTATION, ELLIPSE_DENSITY);
				drawLine(ELLIPSE_X - halfLength, ELLIPSE_Y, ELLIPSE_X + halfLength, ELLIPSE_Y, ELLIPSE_ROTATION);
			}
			
			generateBoxes(0, 0, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, ELLIPSE_DENSITY);
			drawEllipse(ELLIPSE_X, ELLIPSE_Y, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, ELLIPSE_ROTATION);
			
			stage.addEventListener(MouseEvent.CLICK, onClick);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onClick);
			
			//trace(isPointInEllipse(point.x,point.y,0, 0, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, 0));
			
			for (var dx:int = 0; dx < 1000; dx+=10){
				for (var dy:int = 0; dy < 400; dy+=10){
					checkInsideAndDraw(dx,dy);
				}
			}
			
		}
		
		private function drawPoint(x:Number, y:Number, inside:Boolean):void{
			var pointView:Shape = new Shape();
//			pointView.graphics.lineStyle(3,0x00ff00);
			pointView.graphics.beginFill(inside ? 0x0000FF : 0xFF0000);
			pointView.graphics.drawRect(x,y,10,10);
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
			var inside:Boolean = isPointInEllipse(x, y,ELLIPSE_X, ELLIPSE_Y, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, ELLIPSE_ROTATION );
			var inside2:Boolean = isPointInEllipseJava(x, y,ELLIPSE_X, ELLIPSE_Y, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, ELLIPSE_ROTATION );
			trace(x,y,inside,inside2);
			drawPoint(x,y,inside2);
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
		
		private function isPointInEllipse(xp:Number, yp:Number, x:Number, y:Number, w:Number, h:Number, angle:Number):Boolean{
			//var aaa = Math.pow(Math.cos(angle)*(xp-x) + Math.sin(angle)*(yp-y),2)/Math.pow(h,2) + Math.pow(Math.sin(angle)*(xp-x) - Math.cos(angle)*(yp-y),2)/Math.pow(w,2);
//			var bbb = Math.pow(Math.cos(angle)*(xp-x) + Math.sin(deg2rad(angle))*(yp-y),2)/Math.pow(w/2,2) + Math.pow(Math.sin(angle)*(xp-x) - Math.cos(angle)*(yp-y),2)/Math.pow(h/2,2);
			
			var cosA:Number = Math.cos(deg2rad(angle));
			var sinA:Number = Math.sin(deg2rad(angle));
			var dd:Number = w/2*w/2;
			var DD:Number = h/2*h/2;
			
			var a:Number = Math.pow(cosA*(xp-x)+sinA*(yp-y),2);
			var b:Number = Math.pow(sinA*(xp-x)-cosA*(yp-y),2);
			var ellipse:Number = (a/dd)+(b/DD);
			
//			trace(aaa<= 1,bbb<= 1,ellipse<= 1)
			if (ellipse <= 1)
				return true;
			else
				return false;
		}
		
		private function isPointInEllipseJava(x:Number, y:Number, xc:Number, yc:Number, w:Number, h:Number, angle:Number):Boolean{
			var cosA = Math.cos(deg2rad(angle));
			var sinA = Math.sin(deg2rad(angle));
			var firstPart = Math.pow(cosA*(x-xc) + sinA*(y-yc), 2.0)/Math.pow(w/2, 2.0);
			var secondPart = Math.pow(sinA*(x-xc) - cosA*(y-yc), 2.0)/Math.pow(h/2, 2.0);
			var result = firstPart + secondPart;
			if (result <= 1) {
				return true;
			}
			return false;
		}
		
		private var boxSizeX:Number = 50;
		private var boxSizeY:Number = 50;
		
		private function generateBoxes(x:Number, y:Number, w:Number, h:Number, density:Number):void
		{
			density = 100;
			var xMax:Number = x + w/2 - boxSizeX/2;
			var yMax:Number = y + h/2 - boxSizeY/2;
			var counter:int = 0;
			
			while (counter < density ){
				var r:Rectangle = new flash.geom.Rectangle(getRandom(-xMax,xMax),getRandom(-yMax,yMax),boxSizeX,boxSizeY);
				//var r:Rectangle = new flash.geom.Rectangle(27,173,boxSizeX,boxSizeY);
				var a:Number = getRandom(0,360);
				if(isRectangleInEllipse(r, a)) {
					drawBox(r.x, r.y, r.width, r.height, a, 0x000099);
					counter++;
				}else {
					drawBox(r.x, r.y, r.width, r.height, a, 0x990000);
					//counter++;
				}
			}
		}
		
		private function getRandom(min:int, max:int):int{
			return Math.floor(Math.random() * (max + 1 - min)) + min;
		}
		
		private function isRectangleInEllipse(r:Rectangle, angle:int):Boolean
		{
			trace("checkInEllipse",arguments)
			var x = r.x - r.width/2;
			var y = r.y - r.height/2;
			
			var topLeft:Point = getRotatedPoint2(x,y,angle,r.x,r.y);
			var topRight:Point = getRotatedPoint2(x+r.width,y,angle,r.x,r.y);
			var bottomRight:Point = getRotatedPoint2(x+r.width,y+r.height,angle,r.x,r.y);
			var bottomLeft:Point = getRotatedPoint2(x,y+r.height,angle,r.x,r.y);
			
//			var s:Shape = new Shape();
//			s.graphics.lineStyle(2, 0x000099, .75);
//			s.graphics.moveTo(topLeft.x,topLeft.y);
//			s.graphics.lineTo(topRight.x,topRight.y);
//			s.graphics.lineTo(bottomRight.x,bottomRight.y);
//			s.graphics.lineTo(bottomLeft.x,bottomLeft.y);
//			s.graphics.lineTo(topLeft.x,topLeft.y);
//			container.addChild(s);
			
			var tlInside:Boolean = isPointInEllipse(topLeft.x,topLeft.y,0, 0, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, 0 );
			var trInside:Boolean = isPointInEllipse(topRight.x,topRight.y,0, 0, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, 0 );
			var brInside:Boolean = isPointInEllipse(bottomRight.x, bottomRight.y,0, 0, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, 0 );
			var blInside:Boolean = isPointInEllipse(bottomLeft.x, bottomLeft.y,0, 0, ELLIPSE_WIDTH, ELLIPSE_HEIGHT, 0 );
			trace("isPointInEllipse",tlInside,trInside,brInside, blInside);
			return tlInside && trInside && brInside && blInside;
		}
		
		private function getRotatedPoint2(x0:Number, y0:Number, angle:Number, xc:Number = 0, yc:Number = 0):Point{
//			var xc = 0;
//			var yc = 0;
			var rx = x0 - xc;
			var ry = y0 - yc;
			var c = Math.cos(deg2rad(angle));
			var s = Math.sin(deg2rad(angle));
			var x1 = xc + rx * c - ry * s;
			var y1 = yc + rx * s + ry * c;
			return new Point(x1, y1);
		}
		
		private function getRotatedPoint3(x0:Number, y0:Number, angle:Number):Point{
			var xc = 0;
			var yc = 0;
			var R = getLength(x0,y0,xc,yc);
			var ang : Number = Math.atan2(y0-yc,x0-xc);
			ang += angle;
			var x1 = Math.cos(ang) * R + xc;
			var y1 = Math.sin(ang) * R + yc;
			return new Point(x1, y1);
		}
		
		private function getRotatedPoint(x:Number, y:Number, angle:Number):Point{
			trace("getRotatedPoint",arguments)
			var cosA = Math.cos(deg2rad(angle));
			var sinA = Math.sin(deg2rad(angle));
			var xRotated:Number = x * cosA + y * sinA;
			var yRotated:Number = x * sinA - y * cosA;
			trace("getRotatedPoint return",xRotated,yRotated)
			return new Point(xRotated, yRotated);
		}
		
		private function drawBox(x:Number, y:Number, w:Number, h:Number, angle:Number, color:uint):void
		{
			trace("drawBox",arguments)
			var box:Shape = new Shape();
			box.graphics.lineStyle(1, color, .75);
//			box.graphics.beginFill(0x00FF00);
			box.graphics.drawRect(-w/2,-h/2,w,h);
			box.x = x;
			box.y = y;
			box.rotation = angle;
			
			container.addChild(box);
		}
	}
}
