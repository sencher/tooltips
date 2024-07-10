/*
* 
* Copyright (c) 2008-2010 Lu Aye Oo
* 
* @author 		Lu Aye Oo
* 
* http://code.google.com/p/flash-console/
* 
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
* 
*/
package com.junkbyte.console.view {

import com.greensock.TweenLite;
import com.junkbyte.console.Console;
import com.junkbyte.console.core.ConsoleEvent;

import flash.events.Event;
import flash.events.TextEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

/**
 * @private
 */
public class JsonPanel extends ConsolePanel {
    
    public static const NAME:String = "jsonPanel";
    
    private var txtObject:TextField;
    
    public function JsonPanel(m:Console) {
        super(m);
        name = NAME;
        init(100, 100, false);
        txtField = makeTF("txtField");
        txtField.wordWrap = true;
        txtField.width = 160;
        txtField.multiline = true;
        txtField.autoSize = TextFieldAutoSize.LEFT;
        registerTFRoller(txtField, onMenuRollOver, linkHandler);
        registerDragger(txtField);
        addChild(txtField);
        
        txtObject = makeTF("txtObject");
        txtObject.width = txtObject.height = 160;
        txtObject.multiline = true;
//        setText("sdfdfdfdfgfdg");
        addChild(txtObject);
        
        addEventListener(Event.ADDED_TO_STAGE, addedToStage);
    }
    
    private function addedToStage(event:Event):void {
        stage.addEventListener(ConsoleEvent.UPDATE_JSON_PANEL, onUpdateJsonPanel);
    }
    
    private function onUpdateJsonPanel(event:ConsoleEvent):void {
        setText(event.data);
        visible = true;
    }
    
    public function update():void {
        txtField.wordWrap = false;
        txtField.width = 80;
        txtField.htmlText = "<high><menu> <b><a href=\"event:close\">X</a></b></menu>                         </high>";
        if (txtField.width > 160) {
            txtField.wordWrap = true;
            txtField.width = 160;
        }
        
        txtObject.y = txtField.y + txtField.height;
        
        width = txtObject.width + 4;
        height = txtField.height + txtObject.height;
    }
    
    public function setText(value:String):void {
        txtObject.htmlText = "<p19>" + value + "</p19>";
        TweenLite.delayedCall(1, selectAll, [], true);
    }
    
    public function selectAll():void {
        stage.focus = txtObject;
        txtObject.setSelection(0, int.MAX_VALUE);
    }
    
    private function onMenuRollOver(e:TextEvent):void {
        console.panels.mainPanel.onMenuRollOver(e, this);
    }
    
    protected function linkHandler(e:TextEvent):void {
        txtField.setSelection(0, 0);
        if (e.text == "close") {
            console.panels.jsonPanelSwitch();
        }
        e.stopPropagation();
    }
}
}