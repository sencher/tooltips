/**
 * Scale25 by TheoryNine
 * Visit us at http://theorynine.com/labs for news, code and more fun toys.
 * Support TheoryNine open-source projects at http://theorynine.com/labs/donations and help keep this and other projects going strong.
 * 
 * Copyright (c) 2010 TheoryNine
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 **/

package com.theory9.data.types
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	/**
	 * This class takes a graphic and cuts it up into 9 slices allowing for resizing while 
	 * stretching and contracting slices to satisfy the target width and height.
	 * @author TheoryNine
	 */	
	public class ScaleBitmap9 extends Bitmap
	{
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The library version (following the format: 'major.minor.incremental').
		 */		
		static public const VERSION:String = "1.0.002";
		
		//--------------------------------------------------------------------------
		//
		//  Constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The library version as defined in the class constant by the same name.
		 * This constant is setup for accessibility.
		 */
		public const VERSION:String = ScaleBitmap9.VERSION;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor 
		 * @param bitmapData The bitmapData of the graphic being scaled.
		 * @param pixelSnapping Controls whether or not the Bitmap object is snapped to the nearest pixel.
		 * @param smoothing Controls whether or not the bitmap is smoothed when scaled.
		 */		
		public function ScaleBitmap9(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
		{
			super(bitmapData, pixelSnapping, smoothing);
			
			//Set the original bitmapData.
			_originalBitmapData = bitmapData.clone();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  originalBitmapData
		//----------------------------------
		
		/**
		 * The original bitmapData that was explicitly defined for use. 
		 */ 
		protected var _originalBitmapData:BitmapData;
		
		public function get originalBitmapData():BitmapData{return _originalBitmapData;}
		
		//----------------------------------
		//  bitmapData
		//----------------------------------
		
		/**
		 * The target bitmapData to be sliced and scaled to satisfy the target width and height.
		 * @param bmpData
		 */	
		override public function set bitmapData(bmpData:BitmapData):void
		{
			//Create clone of set bitmapData to avoid unintentional changing to the source or resulting scaled graphic.
			_originalBitmapData = bmpData.clone();
			
			//If scale9 or rectangles is NOT defined.
			if(_scale9Grid != null)
			{
				//If rectangle is not valid (not within the confines of the asset -- 1 pixel border).
				if(!validGrid(_scale9Grid))
				{
					//Set scale 9 rectangles to null.
					_scale9Grid = null;
				}
				
				//Set to size of defined bitmapData.
				setSize(bmpData.width, bmpData.height);
			}
			else
			{
				//Clone original to avoid permantently changing it and set final output.
				assignBitmapData(_originalBitmapData.clone());
			}
		}
		
		//----------------------------------
		//  width
		//----------------------------------
		
		/**
		 * @param w The target width of the graphic.
		 */		
		override public function set width(w:Number):void
		{
			if(w != width)
			{
				//Set to size of specified width and existing height value.
				setSize(w, height);
			}
		}
		
		//----------------------------------
		//  height
		//----------------------------------
		
		/**
		 * @param h The target height of the graphic.
		 */	
		override public function set height(h:Number):void
		{
			if(h != height)
			{
				//Set to size of existing width value and specified height.
				setSize(width, h);
			}
		}
		
		//----------------------------------
		//  scale9Grid
		//----------------------------------
		
		/**
		 * The defined boundaries along which the slices will be cut for scale 9.
		 */		
		protected var _scale9Grid:Rectangle;
		
		override public function get scale9Grid():Rectangle{return _scale9Grid;}
		override public function set scale9Grid(r:Rectangle):void
		{
			//Check if the specified rectangle is different from the current one.
			if((_scale9Grid == null && r != null) || (_scale9Grid != null && !_scale9Grid.equals(r)))
			{
				//If rectangle is NOT defined.
				if(r == null)
				{
					// If deleting scalee9Grid, restore the original bitmap
					// then resize it (streched) to the previously set dimensions
					var currentWidth:Number = width;
					var currentHeight:Number = height;
					_scale9Grid = null;
					
					//Clone original to avoid permantently changing it and set final output.
					assignBitmapData(_originalBitmapData.clone());
					//Set size to existing width and height values.
					setSize(currentWidth, currentHeight);
				}
				//Else rectangle is defined.
				else
				{
					if(!validGrid(r))
					{
						throw (new Error("#001 - The scale9Rect does not match the original BitmapData"));
						return;
					}
					
					//Create clone of set bitmapData to avoid unintentional changing to the source or resulting scaled graphic.
					_scale9Grid = r.clone();
					//Slice and resize graphic.
					resizeBitmap(width, height);
					//Reset scaleX and scaleY to default value of 1.
					scaleX = 1;
					scaleY = 1;
				}
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Sets the target width and height of the graphic.
		 * @param w The target width.
		 * @param h The target height.
		 */		
		public function setSize(w:Number, h:Number):void
		{
			//If scale 9 rectangle is NOT defined. 
			if(_scale9Grid == null)
			{
				super.width = w;
				super.height = h;
			}
			//Else rectangle is defined.
			else
			{
				w = Math.max(w, _originalBitmapData.width - _scale9Grid.width);
				h = Math.max(h, _originalBitmapData.height - _scale9Grid.height);
				
				//Slice and resize graphic.
				resizeBitmap(w, h);
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------

		/**
		 * Updates the final resized bitmapData output.
		 * @param bmp The final bitmapData output.
		 */		
		protected function assignBitmapData(bmp:BitmapData):void
		{
			super.bitmapData.dispose();
			super.bitmapData = bmp;
		}
		
		/**
		 * Validates the defined rectangle boundaries along which the slices are cut.
		 * @param r The rectangle indicating where slices should occur.
		 * @return Whether valid or not.
		 */		
		protected function validGrid(r:Rectangle):Boolean
		{
			return r.right <= _originalBitmapData.width && r.bottom <= _originalBitmapData.height;
		}
		
		/**
		 * The internal method for slicing, resizing and positioning the bitmapData
		 * to satify the target width and height of the graphic.
		 * @param w The target width.
		 * @param h The target height.
		 */			
		protected function resizeBitmap(w:Number, h:Number):void
		{
			var bmpData:BitmapData = new BitmapData(w, h, true, 0x00000000);
			
			var rows:Array = [0, _scale9Grid.top, _scale9Grid.bottom, _originalBitmapData.height];
			var cols:Array = [0, _scale9Grid.left, _scale9Grid.right, _originalBitmapData.width];
			
			var dRows:Array = [0, _scale9Grid.top, h - (_originalBitmapData.height - _scale9Grid.bottom), h];
			var dCols:Array = [0, _scale9Grid.left, w - (_originalBitmapData.width - _scale9Grid.right), w];

			var origin:Rectangle;
			var draw:Rectangle;
			var mat:Matrix = new Matrix();

			for(var cx:int = 0 ; cx < 3 ; cx++)
			{
				for(var cy:int = 0 ; cy < 3 ; cy++)
				{
					origin = new Rectangle(cols[cx], rows[cy], cols[cx + 1] - cols[cx], rows[cy + 1] - rows[cy]);
					draw = new Rectangle(dCols[cx], dRows[cy], dCols[cx + 1] - dCols[cx], dRows[cy + 1] - dRows[cy]);
					mat.identity();
					mat.a = draw.width / origin.width;
					mat.d = draw.height / origin.height;
					mat.tx = draw.x - origin.x * mat.a;
					mat.ty = draw.y - origin.y * mat.d;
					bmpData.draw(_originalBitmapData, mat, null, null, draw, smoothing);
				}
			}
			
			//Set resulting bitmapData as final output.
			assignBitmapData(bmpData);
		}
	}
}
