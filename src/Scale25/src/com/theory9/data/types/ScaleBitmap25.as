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
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	/**
	 * This class takes a graphic and cuts it up into 25 slices allowing for resizing while 
	 * stretching and contracting slices to satisfy the target width and height.
	 * @author TheoryNine
	 */
	public class ScaleBitmap25 extends ScaleBitmap9
	{
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
		public function ScaleBitmap25(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
		{
			super(bitmapData, pixelSnapping, smoothing);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The target bitmapData to be sliced and scaled to satisfy the target width and height.
		 * @param bmpData
		 */		
		override public function set bitmapData(bmpData:BitmapData):void
		{
			//Create clone of set bitmapData to avoid unintentional changing to the source or resulting scaled graphic.
			_originalBitmapData = bmpData.clone();
			
			//If either scale9 or scale25 rectangles are NOT defined.
			if(_scale9Grid != null && _scale25Grid != null)
			{
				//If either rectangle is not valid (not within the confines of the asset -- 1 pixel border).
				if(!validGrid(_scale9Grid) || !validGrid(_scale25Grid))
				{
					//Set both scale 9 and 25 rectangles to null since one of the two or both are not defined.
					_scale9Grid = null;
					_scale25Grid = null;
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
		
		/**
		 * The defined boundaries along which slices will be cut for scale 9.
		 */		
		override public function set scale9Grid(r:Rectangle):void
		{
			//Check if the specified scale 9 rectangle is different from the current one.
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
					//If not valid rectangle.
					if(!validGrid(r))
					{
						throw (new Error("#001 - The scale9Rect does not match the original BitmapData"));
						return;
					}
					
					//Create clone of set bitmapData to avoid unintentional changing to the source or resulting scaled graphic.
					_scale9Grid = r.clone();
					
					//If scale 25 rectangle is defined.
					if(_scale25Grid)
					{
						//Slice and resize graphic.
						resizeBitmap(width, height);
						//Reset scaleX and scaleY to default value of 1.
						scaleX = 1;
						scaleY = 1;
					}
				}
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  scale25Grid
		//----------------------------------
		
		/**
		 * The defined boundaries along which the slices will be cut for scale 25.
		 * This rectangle must be inside of the defined scale 9 rectangle.
		 */
		protected var _scale25Grid:Rectangle;
		
		public function get scale25Grid():Rectangle{return _scale25Grid;}
		public function set scale25Grid(r:Rectangle):void
		{
			//Check if the specified rectangle is different from the current one.
			if((_scale25Grid == null && r != null) || (_scale25Grid != null && !_scale25Grid.equals(r)))
			{
				//If rectangle is NOT defined.
				if(r == null)
				{
					// If deleting scalee9Grid, restore the original bitmap
					// then resize it (streched) to the previously set dimensions
					var currentWidth:Number = width;
					var currentHeight:Number = height;
					_scale25Grid = null;
					
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
						throw (new Error("#001 - The scale25Rect does not match the original BitmapData"));
						return;
					}
					
					//Create clone of set bitmapData to avoid unintentional changing to the source or resulting scaled graphic.
					_scale25Grid = r.clone();
					
					//If counterpart is defined.
					if(_scale9Grid)
					{
						//Slice and resize graphic.
						resizeBitmap(width, height);
						//Reset scaleX and scaleY to default value of 1.
						scaleX = 1;
						scaleY = 1;
					}
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
		override public function setSize(w:Number, h:Number):void
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
		 * The internal method for slicing, resizing and positioning the bitmapData
		 * to satify the target width and height of the graphic.
		 * @param w The target width.
		 * @param h The target height.
		 */		
		override protected function resizeBitmap(w:Number, h:Number):void
		{
			var bmpData:BitmapData = new BitmapData(w, h, true, 0x00000000);
			
			var rows:Array = [0, _scale9Grid.top, _scale25Grid.top, _scale25Grid.bottom, _scale9Grid.bottom, _originalBitmapData.height];
			var cols:Array = [0, _scale9Grid.left, _scale25Grid.left, _scale25Grid.right, _scale9Grid.right, _originalBitmapData.width];
			
			var i:int;
			var adjYRowPts:Array = [rows[0]]; //Adjusted (scaled) vertical points with first point already known.
			var adjXColPts:Array = [cols[0]]; //Adjusted (scaled) horizontal points with first point already known.
			var ttH:Number = 0;
			var ttW:Number = 0;
			
			//Loop through rows and columns to find known/static heights.
			for(i = 0 ; i < rows.length - 1 ; i++)
			{
				//Every other row/column has a static height/width.
				if(i % 2 == 0)
				{
					ttH += rows[i + 1] - rows[i];
					ttW += cols[i + 1] - cols[i];
				}
			}
			
			//Loop through rows/columns (starting with index 1 because 0 is already known).
			for(i = 1 ; i < rows.length ; i++)
			{
				if(i == rows.length - 1)
				{
					//The last position is the resize height.
					adjYRowPts.push(h);
					//The last position is the resize width.
					adjXColPts.push(w);
				}
				else if(i % 2 == 1)
				{
					//Previous point + height of row.
					adjYRowPts.push(adjYRowPts[i - 1] + (rows[i] - rows[i - 1]));
					//Previous point + width of col.
					adjXColPts.push(adjXColPts[i - 1] + (cols[i] - cols[i - 1]));
				}
				else
				{
					//Previous point + Remaining height / # of variable height rows (total rows - header (1) - footer (1) / every other remaining row).
					adjYRowPts.push(adjYRowPts[i - 1] + ((h - ttH) / ((rows.length - 2) / 2)));
					//Previous point + Remaining width / # of variable width cols (total cols - header (1) - footer (1) / every other remaining col).
					adjXColPts.push(adjXColPts[i - 1] + ((w - ttW) / ((cols.length - 2) / 2)));
				}
			}

			var origin:Rectangle;
			var draw:Rectangle;
			var mat:Matrix = new Matrix();

			for(var cx:int = 0 ; cx < cols.length - 1 ; cx++)
			{
				for(var cy:int = 0 ; cy < rows.length - 1 ; cy++)
				{
					origin = new Rectangle(cols[cx], rows[cy], cols[cx + 1] - cols[cx], rows[cy + 1] - rows[cy]);
					draw = new Rectangle(adjXColPts[cx], adjYRowPts[cy], adjXColPts[cx + 1] - adjXColPts[cx], adjYRowPts[cy + 1] - adjYRowPts[cy]);
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
