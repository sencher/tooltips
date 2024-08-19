package wowp.utils.hyperlink {

import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.text.TextField;

import wowp.account.constants.ColorConstants;
import wowp.controls.UIFactory;
import wowp.controls.WeblinkButton;
import wowp.core.Const;
import wowp.core.layers.tip.helper.TipsHelperNoStage;
import wowp.utils.Utils;
import wowp.utils.array.findByField;
import wowp.utils.data.binding.CallbackSet;
import wowp.utils.display.safeRemove;
import wowp.utils.string.getPhraseLocation;
import wowp.utils.string.removeHtmlTags;
import wowp.utils.string.stringReplace;

public class TextHyperlinkProcessor {
    private var _tf:TextField;
    private var _text:String;
    
    private const _links:Vector.<HyperlinkData> = new Vector.<HyperlinkData>();
    private const _tips:TipsHelperNoStage = new TipsHelperNoStage();
    
    public function TextHyperlinkProcessor(tf:TextField) {
        _tf = tf;
    }
    
    public function process():void {
        dispose();
        _text = _tf.htmlText;
        var pattern:RegExp = /\<A +HREF="(.+?)"\>(.+?)\<\/A\>/g;
        var groups:Array;
        var link:HyperlinkData;
        while (groups = pattern.exec(_tf.htmlText)) {
            link = new HyperlinkData(groups[0], groups[2], groups[1]);
            _links.push(link);
            replaceLink(link);
        }
        createOverlay();
        drawText();
    }
    
    public function update():void {
        var link:HyperlinkData;
        _text = _tf.htmlText;
        for each (link in _links) {
            replaceLink(link);
        }
        updateOverlay();
        drawText();
    }
    
    private function replaceLink(link:HyperlinkData):void {
        var subst:String;
        var btnSub:String = "";
        if (link.btnWeb) {
            btnSub = Utils.getSpaces(link.btnWeb.width);
        }
        subst = "<font color='#" + link.colorPlaceholder + "'><u>" + link.label + "</u>" + btnSub + "</font>";
        _text = stringReplace(_text, link.fullMatch, subst);
    }
    
    private function createOverlay():void {
        if (!_links.length) return;
        
        var link:HyperlinkData;
        var locations:Array;
        for each (link in _links) {
            locations = getPhraseLocation(removeHtmlTags(link.label), _tf);
            if (locations.length) {
                link.lineNumber = _tf.getLineIndexAtPoint(locations[0].x, locations[0].y);
            }
            for each (var bounds:Rectangle in locations) {
                link.hover.graphics.beginFill(0xff0000, 0);
                if (locations.indexOf(bounds) == 0) {
                    link.hover.x = bounds.x + _tf.x;
                    link.hover.y = bounds.y + _tf.y;
                    link.hover.graphics.drawRect(-4, 0, bounds.width + 2, bounds.height);
                } else {
                    link.hover.graphics.drawRect(bounds.x - locations[0].x - 2, bounds.y - locations[0].y, bounds.width + 4, bounds.height);
                }
                if (link.btnWeb && locations.indexOf(bounds) == locations.length - 1) {
                    link.btnWeb.x = bounds.x + bounds.width + _tf.x;
                    link.btnWeb.y = bounds.y + bounds.height - link.btnWeb.height + _tf.y;
                }
                link.hover.graphics.endFill();
            }
            link.hover.addEventListener(MouseEvent.CLICK, mouseDownHandler, false, 0, true);
            link.hover.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler, false, 0, true);
            link.hover.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler, false, 0, true);
            if (link.btnWeb) {
                link.btnWeb.addEventListener(MouseEvent.CLICK, mouseDownHandler, false, 0, true);
                link.btnWeb.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler, false, 0, true);
                link.btnWeb.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler, false, 0, true);
                _tips.registerStaticTip(link.hover, UIFactory.createToolTip("TOOLTIPS_DETAIL_BUTTON_DESCRIPTION"));
                _tips.registerStaticTip(link.btnWeb, UIFactory.createToolTip("TOOLTIPS_DETAIL_BUTTON_DESCRIPTION"));
            }
            if (_tf.parent) {
                _tf.parent.addChild(link.hover);
                if (link.btnWeb) {
                    _tf.parent.addChild(link.btnWeb);
                }
            }
        }
    }
    
    public function updateOverlay():void {
        if (!_links.length) return;
        var link:HyperlinkData;
        for each (link in _links) {
            var posY:int = _tf.getCharBoundaries(_tf.getLineOffset(link.lineNumber)).y;
            link.hover.y = posY + _tf.y;
        }
    }
    
    private function drawText(hoveredLink:HyperlinkData = null):void {
        if (!_text) return;
        
        var link:HyperlinkData;
        var text:String;
        var color:uint;
        
        text = _text;
        for each (link in _links) {
            color = link == hoveredLink ? ColorConstants.TEXT_LINE_OVER : ColorConstants.TEXT_LINE_SELECTED;
            text = stringReplace(text, link.colorPlaceholder, color.toString(16));
            if (link.btnWeb) {
                link.btnWeb.setState(link == hoveredLink ? WeblinkButton.OVER : WeblinkButton.UP);
            }
        }
        _tf.htmlText = text;
    }
    
    private function getOperation(link:String):Function {
        var cb:CallbackSet = new CallbackSet();
        if (!HyperlinkConstants.isOpeningModal(link)) {
            cb.add(close);
        }
        cb.add(HyperlinkConstants.getFunction(link));
        return cb.execute;
    }
    
    private function close():void {
        _tf.dispatchEvent(new Event(Event.CLOSE, true, true));
    }
    
    private function mouseOverHandler(e:Event):void {
        var link:HyperlinkData = getLinkByOverlay(e.target);
        drawText(link);
    }
    
    private function mouseOutHandler():void {
        drawText();
    }
    
    private function mouseDownHandler(e:Event):void {
        var link:HyperlinkData = getLinkByOverlay(e.target);
        if (link) {
            getOperation(link.linkID)();
        }
    }
    
    private function getLinkByOverlay(mc:*):HyperlinkData {
        return findByField(_links, Const.HOVER, mc) as HyperlinkData || findByField(_links, "btnWeb", mc) as HyperlinkData;
    }
    
    private function dispose():void {
        var link:HyperlinkData;
        while (_links.length) {
            link = _links.pop();
            if (link.hover) {
                link.hover.graphics.clear();
                link.hover.removeEventListener(MouseEvent.CLICK, mouseDownHandler);
                link.hover.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
                link.hover.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
                _tips.removeStaticTip(link.hover);
                safeRemove(link.hover);
            }
            if (link.btnWeb) {
                link.btnWeb.removeEventListener(MouseEvent.CLICK, mouseDownHandler);
                link.btnWeb.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
                link.btnWeb.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
                _tips.removeStaticTip(link.btnWeb);
                safeRemove(link.btnWeb);
            }
        }
    }
}
}
