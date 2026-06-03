package com.junkbyte.console.view {

import com.junkbyte.console.Console;
import com.junkbyte.console.core.LogReferences;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TextEvent;
import flash.system.System;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.getQualifiedClassName;
import flash.utils.getTimer;

/**
 * @private
 */
public class TooltipPanel extends ConsolePanel {
    
    public static const NAME:String = "tooltipPanel";
    
    private var _topBG:Sprite;
    private var _txtObject:TextField;
    private var _lastUpdate:uint;
    private var _autoHideAt:uint;
    
    public function TooltipPanel(m:Console) {
        super(m);
        name = NAME;
        
        _topBG = new Sprite();
        _topBG.name = "topBackground";
        addChild(_topBG);
        
        txtField = makeTF("menuField");
        txtField.height = style.menuFontSize + 4;
        txtField.y = -2;
        registerTFRoller(txtField, onMenuRollOver, linkHandler);
        registerDragger(txtField, false, false);
        registerDragger(_topBG, false, false);
        _topBG.addChild(txtField);
        
        _txtObject = makeTF("tooltipContent", true);
        _txtObject.multiline = true;
        _txtObject.wordWrap = true;
        _txtObject.background = true;
        _txtObject.backgroundColor = style.backgroundColor;
        registerTFRoller(_txtObject, onContentRollOver, linkHandler);
        addChild(_txtObject);
        
        init(200, 100, true);
        
        addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
        addEventListener(ConsolePanel.DRAGGING_ENDED, onDragEnd);
    }
    
    private function onDragEnd(e:Event):void {
        console.so["tooltipX"] = x;
        console.so["tooltipY"] = y;
    }
    
    private function onMouseOver(e:MouseEvent):void {
        _autoHideAt = getTimer() + 10000;
    }
    
    private function onContentRollOver(e:TextEvent):void {
        var url:String = e.text ? e.text.replace("event:", "") : "";
        if (url.indexOf("ref_") == 0) {
            var ind1:int = url.indexOf("_") + 1;
            var id:uint;
            var prop:String = "";
            var ind2:int = url.indexOf("_", ind1);
            if (ind2 > 0) {
                id = uint(url.substring(ind1, ind2));
                prop = url.substring(ind2 + 1);
            } else {
                id = uint(url.substring(ind1));
            }
            var o:Object = console.refs.getRefById(id);
            if (prop && o) o = o[prop];
            if (o) {
                var str:String;
                if (o is String) {
                    str = LogReferences.EscHTML(o as String);
                } else if (o is Array || getQualifiedClassName(o).indexOf("__AS3__.vec::Vector") == 0) {
                    str = console.mapper.json(o);
                } else if (typeof o == "object") {
                    str = console.mapper.explode(o, 2);
                } else {
                    str = String(o);
                }
                show(str);
            }
        }
    }
    
    public function show(str:String, object:Object = null):void {
        _txtObject.htmlText = "<p-2>" + str + "</p-2>";
        
        width = 400;
        var h:Number = _txtObject.textHeight + 10 + (txtField.height - 2);
        if (h > 600) h = 600;
        height = h;
        
        updateMenu();
        updateSize();
        
        visible = true;
        _autoHideAt = getTimer() + 10000;
        
        // Position it outside main panel if possible
        if (parent) {
            if (console.so["tooltipX"] != undefined) {
                x = console.so["tooltipX"];
                y = console.so["tooltipY"];
            } else {
                var main:MainPanel = console.panels.mainPanel;
                x = main.x + main.width + 10;
                y = main.y;
                
                if (stage && x + width > stage.stageWidth) {
                    x = main.x - width - 10;
                }
                if (stage && x < 0) x = 10;
                
                console.so["tooltipX"] = x;
                console.so["tooltipY"] = y;
            }
        }
    }
    
    private function updateMenu():void {
        txtField.x = 0;
        txtField.width = width;
        txtField.autoSize = TextFieldAutoSize.NONE;
        txtField.htmlText = "<high><r><menu><a href=\"event:copy\">[copy]</a> <a href=\"event:close\">[X]</a></menu></r></high>";
    }
    
    private function updateSize():void {
        _topBG.graphics.clear();
        _topBG.graphics.beginFill(0x002244, style.backgroundAlpha);
        _topBG.graphics.drawRect(0, 0, width, txtField.height - 2);
        _topBG.graphics.endFill();
        if (_txtObject) {
            _txtObject.y = txtField.height - 2;
            _txtObject.width = width - 4;
            _txtObject.height = height - _txtObject.y;
        }
    }
    
    override public function set width(n:Number):void {
        super.width = n;
        updateSize();
    }
    
    override public function set height(n:Number):void {
        super.height = n;
        updateSize();
    }
    
    public function update():void {
        if (!visible) return;
        
        var now:uint = getTimer();
        if (now > _autoHideAt) {
            // Check if focused or has selection
            if (stage && stage.focus == _txtObject) {
                _autoHideAt = now + 10000;
            } else if (_txtObject.selectionBeginIndex != _txtObject.selectionEndIndex) {
                _autoHideAt = now + 10000;
            } else {
                visible = false;
            }
        }
    }
    
    private function onMenuRollOver(e:TextEvent):void {
        var txt:String = e.text ? e.text.replace("event:", "") : "";
        if (txt == "copy") {
            txt = "Copy to clipboard";
        } else if (txt == "close") {
            txt = "Close tooltip";
        } else {
            txt = null;
        }
        console.panels.tooltip(txt, this);
    }
    
    protected function linkHandler(e:TextEvent):void {
        if (e.text == "close") {
            visible = false;
        } else if (e.text == "copy") {
            System.setClipboard(_txtObject.text);
            console.report("Copied tooltip content to clipboard.", -1);
        }
    }
}
}
