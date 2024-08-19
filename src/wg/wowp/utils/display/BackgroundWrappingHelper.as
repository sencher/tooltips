package wowp.utils.display {

import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.geom.Rectangle;
import flash.text.TextField;

import scaleform.clik.utils.Padding;

/**
 * вычисляет паддинги для _background относительно чайлдов container и ресайзит _background так, чтобы падинги сохранились
 * можно использовать в тех местах, где нужно обеспечить падинги выставленные в флеше с помощью дисплейных объектов
 */
public class BackgroundWrappingHelper {
    private var _background:DisplayObject;
    private var _container:DisplayObjectContainer;
    
    private const _padding:Padding = new Padding();
    private var _skip:Array = [];
    
    /**
     * background должен быть чайлдом container'a
     * @param    background
     * @param    container
     */
    public function BackgroundWrappingHelper(background:DisplayObject, container:DisplayObjectContainer,
                                             skip:Array = null) {
        _background = background;
        _container = container;
//        Cc.green2cw(this, "BackgroundWrappingHelper.constructor background:", background, "container:", container, "skip:", skip, "isValid():", isValid());
        if (skip) _skip = skip.slice();
        if (isValid()) {
            var contentBounds:Rectangle = findContentBounds();
            var bgBounds:Rectangle = _background.getBounds(_container);
//            Cc.bluec(this, "contentBounds:", contentBounds, "bgBounds:", bgBounds);
            _padding.top = contentBounds.top - bgBounds.top;
            _padding.left = contentBounds.left - bgBounds.left;
            _padding.bottom = contentBounds.bottom - bgBounds.bottom;
            _padding.right = contentBounds.right - bgBounds.right;
        }
//        Cc.greenc(this, "_padding:", _padding.toString());
    }
    
    /**
     * ресайз и позиционирование background с учетом баундинга контента и паддингов
     * @param    horizontal    - изменять ли размеры по горизонтали
     * @param    vertical    - изменять ли размеры по вертикали
     */
    public function draw(horizontal:Boolean = true, vertical:Boolean = true, visibleOnly:Boolean = false):void {
//        Cc.green2cw(this, "draw horizontal:", horizontal, "vertical:", vertical, "visibleOnly:", visibleOnly);
        if (isValid()) {
            var contentBounds:Rectangle = findContentBounds(visibleOnly);
            var bgBounds:Rectangle = new Rectangle();
//            Cc.cyan("bgBounds.top:", bgBounds.top, ">", contentBounds.top, "—", _padding.top, "=", contentBounds.top - _padding.top);
//            Cc.cyan("bgBounds.left:", bgBounds.left, ">", contentBounds.left, "—", _padding.left, "=", contentBounds.left - _padding.left);
//            Cc.cyan("bgBounds.bottom:", bgBounds.bottom, ">", contentBounds.bottom, "—", _padding.bottom, "=", contentBounds.bottom - _padding.bottom);
//            Cc.cyan("bgBounds.right:", bgBounds.right, ">", contentBounds.right, "—", _padding.right, "=", contentBounds.right - _padding.right);
            bgBounds.top = contentBounds.top - _padding.top;
            bgBounds.left = contentBounds.left - _padding.left;
            bgBounds.bottom = contentBounds.bottom - _padding.bottom;
            bgBounds.right = contentBounds.right - _padding.right;
//            Cc.green("contentBounds:", contentBounds, "_padding:", _padding.toString(), "bgBounds:", bgBounds);
            //	FIXME:	здесь корректно будет работать только если у бекграунда будет точка отсчета слева вверху
            if (horizontal) {
//                Cc.berry("x:", _background.x, ">", bgBounds.x);
//                Cc.berry("width:", _background.width, ">", bgBounds.width);
                _background.x = int(bgBounds.x);
                _background.width = int(bgBounds.width);
            }
            if (vertical) {
//                Cc.berry("y:", _background.y, ">", bgBounds.y);
//                Cc.berry("height:", _background.height, ">", bgBounds.height);
                _background.y = int(bgBounds.y);
                _background.height = int(bgBounds.height);
            }
//            Cc.sky("_background.x:", _background.x, "_background.y:", _background.y, "_background.width:", _background.width, "_background.height:", _background.height);
        }
    }
    
    private function findContentBounds(visibleOnly:Boolean = false):Rectangle {
//        Cc.green2cw(this, "findContentBounds visibleOnly:", visibleOnly);
        var contentBounds:Rectangle = new Rectangle(int.MAX_VALUE, int.MAX_VALUE, -uint.MAX_VALUE, -uint.MAX_VALUE);
        
        var i:int = 0;
        var len:int = _container.numChildren;
        for (i; i < len; ++i) {
            var displayObject:DisplayObject = _container.getChildAt(i);
//            Cc.green(displayObject);
            if (_skip.indexOf(displayObject) != -1) {
//                Cc.grey("skipped");
                continue;
            }
            if (displayObject == _background) {
//                Cc.grey("_background");
                continue;
            }	//	пропускаем бекграунд
            if (!displayObject.visible && visibleOnly) {
//                Cc.grey("not visible");
                continue;
            }
            var bounds:Rectangle = displayObject.getBounds(_container);
//            Cc.blue("bounds:", bounds);
            if (displayObject is TextField) {
                bounds.left += 2;
                bounds.top += 2;
            }
            if (contentBounds.left > bounds.left) contentBounds.left = bounds.left;
//            Cc.green("contentBounds.right:", contentBounds.right, "bounds.right:", bounds.right);
            if (contentBounds.right < bounds.right) contentBounds.right = bounds.right;
//            Cc.green("after contentBounds.right:", contentBounds.right, "bounds.right:", bounds.right);
            if (contentBounds.top > bounds.top) contentBounds.top = bounds.top;
            if (contentBounds.bottom < bounds.bottom) contentBounds.bottom = bounds.bottom;
//            Cc.pink("contentBounds:", contentBounds);
        }
        
        return contentBounds;
    }
    
    public function isValid():Boolean {
        //	количество чайлдов должно быть больше одного, т.к. бекграунд тоже чайлд
        return _container.numChildren > 1 && _container == _background.parent;
    }
    
    public function addToExlude(...args):void {
        for each(var d:Object in args) {
            if (_skip.indexOf(d) == -1) {
                _skip.push(d);
            }
        }
    }
    
    public function removeFromExclude(...args):void {
        for each(var d:Object in args) {
            var index:int = _skip.indexOf(d);
            if (index != -1) {
                _skip.splice(index, 1);
            }
        }
    }
    
    public function updateSkipElements(...args:Array):void {
        _skip = args;
    }
    
    public function updateBackground(d:DisplayObject):void {
//        Cc.orangecw(this, "updateBackground d:", d, "d.width:", d.width);
        _background = d;
    }
}
    
}