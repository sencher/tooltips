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
	import flash.text.TextField;
	
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
	private var ELLIPSE_WIDTH:Number = 80;
	private var ELLIPSE_HEIGHT:Number = 60;
	private var ELLIPSE_ROTATION:Number = 4550;
		
	private var curRotation:Number = 0;
	private var container:Sprite = new Sprite();
		
	private var tf:TextField = new TextField();
		public function Test_CirclesElipse4()
		{
//			Cc.start(this);
//			Cc.visible = true;
			tf.width = tf.height = 1000;
			addChild(tf);
			
			ELLIPSE_X = Math.random()*1000;
			ELLIPSE_Y = Math.random()*1000;
			ELLIPSE_WIDTH = Math.random()*1000;
			ELLIPSE_HEIGHT = Math.random()*1000;
			ELLIPSE_ROTATION = Math.random()*360;
			
//			var debug:String ="587.4927979893982 600.4301062785089 419.62395515292883 534.6810068003833 24.36956369318068";
//			var debArray:Array = debug.split(" ");
//			X1 = debArray[0];
//			Y1 = debArray[1];
//			X2 = debArray[2];
//			Y2 = debArray[3];
//			RADIUS = debArray[4];
			
			tf.appendText("\n " + ELLIPSE_X +" "+ELLIPSE_Y +" "+ELLIPSE_WIDTH +" "+ELLIPSE_HEIGHT +" "+ELLIPSE_ROTATION);
			tf.width = tf.height = 1000;
			addChild(tf);
			addChild(container);
			
			
			var halfLength:Number;
			var width:Number;
			if(ELLIPSE_HEIGHT >= ELLIPSE_WIDTH){
				halfLength = ELLIPSE_HEIGHT / 2;
				width = ELLIPSE_WIDTH;
				generateCircles(ELLIPSE_X, ELLIPSE_Y - halfLength, ELLIPSE_X, ELLIPSE_Y + halfLength, width/2, ELLIPSE_ROTATION, 12);
				drawLine(ELLIPSE_X, ELLIPSE_Y - halfLength, ELLIPSE_X, ELLIPSE_Y + halfLength, ELLIPSE_ROTATION);
			}else{
				halfLength = ELLIPSE_WIDTH /2 ;
				width = ELLIPSE_HEIGHT;
				generateCircles(ELLIPSE_X - halfLength, ELLIPSE_Y, ELLIPSE_X + halfLength, ELLIPSE_Y, width/2, ELLIPSE_ROTATION, 33);
				drawLine(ELLIPSE_X - halfLength, ELLIPSE_Y, ELLIPSE_X + halfLength, ELLIPSE_Y, ELLIPSE_ROTATION);
			}
			
			//drawLine(-ELLIPSE_HEIGHT/2,ELLIPSE_Y,ELLIPSE_HEIGHT/2,ELLIPSE_Y);
			drawEllipse(ELLIPSE_X,ELLIPSE_Y,ELLIPSE_WIDTH,ELLIPSE_HEIGHT, ELLIPSE_ROTATION);
			
			
			addEventListener(MouseEvent.CLICK, onClick)
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
		
		private function onClick(event:Event):void
		{
			line.rotation +=10;
			ellipse.rotation += 10;
			container.rotation += 10;
//			curRotation += 10;
//			removeChild(ellipse);
//			//ellipse.rotation += 7;
//			drawEllipse(ellipse.x, ellipse.y,  ELLIPSE_WIDTH, ELLIPSE_HEIGHT, curRotation)
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
		
		private function generateCircles(x1:Number, y1:Number, x2:Number, y2:Number, radius:Number, angle:int, density:int):void {
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
					curY = y1 +i*(y2-y1)/steps;
					curX = (y2*x1-y1*x2-(x1-x2)*curY)/(y2-y1);
				}else{
					curX = x1 +i*(x2-x1)/steps;
					curY = (x2*y1-x1*y2-(y1-y2)*curX)/(x2-x1);
				}

				
				lenghtFromCenter = getLength(curX,curY,centerX,centerY);
				curR = Math.sqrt(1-Math.pow(lenghtFromCenter,2)/Math.pow(length/2,2))*radius;
				
				if (curR<(length/2-lenghtFromCenter))
					drawCircle(curX-centerX,curY-centerY,curR);
				else
					curR=(length/2-lenghtFromCenter);
			}
		}
	}
}
