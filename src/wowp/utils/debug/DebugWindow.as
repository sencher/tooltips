package wowp.utils.debug
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	import scaleform.clik.controls.Button;
	import scaleform.clik.controls.CheckBox;
	import scaleform.clik.controls.DropdownMenu;
	import scaleform.clik.controls.Label;
	import scaleform.clik.controls.ScrollBar;
	import scaleform.clik.controls.Slider;
	import scaleform.clik.controls.TextInput;
	import scaleform.clik.controls.Window;
	import scaleform.clik.data.DataProvider;
	import scaleform.clik.events.ButtonEvent;
	import scaleform.clik.events.ListEvent;
	import scaleform.clik.events.SliderEvent;
	import scaleform.clik.utils.Constraints;
	import scaleform.clik.utils.Padding;
	import wowp.utils.domain.getDefinition;

	public class DebugWindow extends Window
	{
		private var _vos:Dictionary = new Dictionary();

		public var btnMaximize:Button;
		public var mcSlider:ScrollBar;
		public var mcContent:Sprite;
		public var mcSize:Sprite;
		public var mcBackground:Sprite;
		public var mcCloseSepar:Sprite;

		private var _layout:Array;
		private var _mcControls:Sprite;

		protected const margin:int = 6;

		public function DebugWindow()
		{
			if (stage)
			{
				addedToStageHandler(null);
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			}
		}

		private function addedToStageHandler(e:Event):void
		{
			visible = false;

			addEventListener(MouseEvent.MOUSE_WHEEL, mouseScrollHandler, false, 0, true);

			ExternalInterface.addCallback("updateDebugMenu", setDebugMenu);
			ExternalInterface.addCallback("updateDebugMenuItem", updateDebugMenuItem);
			ExternalInterface.addCallback("closeDebugMenu", closeDebugMenu);

			//setTimeout(doStub, 1000);
			//setTimeout(doStub2, 10000);
		}

		private function closeDebugMenu():void
		{
			onCloseButtonClick(null);
		}

		private function doStub():void
		{
			var stub:Array = [];
			var id:int = 0;
			stub[stub.length] = { elementType:"slider", caption:"wwwwwwwwwwwwwww!", initParams:{value:35, min:0, max:100}, elementId:id++ };
			stub[stub.length] = { elementType:"label", caption:"Заголовок 1 фывафыва фыва фыв ауцк " };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"newline"};
			stub[stub.length] = { elementType:"textbox", caption:"Text\nBox\n!", elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"slider", initParams:{value:35, min:0, max:100}, elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"checkbox", caption:"asdasdfgsdgsdfgdfdasdas", elementId:id++, initParams:false };
			stub[stub.length] = { elementType:"dropdown", initParams: {
				dataProvider:[
					"asdas", "adasdasdas", "wasisdas"
				], selectedIndex:2 }, elementId:id++ };
			stub[stub.length] = { elementType:"label", caption:"Заголовок 2"};
			stub[stub.length] = { elementType:"input", caption:"input", elementId:id++ };
			stub[stub.length] = { elementType:"newline" };
			stub[stub.length] = { elementType:"newline" };
			stub[stub.length] = { elementType:"newline" };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };

			setDebugMenu(stub);
		}

		private function doStub2():void
		{
			var stub:Array = [];
			var id:int = 0;
			stub[stub.length] = { elementType:"slider", caption:"slider2222" , initParams:{value:35, min:0, max:100}, elementId:id++ };
			stub[stub.length] = { elementType:"label", caption:"Заголовок 1"};
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"textBox", caption:"Text\nBox\n!", elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			stub[stub.length] = { elementType:"button", caption:int(1000 * Math.random()).toString(), elementId:id++ };
			setDebugMenu(stub);
		}

		override protected function onResizeMouseMove(e:Event):void
		{
			var w:Number = Math.max(minWidth, Math.min(maxWidth, parent.mouseX - x - _dragProps[0]));
			var h:Number = Math.max(minHeight, Math.min(maxHeight, parent.mouseY - y - _dragProps[1]));

			constraints.update(w, h);
			invalidate();
		}

		override protected function onResizeStartDrag(e:Event):void
		{
			super.onResizeStartDrag(e);
			_dragProps = [parent.mouseX - (x + mcBackground.width), parent.mouseY - (y + mcBackground.height)];
		}

		override protected function configUI():void
		{
			_title = "Debug window";
			maximize();
		}

		override protected function draw():void
		{
			if (mcSlider && _mcControls)
			{
				_mcControls.scrollRect = null;
				mcSlider.visible = mcSize.height < _mcControls.height;
				if (mcSlider.visible)
				{
					mcSlider.setScrollProperties(mcSize.height, 0, _mcControls.height - mcSize.height);
				}
				else
				{
					_mcControls.y = 0;
				}
				updateScrollRect();
			}
		}

		protected function minimize():void
		{
			return;

			constraints.removeElement("mcSlider");
			constraints.removeElement("resizeBtn");
			constraints.removeElement("mcBackground");
			constraints.removeElement("_mcMask");

			clearContent();
			removeInnerListeners();
			gotoAndPlay("minimized");
			stateChangedHandler();
		}

		protected function maximize():void
		{
			removeInnerListeners();
			gotoAndStop("maximized");
			stateChangedHandler();
		}

		protected function stateChangedHandler():void
		{
//			if (btnMinimize)
//			{
//				btnMinimize.addEventListener(ButtonEvent.PRESS, minimizeHandler, false, 0, true);
//			}

			if (btnMaximize)
			{
				btnMaximize.addEventListener(ButtonEvent.PRESS, maximizeHandler, false, 0, true);
			}

			if (mcSlider)
			{
				mcSlider.addEventListener(Event.SCROLL, updateScrollRect, false, 0, true);
				constraints.addElement("mcSlider", mcSlider, Constraints.BOTTOM | Constraints.TOP | Constraints.RIGHT);
			}
			if (mcSize != null) { constraints.addElement("mcSize", mcSize, Constraints.ALL); }
			if (mcBackground != null) { constraints.addElement("mcBackground", mcBackground, Constraints.ALL); }

			if (titleBtn != null) {
				titleBtn.label = _title || "My Window";
				titleBtn.addEventListener(MouseEvent.MOUSE_DOWN, onWindowStartDrag, false, 0, true);
				constraints.addElement("titleBtn", titleBtn, Constraints.TOP | Constraints.LEFT | Constraints.RIGHT);
			}
			if (closeBtn != null) {
				closeBtn.addEventListener(MouseEvent.CLICK, onCloseButtonClick, false, 0, true);
				constraints.addElement("closeBtn", closeBtn, Constraints.TOP | Constraints.RIGHT);
			}
			if (resizeBtn != null) {
				constraints.addElement("resizeBtn", resizeBtn, Constraints.BOTTOM | Constraints.RIGHT);
				resizeBtn.addEventListener(MouseEvent.MOUSE_DOWN, onResizeStartDrag, false, 0, true);
			}
			if (mcCloseSepar != null) {
				constraints.addElement("mcCloseSepar", mcCloseSepar, Constraints.TOP | Constraints.RIGHT);
			}
			//	draw layout
			drawLayout();
		}

		private function clearContent():void
		{
			if (_mcControls)
			{
				while (_mcControls.numChildren > 0)
				{
					var dobj:DisplayObject = _mcControls.removeChildAt(0);
					dobj.removeEventListener(ButtonEvent.CLICK, buttonHandler);
					dobj.removeEventListener(SliderEvent.VALUE_CHANGE, sliderHandler);
					dobj.removeEventListener(ListEvent.INDEX_CHANGE, dropdownHandler);
					dobj.removeEventListener(KeyboardEvent.KEY_DOWN, inputHandler);
					dobj.removeEventListener(Event.SELECT, checkBoxChangeHandler);
				}

				if (_mcControls.parent)
				{
					_mcControls.parent.removeChild(_mcControls);
				}
			}
		}

		protected function drawLayout():void
		{
			if (mcContent && _layout)
			{
				//	перед отрисовкой компонентов удаляем старые
				clearContent();

				stage.focus = null;

				_mcControls = new Sprite();
				mcContent.addChild(_mcControls);

//				_mcControls.mask = _mcMask;
//				_mcControls.y = -mcSlider.position;
				updateScrollRect();

				var i:int = 0;
				var len:int = _layout.length;

				var layoutArray:Array = [];	//	массив , где каждый элемент - это строка (тоже массив элементов)
				var currentLine:Array = [];	//	текущая строка

				for (i; i < len; ++i)
				{
					var obj:Object = _layout[i];
					if (isLineBreak(obj))
					{
						layoutArray.push(currentLine);
						currentLine = [];
					}
					else
					{
						var c:Object = createElement(obj);
						if (c is Array)
						{
							currentLine = currentLine.concat(c as Array);
						}
						else
						{
							currentLine.push(c);
						}
						
					}

				}

				if (currentLine.length != 0)
				{
					layoutArray.push(currentLine);
					currentLine = [];
				}
				//	расскладываем элементы
				placeElements(layoutArray);

				invalidate();
			}
		}

		/**
		 * выкладывает на экране элементы с учетом столбцов и строк
		 * @param	arr 	- лейаут
		 */
		private function placeElements(arr:Array):void
		{
			var i:int = 0;
			var colums:int = getColumns(arr);
			var xCounter:Number = 0;
			var yCounter:Number = 0;
			for each(var line:Array in arr)
			{
				var maxHeight:Number = 25;
				xCounter = 0;
				// line - это массив контролов, которые образуют линию в лейауте
				for (i = 0; i < colums; ++i)
				{
					var d:DisplayObject = line[i] as DisplayObject;
					if (d)
					{
						d.x = xCounter;
						d.y = yCounter;
						if (d is DropdownMenu) d.x -= 11;
						xCounter += getColumnWidth(arr, i) + margin;
						
						if (d.height > maxHeight) maxHeight = d.height;
					}
				}
				
				yCounter += maxHeight + margin;
			}
		}
		
		/**
		 * возвращает количество столбцов
		 * @param	arr
		 * @return
		 */
		private function getColumns(arr:Array):int
		{
			var c:int = 0;
			for each(var line:Array in arr)
			{
				if (line.length > c) c = line.length;
			}
			return c;
		}
		
		/**
		 * возвращяет максимальную ширину элемента в столбце
		 * @param	arr			- лейаут
		 * @param	column		- номер столбца 
		 * @return
		 */
		private function getColumnWidth(arr:Array, column:Number):Number
		{
			var w:Number = 0;
			for each(var line:Array in arr)
			{
				if (line.length > 1)
				{
					var d:DisplayObject = line[column] as DisplayObject;
					if (d && d.width > w) w = d.width;
				}
			}
			return w;
		}
		
		//	создает и ложит контрол на лейаут
		private function createElement(data:Object):Object
		{
			var control:DisplayObject = createControl(data);
			if (control)
			{
				_mcControls.addChild(control);
				if (data.caption)		//	если есть кепшн
				{
					//	и контрол один из перечисленных юай элементов
					if (control is DropdownMenu || control is TextInput || control is Slider)
					{
						//	то справа добавляем текстфилд с кепшном
						var tfc:TextField = (createMovie("comLabelLeftBorder") as Label).textField;
						tfc.htmlText =  data.caption.toString();
						tfc.autoSize = TextFieldAutoSize.LEFT;
						_mcControls.addChild(tfc);
						return [tfc, control];
					}
				}
			}
			return control;
		}
		
		//
		//	Event handlers
		//
		protected function mouseScrollHandler(e:MouseEvent):void
		{
			mcSlider.position -= e.delta * 10;
		}

		protected function updateScrollRect(e:Event=null):void
		{
			_mcControls.scrollRect = new Rectangle(0, mcSlider.position, mcSize.width, mcSize.height);
		}

		override protected function onCloseButtonClick(e:MouseEvent):void
		{
			close();
			visible = false;
            stage.dispatchEvent(new Event("WINDOWS_MANAGER_TURN_ON_FOCUS_HANDLING", true));
		}

		protected function minimizeHandler(e:Event):void
		{
			minimize();
		}

		protected function maximizeHandler(e:Event):void
		{
			maximize();
		}

		private function removeInnerListeners():void
		{
			stage.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
		}

		//	заполнение 
		protected function setDebugMenu(array:Array):void
		{
			removeInnerListeners();
			visible = true;
			_layout = array;
			drawLayout();
			mcSlider.position = 0;
            stage.dispatchEvent(new Event("WINDOWS_MANAGER_TURN_OFF_FOCUS_HANDLING", true));
		}

		//	апдейт какого-то компонента
		protected function updateDebugMenuItem(vo:Object):void
		{
			removeInnerListeners();
			if (_layout)
			{
				for (var i:int = 0; i < _layout.length; ++i)
				{
					if (_layout[i].elementId == vo.elementId)
					{
						_layout[i] = vo;
						drawLayout();
						return;
					}
				}
			}
			else
			{
				_layout = [];
			}
			//	если не найшли элемента с указанным elementId то просто добавляем новый контрол в конец
			_layout[_layout.length] = vo;
		}

		protected function isLineBreak(data:Object):Boolean
		{
			return data.elementType == "newline";
		}
		
		protected function createControl(vo:Object):DisplayObject
		{
			switch(vo.elementType)
			{
				case "button":
					var btn:Button = createMovie("comBtnSmall") as Button;
					_vos[btn] = vo;
					setElementSize(btn, vo.width);
					btn.label = vo.caption;
					btn.addEventListener(ButtonEvent.CLICK, buttonHandler);
					btn.validateNow();
					return btn;
				case "label":
					var lbl:Label = createMovie("comLabelLeftBorder") as Label;
					_vos[lbl] = vo;
					setElementSize(lbl, vo.width);
					lbl.htmlText = vo.caption;
					lbl.validateNow();
					return lbl;
				case "textbox":
					var tBox:TextField = new TextField();
					_vos[tBox] = vo;
					tBox.text = vo.initParams;
					setElementSize(tBox, vo.width);
					var tfm:TextFormat = tBox.getTextFormat();
					tfm.font = "$ZurichCond";
					tfm.size = 14;
					tfm.color = 0xFFFFFF;
					tBox.setTextFormat(tfm);
					return tBox;
				case "slider":
					var slider:Slider = createMovie("comSliderEx") as Slider;
					_vos[slider] = vo;
					slider.minimum = vo.initParams.min;
					slider.maximum = vo.initParams.max;
					slider.value = vo.initParams.value;
					slider.addEventListener(SliderEvent.VALUE_CHANGE, sliderHandler);
					setElementSize(slider, vo.width);
					var tf:TextField = (createMovie("comLabelLeftBorder") as Label).textField;
					tf.x = slider.width;
					tf.text = vo.initParams.value;
					slider.addChild(tf);
					slider.validateNow();
					return slider;
				case "dropdown":
					var dm:DropdownMenu = createMovie("comDropdown") as DropdownMenu;
					_vos[dm] = vo;
					dm.scrollBar = "comScrollBar";
					dm.dropdown = "comScrollingListDropdown";
					dm.itemRenderer = "comListItemRendererDropdown";
					dm.menuPadding = new Padding(0,12,18,11);
					dm.menuRowCount = 15;
					dm.thumbOffsetTop = 0;
					dm.thumbOffsetBottom = 0;
					dm.dataProvider = new DataProvider(vo.initParams.dataProvider);
					dm.selectedIndex = vo.initParams.selectedIndex;
					dm.addEventListener(ListEvent.INDEX_CHANGE, dropdownHandler);
					setElementSize(dm, vo.width);
					dm.width += 22;
					dm.validateNow();
					return dm;
				case "input":
					var input:TextInput = createMovie("comTextInput") as TextInput;
					_vos[input] = vo;
					input.text = vo.initParams;
					input.addEventListener(FocusEvent.FOCUS_OUT, inputHandler);
					setElementSize(input, vo.width);
					input.validateNow();
					return input;
				case "checkbox":
					var chBox:CheckBox = createMovie("comCheckBox") as CheckBox;
					_vos[chBox] = vo;
					setElementSize(chBox, vo.width);
					chBox.label = vo.caption;
					chBox.selected = vo.initParams;
					chBox.addEventListener(Event.SELECT, checkBoxChangeHandler);
					chBox.invalidateData();
					return chBox;
				default:
					trace("DebugWindow: can't find controll " + vo.elementType);
					break;
			}
			return null;
		}

		private function setElementSize(d:DisplayObject, width:Number):void
		{
			if (!isNaN(width))
			{
				if (width == -1)
				{
					if (d.hasOwnProperty("autoSize"))
					{
						d["autoSize"] = TextFieldAutoSize.LEFT;
					}
				}
				else
				{
					d.width = width * 1.5;
				}
			}
		}
		
		private function inputHandler(e:FocusEvent):void
		{
			e.stopImmediatePropagation();
			var vo:Object = _vos[e.currentTarget];
			vo.initParams = e.currentTarget.text;
			reportAction( {elementId:vo.elementId, text:e.currentTarget.text } );
		}

		private function buttonHandler(e:Event):void
		{
			var vo:Object = _vos[e.currentTarget];
			reportAction({elementId:vo.elementId});
		}

		private function sliderHandler(e:SliderEvent):void
		{
			var vo:Object = _vos[e.currentTarget];
			(e.currentTarget as DisplayObjectContainer).getChildByName("textField")["text"] = e.currentTarget.value;
			vo.initParams.value = e.currentTarget.value;
			reportAction( { elementId:_vos[e.currentTarget].elementId, value:e.value} );
		}

		private function dropdownHandler(e:ListEvent):void
		{
			var vo:Object = _vos[e.currentTarget];
			vo.initParams.selectedIndex = e.index;
			reportAction({ elementId:vo.elementId, selectedIndex:e.index } );
		}

		private function checkBoxChangeHandler(e:Event):void
		{
			var vo:Object = _vos[e.currentTarget];
			reportAction({ elementId:vo.elementId, selected:e.target.selected } );
		}

		protected function createMovie(className:String):Object
		{
			return new (getDefinition(className, loaderInfo))();
		}

		//	отсылка результата в бекенд
		protected function reportAction(response:Object):void
		{
			setTimeout(ExternalInterface.call, 1,"debugMenuEvent", response);
		}

		private function close():void
		{
			ExternalInterface.call("Debug.destroy");
		}
	}

}