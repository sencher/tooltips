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
import com.junkbyte.console.Console;
import com.junkbyte.console.KeyBind;
import com.junkbyte.console.core.LogReferences;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.TextEvent;
import flash.geom.Point;
import flash.system.System;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.Dictionary;

/**
 * @private
 */
public class RollerPanel extends ConsolePanel {
    
    public static const NAME:String = "rollerPanel";
    
    private var _topBG:Sprite;
    private var _keyField:TextField;
    private var _contentField:TextField;
    private var _settingKey:Boolean;
    private var _frozen:Boolean;
    
    public function RollerPanel(m:Console) {
        super(m);
        name = NAME;
        init(60, 100, false);
        
        _topBG = new Sprite();
        _topBG.name = "topBackground";
        addChild(_topBG);
        
        txtField = makeTF("menuField");
        txtField.height = style.menuFontSize + 4;
        txtField.y = -2;
        txtField.selectable = false;
        registerTFRoller(txtField, onMenuRollOver, linkHandler);
        registerDragger(txtField);
        registerDragger(_topBG);
        _topBG.addChild(txtField);

        _keyField = makeTF("keyField");
        _keyField.selectable = false;
        _keyField.y = txtField.y + txtField.height;
        registerTFRoller(_keyField, onMenuRollOver, linkHandler);
        addChild(_keyField);

        _contentField = makeTF("rollerPrints");
        _contentField.multiline = true;
        _contentField.autoSize = TextFieldAutoSize.LEFT;
        registerTFRoller(_contentField, onMenuRollOver, linkHandler);
        addChild(_contentField);

        addEventListener(Event.ENTER_FRAME, _onFrame);
        addEventListener(Event.REMOVED_FROM_STAGE, removeListeners);
    }
    
    private function removeListeners(e:Event = null):void {
        removeEventListener(Event.ENTER_FRAME, _onFrame);
        removeEventListener(Event.REMOVED_FROM_STAGE, removeListeners);
        if (stage) stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
    }
    
    private function _onFrame(e:Event):void {
        if (!console.stage) {
            close();
            return;
        }
        
        var menuStr:String = "<high><menu><a href=\"event:copy\">[unfreeze and copy]</a> <a href=\"event:close\">[X]</a></menu></high>";
        var keyStr:String = "";
        if (_settingKey) {
            keyStr = "<high><menu>Press a key to set <a href=\"event:cancel\"><b>[cancel]</b></a></menu></high>";
        } else {
            var key:String = console.rollerCaptureKey ? console.rollerCaptureKey.key : "unassigned";
            keyStr = "<low>Capture key: <menu><a href=\"event:capture\">" + key + "</a></menu></low>";
        }
        txtField.htmlText = menuStr;
        _keyField.htmlText = keyStr;

        var availWidth:Number = Math.max(_contentField.width, 160);
        txtField.width = availWidth;
        txtField.autoSize = TextFieldAutoSize.NONE;

        _keyField.width = availWidth;
        _keyField.autoSize = TextFieldAutoSize.LEFT;
        _keyField.y = txtField.y + txtField.height;

        if (!_frozen && !_settingKey) {
            _contentField.htmlText = "<low>" + getMapString(false) + "</low>";
            _contentField.autoSize = TextFieldAutoSize.LEFT;
        }
        _contentField.y = _keyField.y + _keyField.height;

        _topBG.graphics.clear();
        _topBG.graphics.beginFill(0x002244, style.backgroundAlpha);
        _topBG.graphics.drawRect(0, 0, availWidth + 4, txtField.height + 2);
        _topBG.graphics.endFill();

        width = availWidth + 4;
        height = _contentField.y + _contentField.height;
    }
    
    public function getMapString(dolink:Boolean):String {
        var stg:Stage = console.stage;
        var str:String = "";
        
        var p:Point = new Point(stg.mouseX, stg.mouseY);
        if (stg.areInaccessibleObjectsUnderPoint(p)) {
            str += "<p9>Inaccessible objects detected</p9><br/>";
        }
        var objs:Array = stg.getObjectsUnderPoint(p);
        
        var stepMap:Dictionary = new Dictionary(true);
        if (objs.length == 0) {
            objs.push(stg);// if nothing at least have stage.
        }
        for each(var child:DisplayObject in objs) {
            var chain:Array = new Array(child);
            var par:DisplayObjectContainer = child.parent;
            while (par) {
                chain.unshift(par);
                par = par.parent;
            }
            var len:uint = chain.length;
            for (var i:uint = 0; i < len; i++) {
                var obj:DisplayObject = chain[i];
                if (stepMap[obj] == undefined) {
                    stepMap[obj] = i;
                    for (var j:uint = i; j > 0; j--) {
                        str += j == 1 ? " ∟" : " -";
                    }
                    
                    var n:String = obj.name;
                    var ind:uint;
                    if (dolink && console.config.useObjectLinking) {
                        ind = console.refs.setLogRef(obj);
                        n = "<a href='event:cl_" + ind + "'>" + n + "</a> " + console.refs.makeRefTyped(obj);
                    } else n = n + " (" + LogReferences.ShortClassName(obj) + ")";
                    
                    if (obj == stg) {
                        ind = console.refs.setLogRef(stg);
                        if (ind) str += "<p3><a href='event:cl_" + ind + "'><i>Stage</i></a> ";
                        else str += "<p3><i>Stage</i> ";
                        str += "[" + stg.mouseX + "," + stg.mouseY + "]</p3><br/>";
                    } else if (i == len - 1) {
                        str += "<p5>" + n + "</p5><br/>";
                    } else {
                        str += "<p2><i>" + n + "</i></p2><br/>";
                    }
                }
            }
        }
        return str;
    }
    
    public function doCapture():void {
        _frozen = !_frozen;
        if (_frozen) copyToClipboard();
    }

    private function copyToClipboard():void {
        System.setClipboard(_contentField.text);
        console.report("Copied roller content to clipboard.", -1);
    }

    public override function close():void {
        cancelCaptureKeySet();
        removeListeners();
        super.close();
        console.panels.updateMenu(); // should be black boxed :/
    }

    private function onMenuRollOver(e:TextEvent):void {
        var txt:String = e.text ? e.text.replace("event:", "") : "";
        if (txt == "close") {
            txt = "Close";
        } else if (txt == "copy") {
            txt = "Unfreeze and copy to clipboard";
        } else if (txt == "capture") {
            var key:KeyBind = console.rollerCaptureKey;
            if (key) {
                txt = "Unassign key ::" + key.key;
            } else {
                txt = "Assign key";
            }
        } else if (txt == "cancel") {
            txt = "Cancel assign key";
        } else {
            txt = null;
        }
        console.panels.tooltip(txt, this);
    }

    protected function linkHandler(e:TextEvent):void {
        if (e.text == "close") {
            close();
        } else if (e.text == "copy") {
            copyToClipboard();
            _frozen = false;
        } else if (e.text == "capture") {
            _frozen = false;
            console.setRollerCaptureKey(null);
            _settingKey = true;
            if (stage) stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, false, 0, true);
            console.panels.tooltip(null);
        } else if (e.text == "cancel") {
            cancelCaptureKeySet();
            console.panels.tooltip(null);
        }
        e.stopPropagation();
    }
    
    private function cancelCaptureKeySet():void {
        _settingKey = false;
        if (stage) stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
    }
    
    private function keyDownHandler(e:KeyboardEvent):void {
        if (!e.charCode) return;
        var char:String = String.fromCharCode(e.charCode);
        cancelCaptureKeySet();
        console.setRollerCaptureKey(char, e.shiftKey, e.ctrlKey, e.altKey);
        console.panels.tooltip(null);
    }
}
}