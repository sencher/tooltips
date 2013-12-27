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

package com.theory9.ex02.view
{
	import com.theory9.data.types.ScaleBitmap25;
	import com.theory9.data.types.ScaleBitmap9;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class MainViewBase extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Constructor 
		 */
		public function MainViewBase()
		{
			super();
			
			//Vertical gap between laid out graphics.
			var vGap:Number = 20;
			//Start x position of first graphic.
			var startX:Number = 10;
			//Start y position of first graphic.
			var startY:Number = 10;
			//The target width of the resized graphics.
			var targetW:Number = 250;
			//The target height of the resized graphics.
			var targetH:Number = 120;
			//Generic display object.
			var dispObj:DisplayObject;
			//The scaled button graphic (not using scale 9 or scale 25).
			var buttonScaled:Bitmap;
			
			//Position original button.
			button.x = startX;
			button.y = startY;
			this.addChild(button);
			
			//Create graphic from bitmapdata of original.
			buttonScaled = new Bitmap(getBitmapData(button));
			buttonScaled.width = targetW;
			buttonScaled.height = targetH;
			buttonScaled.x = startX;
			buttonScaled.y = button.y + button.height + vGap;
			this.addChild(buttonScaled);
			
			//Create scale 9 version of button.
			dispObj = setupScale9(button, targetW, targetH, startX, buttonScaled.y + buttonScaled.height + vGap);
			//Create scale 25 version of button.
			dispObj = setupScale25(button, targetW, targetH, startX, dispObj.y + dispObj.height + vGap);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The original button graphic. 
		 */	
		protected var button:Sprite;
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Creates a scale 25 displayObject that is sliced and scaled to match target size.
		 * @param button The original graphic to be scaled.
		 * @param targetWidth The target width of the graphic.
		 * @param targetHeight The target height of the graphic.
		 * @param x The target x position of the graphic.
		 * @param y The target y position of the graphic.
		 * @return Sliced and resized representation of graphic.
		 */	
		private function setupScale25(button:Sprite, targetWidth:Number, targetHeight:Number, x:Number, y:Number):DisplayObject
		{
			//Get scale-9 rectangle child from the button asset.
			var scale9sprite:Sprite = button.getChildByName("scale9rect") as Sprite;
			//Get scale-25 rectangle child from the button asset.
			var scale25sprite:Sprite = button.getChildByName("scale25rect") as Sprite;
			
			//Create scale 25 instance and set bitmap data through the constructor.
			var scale25Bitmap:ScaleBitmap25 = new ScaleBitmap25(getBitmapData(button));
			//Set outer rectange (which determines slices).
			scale25Bitmap.scale9Grid = new Rectangle(scale9sprite.x, scale9sprite.y, scale9sprite.width, scale9sprite.height);
			//Set inner rectange (which determines slices).
			scale25Bitmap.scale25Grid = new Rectangle(scale25sprite.x, scale25sprite.y, scale25sprite.width, scale25sprite.height);
			//Set the desired size of the graphic.
			scale25Bitmap.setSize(targetWidth, targetHeight);
			scale25Bitmap.x = x;
			scale25Bitmap.y = y;
			//Add to display list.
			this.addChild(scale25Bitmap) as ScaleBitmap25;
			
			return scale25Bitmap;
		}
		
		/**
		 * Creates a scale 9 displayObject that is sliced and scaled to match target size.
		 * @param button The original graphic to be scaled.
		 * @param targetWidth The target width of the graphic.
		 * @param targetHeight The target height of the graphic.
		 * @param x The target x position of the graphic.
		 * @param y The target y position of the graphic.
		 * @return Sliced and resized representation of graphic.
		 */	
		private function setupScale9(button:Sprite, targetWidth:Number, targetHeight:Number, x:Number, y:Number):DisplayObject
		{
			//Get scale-9 rectangle child from the button asset.
			var scale9sprite:Sprite = button.getChildByName("scale9rect") as Sprite;
			
			//Create scale 9 instance and set bitmap data through the constructor.
			var scale9Bitmap:ScaleBitmap9 = new ScaleBitmap9(getBitmapData(button));
			//Set the rectange (which determines slices).
			scale9Bitmap.scale9Grid = new Rectangle(scale9sprite.x, scale9sprite.y, scale9sprite.width, scale9sprite.height);
			//Set the desired size of the graphic.
			scale9Bitmap.setSize(targetWidth, targetHeight);
			scale9Bitmap.x = x;
			scale9Bitmap.y = y;
			//Add to display list.
			this.addChild(scale9Bitmap) as ScaleBitmap9;
			
			return scale9Bitmap;
		}
		
		/**
		 * Captures graphic's bitmapData (transparencies maintained).
		 * @param displayObject The graphic to copy bitmap data from.
		 * @return Captured bitmapData.
		 */	
		private function getBitmapData(displayObject:DisplayObject):BitmapData
		{
			var bd:BitmapData = new BitmapData(displayObject.width, displayObject.height, true, 0);
			bd.draw(displayObject);
			return bd;
		}
	}
}
