package {

import com.junkbyte.console.Cc;

import flash.display.MovieClip;
import flash.events.Event;

public class List extends MovieClip{
    // The current selectedIndex being displayed.
    protected var _selectedIndex:int = -1;
    // The latest internal selectedIndex. Will be pushed to _selectedIndex next time updateSelectedIndex() is called.
    protected var _newSelectedIndex:int = -1;
    //	Можно ли заселекчивать элементы списка
    protected var _isSelectable:Boolean = true;
    //	можно ли отселектить ранее заселекченый элемент списка повторным кликом на нем
    protected var _isDeSelectable:Boolean = false;
    // The current selectedItem being displayed.
    protected var _selectedItem:Object;
    protected var _focusable:Boolean = true;
    private var _margin:Number;
    private var _padding:Object;
    private var _backgroundClassName:String;
    private var _itemRendererName:String;
    private var interesting:Boolean = true;
    private var _minHeight:int;
    
    public function List() {
//        Cc.start(this);
//        Cc.visible = true;
        
        trace("List.constructor _itemRendererName:", _itemRendererName, "_isSelectable", _isSelectable);
        itemRendererName = "changedFromConstructor";
        addEventListener(Event.EXIT_FRAME, exitFrame);
        addEventListener(Event.ADDED_TO_STAGE, addedToStage);
        addEventListener(Event.ENTER_FRAME, enterFrame);
        addEventListener(Event.INIT, init);
    }
    
    private function init(event:Event):void {
        trace("inside.init",itemRendererName);
        removeEventListener(Event.INIT, init);
    }
    
    private function enterFrame(event:Event):void {
        trace("inside.enterFrame",itemRendererName);
        removeEventListener(Event.ENTER_FRAME, enterFrame);
    }
    
    private function addedToStage(event:Event):void {
        trace("inside.addedToStage",itemRendererName);
        removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
    }
    
    private function exitFrame(event:Event):void {
        trace("inside.exitFrame",itemRendererName);
        removeEventListener(Event.EXIT_FRAME, exitFrame);
    }
    
    [Inspectable(defaultValue="true")]
    public function get isSelectable():Boolean { return _isSelectable; }
    
    public function set isSelectable(value:Boolean):void {
        trace("isSelectable", value);
        _isSelectable = value;
    }
    
    [Inspectable(defaultValue="false")]
    public function get isDeSelectable():Boolean { return _isDeSelectable; }
    
    public function set isDeSelectable(value:Boolean):void {
        _isDeSelectable = value;
    }
    
    /**
     * Enable/disable focus management for the component. Setting the focusable property to
     * {@code focusable=false} will remove support for tab key, direction key and mouse
     * button based focus changes.
     */
    [Inspectable(defaultValue="true")]
    public function get focusable():Boolean { return _focusable; }
    
    public function set focusable(value:Boolean):void {
        _focusable = value;
    }
    
    /**
     *  The margin between the boundary of the list component and the list items created internally. This value has no effect if the rendererInstanceName property is set. This margin also affects the automatically generated scrollbar.
     */
    [Inspectable(defaultValue="0")]
    public function get margin():String { return _margin.toString(); }
    
    public function set margin(value:String):void {
        _margin = Number(value);
    }
    
    /**
     * Extra padding at the top, bottom, left, and right for the list items. Does not affect the automatically generated scrollbar.
     */
    public function get padding():Object { return _padding; }
    
    [Inspectable(name="padding", defaultValue="top:0,right:0,bottom:0,left:0")]
    public function set padding(value:Object):void {
        _padding = value;
    }
    
    [Inspectable(name="backgroundClass", defaultValue="")]
    public function get backgroundName():String { return _backgroundClassName; }
    
    public function set backgroundName(value:String):void {
        _backgroundClassName = value;
    }
    
    /**
     * The linkage ID for the renderer used to display each item in the  The list components only support
     * a single itemRenderer for all items.
     */
    [Inspectable(name="itemRenderer", defaultValue="DefaultListItemRenderer")]
    public function get itemRendererName():String {
        if (interesting) Cc.grass2cw(this, "get itemRendererName", _itemRendererName);
        return _itemRendererName;
    }
    
    public function set itemRendererName(value:String):void {
        trace("itemRendererName", value);
        /*if (interesting) */Cc.grass2cw(this, "set itemRendererName", _itemRendererName, ">", value);
        _itemRendererName = value;
    }
    
    [Inspectable(defaultValue="0")]
    public function get minHeight():int { return _minHeight; }
    
    public function set minHeight(value:int):void {
        _minHeight = value;
    }
    
    [Inspectable(defaultValue="false")]
    public var keepSize:Boolean = false;
    private var _enableInitCallback:Boolean;
    
    /**
     * Enables or disables the component. Disabled components should not receive mouse, keyboard, or any
     * other kind of focus or interaction.
     */
    [Inspectable(defaultValue="true")]
    override public function get enabled():Boolean {
        return super.enabled;
    }
    
    override public function set enabled(value:Boolean):void {
        if (value == super.enabled) {
            return;
        }
        
        super.enabled = value;
        tabEnabled = (!enabled) ? false : _focusable;
        mouseEnabled = value;
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
}
}