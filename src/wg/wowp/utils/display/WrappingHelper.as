package wowp.utils.display {

import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.geom.Rectangle;

import scaleform.clik.utils.Padding;

public class WrappingHelper {
    private var _outerWrapper:DisplayObject;
    private var _innerWrapper:DisplayObject;
    
    private const _padding:Padding = new Padding();
    
    public function WrappingHelper(outerWrapper:DisplayObject, innerWrapper:DisplayObject) {
//        Cc.green2cw(this, "WrappingHelper.constructor outerWrapper:", outerWrapper, "innerWrapper:", innerWrapper);
        _outerWrapper = outerWrapper;
        _innerWrapper = innerWrapper;
        if (isValid()) {
            var innerBounds:Rectangle = _innerWrapper.getBounds(_innerWrapper.parent);
            var outerBounds:Rectangle = _outerWrapper.getBounds(_outerWrapper.parent);
            _padding.top = innerBounds.top - outerBounds.top;
            _padding.left = innerBounds.left - outerBounds.left;
            _padding.bottom = innerBounds.bottom - outerBounds.bottom;
            _padding.right = innerBounds.right - outerBounds.right;
//            Cc.greenc(this, "innerBounds:", innerBounds, "outerBounds:", outerBounds, "_padding:", _padding.toString());
        }
    }
    
    public function setWrapper(d:DisplayObject):void {
//        Cc.green2cw(this, "setWrapper _outerWrapper:", _outerWrapper, ">:", d);
        _outerWrapper = d;
    }
    
    public function draw(horizontal:Boolean = true, vertical:Boolean = true):void {
//        Cc.grass2cw(this, "draw horizontal:", horizontal, "vertical:", vertical);
        if (isValid()) {
            var innerBounds:Rectangle = _innerWrapper.getBounds(_innerWrapper.parent);
            var outerBounds:Rectangle = new Rectangle();
//            Cc.cyan("outerBounds.top:", outerBounds.top, ">", innerBounds.top, "—", _padding.top, "=", innerBounds.top - _padding.top);
//            Cc.cyan("outerBounds.left:", outerBounds.left, ">", innerBounds.left, "—", _padding.left, "=", innerBounds.left - _padding.left);
//            Cc.cyan("outerBounds.bottom:", outerBounds.bottom, ">", innerBounds.bottom, "—", _padding.bottom, "=", innerBounds.bottom - _padding.bottom);
//            Cc.cyan("outerBounds.right:", outerBounds.right, ">", innerBounds.right, "—", _padding.right, "=", innerBounds.right - _padding.right);
            outerBounds.top = innerBounds.top - _padding.top;
            outerBounds.left = innerBounds.left - _padding.left;
            outerBounds.bottom = innerBounds.bottom - _padding.bottom;
            outerBounds.right = innerBounds.right - _padding.right;
//            Cc.green("innerBounds:", innerBounds, "_padding:", _padding.toString(), "outerBounds:", outerBounds);
            //	FIXME:	здесь корректно будет работать только если у бекграунда будет точка отсчета слева вверху
            if (horizontal) {
//                Cc.berry("x:", _outerWrapper.x, ">", outerBounds.x);
//                Cc.berry("width:", _outerWrapper.width, ">", outerBounds.width);
                _outerWrapper.x = outerBounds.x;
                _outerWrapper.width = outerBounds.width;
            }
            if (vertical) {
//                Cc.berry("y:", _outerWrapper.y, ">", outerBounds.y);
//                Cc.berry("height:", _outerWrapper.height, ">", outerBounds.height);
                _outerWrapper.y = outerBounds.y;
                _outerWrapper.height = outerBounds.height;
            }
//            Cc.sky2("_outerWrapper.x:", _outerWrapper.x, "_outerWrapper.y:", _outerWrapper.y, "_outerWrapper.width:", _outerWrapper.width, "_outerWrapper.height:", _outerWrapper.height);
        }
    }
    
    public function isValid():Boolean {
        return _outerWrapper != _innerWrapper && _outerWrapper && _innerWrapper && _innerWrapper.parent != null && _outerWrapper.parent != null;
    }
    
    public function updateElements(outerWrapper:DisplayObject, innerWrapper:DisplayObject):void {
//        Cc.green2cw(this, "updateElements outerWrapper:", outerWrapper, "innerWrapper:", innerWrapper);
        _outerWrapper = outerWrapper;
        _innerWrapper = innerWrapper;
    }
}
    
}