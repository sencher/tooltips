
package {


import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.utils.Timer;

[Event(name="SHOW", type="scaleform.clik.events.ComponentEvent")]
[Event(name="HIDE", type="scaleform.clik.events.ComponentEvent")]
[Event(name="FOCUS_IN", type="scaleform.clik.events.FocusHandlerEvent")]
[Event(name="FOCUS_OUT", type="scaleform.clik.events.FocusHandlerEvent")]
[Event(name="SELECT", type="flash.events.Event")]
[Event(name="STATE_CHANGE", type="scaleform.clik.events.ComponentEvent")]
[Event(name="PRESS", type="scaleform.clik.events.ButtonEvent")]
[Event(name="CLICK", type="scaleform.clik.events.ButtonEvent")]
[Event(name="DRAG_OVER", type="scaleform.clik.events.ButtonEvent")]
[Event(name="DRAG_OUT", type="scaleform.clik.events.ButtonEvent")]
[Event(name="RELEASE_OUTSIDE", type="scaleform.clik.events.ButtonEvent")]

public class Button extends MovieClip {
    public static const SELECTED:String = "selected";
    public static const SELECTED_:String = "selected_";
    public static const DISABLED:String = "disabled";
    public static const DISABLED_:String = "disabled_";
    public static const ENABLED:String = "enabled";
    public static const EMPTY:String = "";
    
    public static const UP:String = "up";
    public static const DOWN:String = "down";
    public static const LEFT:String = "left";
    public static const RIGHT:String = "right";
    public static const OVER:String = "over";
    public static const HOVER:String = "hover";
    public static const OUT:String = "out";
    public static const DEFAULT:String = "default";
    public static const FOCUSED:String = "focused";
    public static const SELECTING:String = "selecting";
    public static const TOGGLE:String = "toggle";
    public static const RELEASE:String = "release";
    public static const KB_RELEASE:String = "kb_release";
    public static const KB_SELECTING:String = "kb_selecting";
    public static const KB_DOWN:String = "kb_down";
    
    // Public Properties:
    /** Locks drag over and drag out state changes. Useful for scrollbar and slider thumbs. */
    public var lockDragStateChange:Boolean = false;
    /** The delay (milliseconds) before the initial repeat event is fired. */
    public var repeatDelay:Number = 500;
    /** The delay (milliseconds) between subsequent repeat events. */
    public var repeatInterval:Number = 200;
    /** True if constraints are disabled for the component. Setting the disableConstraints property to true will remove constraints from the textfield. This is useful for components with timeline based textfield size tweens, since constraints break them due to a Flash quirk. */
    public var constraintsDisabled:Boolean = false;
    /** True if the Button can be deselected when already selected and clicked again. False for RadioButtons by default.*/
    public var allowDeselect:Boolean = true;
    /** True if the Button should not autosize itself when the state changes. False otherwise-- by default. Note that the autoSize property will not work if preventAutosizing is set to true. */
    public var preventAutosizing:Boolean = false;
    
    // Protected Properties:
    /** @private */
    protected var _toggle:Boolean = false;
    /** @private */
    protected var _label:String;
    /** @private */
    protected var _state:String;
    /** @private */
    protected var _groupName:String;
    /** @private */
    protected var _selected:Boolean = false;
    /** @private */
    protected var _data:Object;
    /** @private */
    protected var _autoRepeat:Boolean = false;
    /** @private */
    protected var _autoSize:String = TextFieldAutoSize.NONE;
    /** @private */
    protected var _pressedByKeyboard:Boolean = false;
    /** @private */
    protected var _isRepeating:Boolean = false;

    /** A list of frames that apply to a given state. The frames will be called in order, and the last existing frame will be displayed. @private */
    protected var _stateMap:Object = {
        up: [UP],
        over: [OVER],
        down: [DOWN],
        release: [RELEASE, OVER],
        out: [OUT, UP],
        disabled: [DISABLED],
        selecting: [SELECTING, OVER],
        toggle: [TOGGLE, UP],
        kb_selecting: [KB_SELECTING, UP],
        kb_release: [KB_RELEASE, OUT, UP],
        kb_down: [KB_DOWN, DOWN]
    }
    protected var _currentFrame:String;
    protected var _newFrame:String;
    protected var _newFocusIndicatorFrame:String;
    protected var _repeatTimer:Timer;
    protected var _mouseDown:int = 0; // Determines if the mouse is in a press for each controller.
    protected var _focusIndicatorLabelHash:Object;
    protected var _autoRepeatEvent:Event;
    
    // UI Elements:
    /** A reference to the textField in the component.  The textField is an optional element. Note that when state changes are made, the textField instance may change, so changes made to it externally may be lost. */
    public var textField:TextField;
    public var defaultTextFormat:TextFormat;
    
    /** @private */
    protected var _focusIndicator:MovieClip;
    
    // Initialization:
    public function Button() {
        super();
        buttonMode = true;
    }
    
    // Public getter / setters:
    /** Data related to the button. This property is particularly helpful when using butons in a ButtonGroup. */
    [Inspectable(type="string", defaultValue="")]
    public function get data():Object {
        return _data;
    }
    
    public function set data(value:Object):void {


        _data = value;
    }
    
    /** Determines if the button dispatches "click" events when pressed down and held. */
    [Inspectable(defaultValue="false")]
    public function get autoRepeat():Boolean {
        return _autoRepeat;
    }
    
    public function set autoRepeat(value:Boolean):void {
        _autoRepeat = value;
    }
    
    /**
     * Enable/disable this component. Focus (along with keyboard events) and mouse events will be suppressed if disabled.
     */
    [Inspectable(defaultValue="true")]
    override public function get enabled():Boolean {
        return super.enabled;
    }
    
    override  public function set enabled(value:Boolean):void {
        super.enabled = value;
        mouseChildren = false; // Keep mouseChildren false for Button and its subclasses.
        
        var state:String;
        if (super.enabled) {
            
        } else {
            state = DISABLED;
        }
        setState(state);
    }

    
    /** A button with a toggle value of true will change its selected state when the button is "clicked". */
    [Inspectable(defaultValue="false")]
    public function get toggle():Boolean {
        return _toggle;
    }
    
    public function set toggle(value:Boolean):void {
        _toggle = value;
    }
    
    
    /** Retrieve the current state of the Button. */
    public function get state():String {
        return _state;
    }
    
    /**
     * Set the selected state of the Button. Buttons can have two sets of mouse states, a selected and unselected.
     * When a Button's toggle property is true the selected state will be changed when the button
     * is clicked, however the selected state can be set using ActionScript even if the toggle property is false.
     */
    [Inspectable(defaultValue="false")]
    public function get selected():Boolean {
        return _selected;
    }
    
    public function set selected(value:Boolean):void {

        if (_selected == value) {
            return;
        }
        _selected = value;
        
        //#state This will do a change in state.
        //  1. If the component is not focused, and the selected property is changed via code, it will do a hard frame change unless it is part of a button group.
        //  2. If the component was pressed with the mouse, and is changing its selected state (toggle), it plays the "switch" animation.
        //  2b. If the component was pressed with the keyboard, but has no focusMovie, the "switch" animation plays.
        //  3. If the component was pressed with the keyboard (and is focused), it plays the kb_switch animation.
        //  4. EDGE CASE The component will not be able to be do a up->focused_selected_up when a focused clip changes its selected state via code.
        if (enabled) {
  
        } else {
            setState(DISABLED);
        }
        
       
        
        // The event is dispatched after the frame change so that listening objects can  the behavior.
        dispatchEvent(new Event(Event.SELECT));
    }

    protected function setState(state:String):void {

    }
    
    /**
     * The ActionScript-only label parameter that sets the text directly, and assumes localization
     * has been handled externally.
     */
    [Inspectable(defaultValue="")]
    public function get label():String {
        return _label;
    }
    
    public function set label(value:String):void {
        if (_label == value) {
            return;
        }

        _label = value;
        
    }
    
    /**
     * Determines if the button will scale to fit the text that it contains. Setting the autoSize
     * property to TextFieldAutoSize.NONE ("none") will leave its current size unchanged.
     */
    [Inspectable(defaultValue="none", enumeration="none,left,right,center")]
    public function get autoSize():String {
        return _autoSize;
    }
    
    public function set autoSize(value:String):void {
        if (_autoSize == value) {
            return;
        }

        _autoSize = value;
        
    }
    

}
}