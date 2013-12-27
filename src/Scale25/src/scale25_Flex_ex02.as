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

import com.theory9.ex02.view.MainViewFlex;

import mx.events.FlexEvent;

private function onApplicationComplete(e:FlexEvent):void
{
	//Create instance of flex version of MainView.
	var mainView:MainViewFlex = new MainViewFlex();
	//Add as child of a UIComponent instance to avoid error.
	mainViewCont.addChild(mainView);
}
