/**
 * Created by S.Senkov on 07.02.2017.
 */
package
{
	
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Transform;
	import flash.events.MouseEvent;

	public class Test_TransformMatrix extends Sprite
	{
		private var square:Sprite = new Sprite();
		
		private var resultColorTransform:ColorTransform = new ColorTransform();
		
		private var skewMatrix:Matrix = new Matrix(1, 1, 0, 1);
		
		public function Test_TransformMatrix()
		{
			
			square.graphics.lineStyle(20, 0xFF2200);
			square.graphics.beginFill(0x0000DD);
			square.graphics.drawRect(0, 0, 100, 100);
			addChild(square);
			
			
			resultColorTransform.alphaMultiplier = 0.5;
			resultColorTransform.redOffset = 155;
			resultColorTransform.greenMultiplier = 0.5;
			
			
			
			square.addEventListener(MouseEvent.CLICK, transformer);
		}
		
		
		function transformer(event:MouseEvent):void {
			var transformation:Transform = square.transform;
			var tempMatrix:Matrix = square.transform.matrix;
			tempMatrix.concat(skewMatrix);
			square.transform.colorTransform = resultColorTransform;
			
			square.transform.matrix = tempMatrix;
		}
	}
}


