package {

import flash.display.MovieClip;
import flash.events.Event;
import flash.system.ApplicationDomain;
import flash.text.TextFieldAutoSize;

public class ButtonBar extends MovieClip {
    // Constants:
    public static const DIRECTION_HORIZONTAL:String = "horizontal";
    public static const DIRECTION_VERTICAL:String = "vertical";
    
    // Public Properties:
    
    // Protected Properties:
    /** @private */
    protected var _autoSize:String = "none";
    /** @private */
    protected var _buttonWidth:Number = 0;
    /** @private */
    protected var _direction:String = DIRECTION_HORIZONTAL;
    /** @private */
    protected var _itemRenderer:String = "Button";
    /** @private */
    protected var _itemRendererClass:Class;
    /** @private */
    protected var _labelField:String = "label";
    /** @private */
    protected var _labelFunction:Function;
    /** @private */
    protected var _renderers:Array;
    /** @private */
    protected var _spacing:Number = 0;
    /** @private */
    protected var _selectedIndex:Number = -1;
    /** @private */
    protected var _isOverflown:Boolean = false;
    /** @private */
    protected var _focusable:Boolean = false;
    protected var _enableInitCallback:Boolean = false;
    /** @private */
    protected var _contentSize:int;
    
    // UI Elements:
    public var container:MovieClip;
    
    // Initialization:
    public function ButtonBar() {
        super();
    }
    
    // Public Getter / Setters:
    /**
     * Enable/disable this component. Focus (along with keyboard events) and mouse events will be suppressed if disabled.
     */
    [Inspectable(defaultValue="true")]
    override public function get enabled():Boolean {
        return super.enabled;
    }
    
    override public function set enabled(value:Boolean):void {
        if (enabled == value) {
            return;
        }
        super.enabled = value;
        for (var i:Number = 0; i < _renderers.length; i++) {
            if (_itemRendererClass) {
                (_renderers[i] as _itemRendererClass).enabled = value;
            } else {
                
            }
            
        }
    }
    

    
    /**
     * The linkage ID for the renderer used to display each item in the list. The list components only support
     * a single itemRenderer for all items.
     */
    [Inspectable(name="itemRenderer", defaultValue="Bu3334")]
    public function set itemRendererName(value:String):void {
        trace("6666 ButtonBar.set itemRendererName name:", name, "value:", value);
        level2();

        
        // Need a try/catch in case the specified class cannot be found:
        try {
            var domain:ApplicationDomain = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null) domain = loaderInfo.applicationDomain;
            var classRef:Class = domain.getDefinition(value) as Class;
        } catch (error:*) {
            
        }
        
        if (classRef != null) {
           
            _itemRendererClass = classRef;
            addChild(new _itemRendererClass());
            var i2 = new _itemRendererClass();
            i2.y = i2.height;
            addChild(i2);
            
        }
    }

    public function level2():void{
        trace("7777");
    }
    
    /**
     * The spacing between each item in pixels. Spacing can be set to a negative value to overlap items.
     */
    [Inspectable(defaultValue="0")]
    public function get spacing():Number {
        return _spacing;
    }
    
    public function set spacing(value:Number):void {
        _spacing = value;
        
    }
    
    /**
     * The direction the buttons draw. When the direction is set to "horizontal", the buttons will draw on the same y-coordinate, with the spaceing between each instance.  When the direction is set to "vertical", the buttons will draw with the same x-coordinate, with the spacing between each instance.
     * @see #spacing
     */
    [Inspectable(defaultValue="horizontal99", type="list", enumeration="horizontal99,vertical88")]
    public function get direction():String {
        return _direction;
    }
    
    public function set direction(value:String):void {
        _direction = value;
        
    }
    
    /**
     * Determines if the buttons auto-size to fit their label. This parameter will only be applied if the itemRenderer supports it.
     */
    [Inspectable(type="String", enumeration="none,left,center,right", defaultValue="none")]
    public function get autoSize():String {
        return _autoSize;
    }
    
    public function set autoSize(value:String):void {
        if (_autoSize == value) {
            return;
        }
//            Cc.green2cw(this, "name:", name, DebugUtils.set("set autoSize", _autoSize, value));
        _autoSize = value;
        for (var i:Number = 0; i < _renderers.length; i++) {
            (_renderers[i] as _itemRendererClass).autoSize = _autoSize;
        }
        
    }
    
    /**
     * The width of each button.  s the {@code autoSize} property when set.  Set to 0 to let the component auto-size.
     */
    [Inspectable(defaultValue="0")]
    public function get buttonWidth():Number {
        return _buttonWidth;
    }
    
    public function set buttonWidth(value:Number):void {
//            Cc.yellowcw(this, "name:", name, DebugUtils.set("set buttonWidth", _buttonWidth, value));
        _buttonWidth = value;
        
    }

    [Inspectable(defaultValue="false")]
    public function get enableInitCallback():Boolean {
        return _enableInitCallback;
    }

    public function set enableInitCallback(value:Boolean):void {
        if (value == _enableInitCallback) {
            return;
        }
        _enableInitCallback = value;
    }

    /**
     * Show or hide the component. Allows the {@code _visible} property to be overridden, and
     * dispatch a "show" or "hide" event.
     */
    [Inspectable(defaultValue="true")]
    override public function get visible():Boolean {
        return super.visible;
    }
    
    override public function set visible(value:Boolean):void {
        
        super.visible = value;
        
    }
    

    /**
     * Enable/disable focus management for the component. Setting the focusable property to
     * false will remove support for tab key, direction key and mouse
     * button based focus changes.
     * @see focusable
     */
    [Inspectable(defaultValue="true")]
    public function get focusable():Boolean {
        return _focusable;
    }
    
    public function set focusable(value:Boolean):void {
        _focusable = value;
    }
    
    /**
     * The index of the item that is selected in a single-selection list.
     */
    public function get selectedIndex():int {
        return _selectedIndex;
    }
    
    public function set selectedIndex(value:int):void {
        if (value == _selectedIndex) {
            return;
        }
        var oldSelectedIndex:int = _selectedIndex;
        
        var renderer:Button = _renderers[oldSelectedIndex] as Button;
        if (renderer) {
            renderer.selected = false;
        }
        
        _selectedIndex = value;
        
        renderer = _renderers[_selectedIndex] as Button;
        if (renderer) {
            renderer.selected = true;
        }
        
    }
    
    /**
     * The name of the field in the {@code dataProvider} model to be displayed as the label for itemRenderers.  A labelFunction will be used over a labelField if it is defined.
     */
    public function get labelField():String {
        return _labelField;
    }
    
    public function set labelField(value:String):void {
        _labelField = value;
        
    }
    
    /**
     * The function used to determine the label for itemRenderers. A labelFunction will  a labelField if it is defined.
     */
    public function get labelFunction():Function {
        return _labelFunction;
    }
    
    
    /**
     * Convert an item to a label string using the labelField and labelFunction. If the item is not an object, then it will be converted to a string, and returned.
     * @param item The item to convert to a label.
     * @returns The converted label string.
     * @see #labelField
     * @see #labelFunction
     */
    public function itemToLabel(item:Object):String {
        if (item == null) {
            return "";
        }
        if (_labelFunction != null) {
            return _labelFunction(item);
        } else if (item is String) {
            return item as String;
        } else if (_labelField != null && item[_labelField] != null) {
            return item[_labelField];
        }
        return item.toString();
    }
    
    /** Retrieve a reference to one of the ButtonBar's Buttons. */
    public function getButtonAt(index:int):Button {
        if (index >= 0 && index < _renderers.length) {
            return _renderers[index];
        } else {
            return null;
        }
    }
            

}
}
