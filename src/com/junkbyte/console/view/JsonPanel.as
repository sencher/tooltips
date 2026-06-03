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

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TextEvent;
import flash.system.System;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.getTimer;

/**
 * @private
 */
public class JsonPanel extends ConsolePanel {
    
    public static const NAME:String = "jsonPanel";
    
    private var _topBG:Sprite;
    private var txtObject:TextField;
    private var _settingLayout:Boolean;
    
    public function JsonPanel(m:Console) {
        super(m);
        name = NAME;
        
        _topBG = new Sprite();
        _topBG.name = "topBackground";
        addChild(_topBG);
        
        txtField = makeTF("txtField");
        txtField.wordWrap = false;
        txtField.multiline = false;
        txtField.autoSize = TextFieldAutoSize.LEFT;
        txtField.height = style.menuFontSize + 4;
        txtField.selectable = false;
        registerTFRoller(txtField, onMenuRollOver, linkHandler);
        registerDragger(txtField, false, false);
        registerDragger(_topBG, false, false);
        _topBG.addChild(txtField);
        
        txtObject = makeTF("txtObject", true);
        txtObject.multiline = true;
        txtObject.wordWrap = true;
        txtObject.background = true;
        txtObject.backgroundColor = style.backgroundColor;
        addChild(txtObject);

        init(100, 100, false);
        
        addEventListener(Event.ADDED_TO_STAGE, addedToStage);
        addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
    }
    
    private var _autoHideAt:uint;
    
    private function onMouseOver(e:MouseEvent):void {
        _autoHideAt = flash.utils.getTimer() + 10000;
    }
    
    private function addedToStage(event:Event):void {
        stage.addEventListener(ConsoleEvent.UPDATE_JSON_PANEL, onUpdateJsonPanel);
    }
    
    private function onUpdateJsonPanel(event:ConsoleEvent):void {
        setText(event.data);
        visible = true;
    }
    
    override public function set width(n:Number):void {
        super.width = n;
        updateLayout();
    }
    
    override public function set height(n:Number):void {
        super.height = n;
        updateLayout();
    }

    public function update():void {
        if (!visible) return;

        var now:uint = getTimer();
        if (now > _autoHideAt) {
            // Check if focused or has selection
            if (stage && stage.focus == txtObject) {
                _autoHideAt = now + 10000;
            } else if (txtObject.selectionBeginIndex != txtObject.selectionEndIndex) {
                _autoHideAt = now + 10000;
            } else {
                visible = false;
            }
        }
    }

    public function updateLayout():void {
        if (_settingLayout || !txtField || !txtObject || !_topBG) return;
        _settingLayout = true;

        txtField.x = 0;
        txtField.width = width;
        txtField.height = style.menuFontSize + 4;
        txtField.autoSize = TextFieldAutoSize.NONE;
        txtField.htmlText = "<high><r><menu><a href=\"event:copy\">[copy]</a> <a href=\"event:close\">[X]</a></menu></r></high>";
        
        _topBG.graphics.clear();
        _topBG.graphics.beginFill(0x002244, style.backgroundAlpha);
        _topBG.graphics.drawRect(0, 0, width, txtField.height);
        _topBG.graphics.endFill();
        
        txtObject.y = txtField.height;
        txtObject.width = width - 4;
        
        height = txtField.height + txtObject.height;

        _settingLayout = false;
    }

    public function setText(value:String):void {
        txtObject.htmlText = "<p19>" + value + "</p19>";
        txtObject.width = 400;
        if (txtObject.textWidth + 10 > txtObject.width) {
            txtObject.width = txtObject.textWidth + 10;
        }
        if (txtObject.width > 800) txtObject.width = 800;
        
        txtObject.height = txtObject.textHeight + 10;
        if (txtObject.height > 600) txtObject.height = 600;

        width = txtObject.width + 4;
        _autoHideAt = getTimer() + 10000;
        //TweenLite.delayedCall(1, selectAll, [], true);
    }
    
    public function selectAll():void {
        stage.focus = txtObject;
        txtObject.setSelection(0, int.MAX_VALUE);
    }
    
    private function onMenuRollOver(e:TextEvent):void {
        var txt:String = e.text ? e.text.replace("event:", "") : "";
        if (txt == "copy") {
            txt = "Copy JSON to clipboard";
        } else if (txt == "close") {
            txt = "Close JSON viewer";
        } else {
            txt = null;
        }
        console.panels.tooltip(txt, this);
    }
    
    protected function linkHandler(e:TextEvent):void {
        txtField.setSelection(0, 0);
        if (e.text == "close") {
            console.panels.jsonPanelSwitch();
        } else if (e.text == "copy") {
            System.setClipboard(txtObject.text);
            console.report("Copied json content to clipboard.", -1);
        }
        e.stopPropagation();
    }
}
}