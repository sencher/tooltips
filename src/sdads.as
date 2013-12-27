package skins.energy {
    import caurina.transitions.Tweener;

    import common.I18nHelper;
    import common.item.SharedConfig;
    import common.managers.SoundManager;
    import common.ui.lib.PopupText;

    import energy.Te;
    import energy.managers.AnimationSettings;
    import energy.managers.SettingsManager;
    import energy.managers.tool.EnergyToolManager;
    import energy.ui.ShopWindow;
    import energy.ui.controls.EnergyButton;
    import energy.ui.panel.Inventory;
    import energy.ui.utils.SkinWrapper;

    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    import utils.EnergyButton;

    import utils.FilterHelper;
    import utils.GuiHelper;
    import utils.Hash;

    public class EnergyGuiBottom extends MovieClip {

        private static const TOOLS_DROP_DOWN_PANEL_TOP:int = -186;
        private static const STUFF_DROP_DOWN_PANEL_TOP:int = -73;
        private static const SETTINGS_DROP_DOWN_PANEL_TOP:int = -148;
        private static const PANELS_HIDE_Y:int = 44;

        //Hint names
        private const DELETE:String = "delete";
        private const PLACE:String = "place";
        private const ROTATE:String = "turn";
        private const MOVE:String = "move";
        private const BARN:String = "barn";
        private const SILO:String = "storage";
        private const ANIMATION:String = "animation";
        private const FULL_SCREEN:String = "fullscreen";
        private const SOUND:String = "sound";
        private const MUSIC:String = "music";
        private const ENLARGE:String = "enlarge";
        private const REDUCE:String = "reduce";
        private const SETTINGS:String = "settings";

        private var _container:DisplayObjectContainer;
        private var _settingsPanelEnabled:Boolean = false;
        private var _currentUserMode:Boolean; // true - player`s field, false - neighborhood
        private var _barnSize:int; // to show notification, when barn size changed

//        // TODO: pretend to be deprecated with new tutorial
//        private var _tutorialTimer:Timer = new Timer(15000 * 2, 1);
//        private var _tutorialTimerCb:Function;
//
//        private var _tutorialMessagerClickCb:Function;
        // END pretend to be deprecated with new tutorial

        public function init():void {
            _container = new ContainerClass();
            addChild(_container);

            GuiHelper.blank_text_fields(this);

            I18nHelper.set_font_for_display_object(this);
//            initFriendsPanel();
            initControlsPanel();
            initSettingsPanel();

            setup_button(goHomeButton, goHomeButton_clickHandler);

            GuiHelper.hide_i18n(this);

//            hide_tutorial();
//            _tutorialTimer.addEventListener(TimerEvent.TIMER, hide_tutorial);

            Config.model.barn.addEventListener(Event.CHANGE, onBarnChanged, false, 0, true);
            hideAllHints();
        }

        // tools, stuff and shed buttons, their drop-downs
        private function initControlsPanel():void{
            stuffDropDownPanel.visible = toolsDropDownPanel.visible = false;

            setup_button(multiToolButton, multiToolButton_clickHandler);
            EnergyButton.setSound(multiToolButton, MouseEvent.CLICK, DROPDOWN_SOUND);
//            setup_button(multiToolButton, multiToolButton_clickHandler);
//            init_button(multiToolButton, null, Te.multi_tool_hint);
            toolsDropDownIndy.gotoAndStop(1);

            setup_button(stuffButton, stuffButton_clickHandler);
            EnergyButton.setSound(stuffButton, MouseEvent.CLICK, DROPDOWN_SOUND);
//            setup_button(stuffButton, stuffButton_clickHandler);
//            init_button(stuffButton, null, Te.my_stuff);
            stuffDropDownIndy.gotoAndStop(1);


//            setup_button(sellToolButton);
//            init_button(sellToolButton, sellToolButton_clickHandler, null);
//            sellToolField.text = Te.sell_tool_hint;

            setup_button(deleteToolButton, deleteToolButton_clickHandler, DELETE, "Delete");
            setup_button(inventoryToolButton, inventoryToolButton_clickHandler, PLACE, "Place");
            setup_button(rotateToolButton, rotateToolButton_clickHandler, ROTATE, Te.rotate_tool_hint);
            setup_button(moveToolButton, moveToolButton_clickHandler, MOVE, Te.move_tool_hint);

            setup_button(barnStuffButton, barnStuffButton_clickHandler, BARN, Te.shed);
            setup_button(siloStuffButton, siloStuffButton_clickHandler, SILO, Te.silo);

            setup_button(shopButton, shopButton_clickHandler);
//            setup_button(shopButton, null, Te.shop, "text_button");
//            init_button(shopButton, shopButton_clickHandler, Te.shop);
        }

        private function hideAllHints():void {
            var hint:String;
            for each (hint in hints){
                showHint(hint, false);
            }
        }

        private var DROPDOWN_SOUND:String = "dropdown_app";
        private var hints:Hash = new Hash();

        // settings button and drop-down
        private function initSettingsPanel():void{
            settingsPanel.y = PANELS_HIDE_Y;
            settingsPanel.visible = false;

            setup_button(settingsButton, settingsButton_clickHandler, SETTINGS, Te.settings);
            EnergyButton.setSound(settingsButton, MouseEvent.CLICK, DROPDOWN_SOUND);

            setup_button(animationSettingsButton, animationSettingsButton_clickHandler, ANIMATION, Te.animation_settings);
            animationSettingsButton.gotoAndStop(AnimationSettings.enabled ? 1 : 3);
            // TODO: deprecate or fix condition
            if (!SharedConfig.disable_animation_feature) {
                animationSettingsButton.mouseEnabled = animationSettingsButton.mouseChildren = false;
                animationSettingsButton.filters = [FilterHelper.gray_filter];
            }

            setup_button(fullScreenSettingsButton, fullScreenSettingsButton_clickHandler, FULL_SCREEN, Te.full_screen_hint);
            if(Config.application_params.disable_full_screen){
                fullScreenSettingsButton.enabled = fullScreenSettingsButton.mouseEnabled = false;
                fullScreenSettingsButton.filters = [FilterHelper.gray_filter];
            }

            setup_button(musicSettingsButton, musicSettingsButton_clickHandler, MUSIC, Te.music);
            musicSettingsButton.gotoAndStop(SoundManager.instance.music_volume == 0 ? 3 : 1);

            setup_button(soundSettingsButton, soundSettingsButton_clickHandler, SOUND, Te.sound);
            soundSettingsButton.gotoAndStop(SoundManager.instance.sound_volume == 0 ? 3 : 1);

            setup_button(zoomInSettingsButton, zoomInSettingsButton_clickHandler, ENLARGE, Te.zoom_in_hint);

            setup_button(zoomOutSettingsButton, zoomOutSettingsButton_clickHandler, REDUCE, Te.zoom_out_hint);
        }

        private function onBarnChanged(e:Event):void {
            _barnSize = Config.scene.showDifferenceNotification(x + 380, y + 95, _barnSize, Config.model.barn.size());
        }

        // SWF INSTANCES

        private function setHintText(name:String, text:String):void
        {
            _container["info_"+name]["text_"+name].text = text;
        }

        private function showHint(name:String, value:Boolean = true):void
        {
            _container["info_"+name].visible = value;
        }

        // CONTROLS PANEL
        private function get controlsPanel():MovieClip{
            return _container["PanelControls"];
        }

        private function get multiToolButton():MovieClip{
            return _container["btn_cursor"];
        }

        private function get toolsDropDownPanel():MovieClip{
            return _container["not_move_1"];
        }

        private function get toolsDropDownIndy():MovieClip{
            return _container["controler_cursor"];
        }

        public function get goHomeButton():MovieClip {
            return _container["ButtonHome"];
        }

        // SETTINGS PANEL
        private function get settingsPanel():MovieClip{
            return _container["settings_panel"];
        }

        private function get settingsButton():MovieClip{
            return _container["btn_settings"];
        }


        public function get shopButton():MovieClip{
            return _container["btn_shop"];
        }


        public function get stuffButton():MovieClip{
            return _container["btn_storage"];
        }

        private function get stuffDropDownPanel():MovieClip{
            return _container["not_move_2"];
        }

        private function get stuffDropDownIndy():MovieClip{
            return _container["controler_storage"];
        }

        public function get background():MovieClip{
            return _container["background"];
        }
        // END SWF INSTANCES

//        private function get sellToolButton():MovieClip{
//            return toolsDropDownPanel.panel.icon_sell;
//        }

        private function get sellToolField():TextField{
            return toolsDropDownPanel.panel.text_sell;
        }

        private function get deleteToolButton():MovieClip{
            return toolsDropDownPanel.panel.icon_delete;
        }

        private function get inventoryToolButton():MovieClip{
            return toolsDropDownPanel.panel.icon_place;
        }

        private function get rotateToolButton():MovieClip{
            return toolsDropDownPanel.panel.icon_turn;
        }

        private function get rotateToolField():TextField{
            return toolsDropDownPanel.panel.text_turn;
        }

        private function get moveToolButton():MovieClip{
            return toolsDropDownPanel.panel.icon_move;
        }

        private function get moveToolField():TextField{
            return toolsDropDownPanel.panel.text_move;
        }

        private function get barnStuffButton():MovieClip{
            return stuffDropDownPanel.panel.icon_barn;
        }

        private function get barnStuffText():TextField{
            return stuffDropDownPanel.panel.text_barn;
        }

        private function get siloStuffButton():MovieClip{
            return stuffDropDownPanel.panel.icon_storage;
        }

        private function get siloStuffText():TextField{
            return stuffDropDownPanel.panel.text_storage;
        }
        // END CONTROLS PANEL

        private function get musicSettingsButton():MovieClip{
            return settingsPanel.btn_music;
        }

        private function get soundSettingsButton():MovieClip{
            return settingsPanel.btn_sound;
        }

        private function get fullScreenSettingsButton():MovieClip{
            return settingsPanel.btn_fullscrin;
        }

        private function get zoomInSettingsButton():MovieClip{
            return settingsPanel.btn_enlarge;
        }

        private function get zoomOutSettingsButton():MovieClip{
            return settingsPanel.btn_reduce;
        }

        private function get animationSettingsButton():MovieClip{
            return settingsPanel.btn_animation;
        }
        // END SETTINGS PANEL

        private function get ContainerClass():Class{
            return panel_down;
        }

        // HANDLERS
        private function multiToolButton_clickHandler(e:MouseEvent):void {
            if (!Config.is_player_user || toolsDropDownPanel.visible)
                return;

            toolsDropDownIndy.gotoAndStop(2);
            toolsDropDownPanel.visible = true;
            toolsDropDownPanel.alpha = 0;
            toolsDropDownPanel.y = PANELS_HIDE_Y;
            Tweener.addTween(toolsDropDownPanel, {alpha: 1, time: 0.2, transition: "linear"});
            Tweener.addTween(toolsDropDownPanel, {y: TOOLS_DROP_DOWN_PANEL_TOP, time: 0.8, transition: "easeOutBounce"});

            EnergyToolManager.deactivateTool();
        }

        private function stuffButton_clickHandler(e:MouseEvent):void {
            if (!Config.is_player_user || stuffDropDownPanel.visible)
                return;

            stuffDropDownIndy.gotoAndStop(2);
            stuffDropDownPanel.visible = true;
            stuffDropDownPanel.alpha = 0;
            stuffDropDownPanel.y = PANELS_HIDE_Y;
            Tweener.addTween(stuffDropDownPanel, {alpha: 1, time: 0.2, transition: "linear"});
            Tweener.addTween(stuffDropDownPanel, {y: STUFF_DROP_DOWN_PANEL_TOP, time: 0.8, transition: "easeOutBounce"});

            EnergyToolManager.deactivateTool();
        }

        private function shopButton_clickHandler(e:Event):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

            Config.windows.show(ShopWindow, null, true);

            EnergyToolManager.deactivateTool();
            e.stopImmediatePropagation();
        }

        private function sellToolButton_clickHandler(e:Event):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

            EnergyToolManager.activateTool(EnergyToolManager.TOOL_SELL);
            e.stopImmediatePropagation();
        }

        private function deleteToolButton_clickHandler(e:Event):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

//            EnergyToolManager.activateTool(EnergyToolManager.TOOL_ROTATE);
            e.stopImmediatePropagation();
        }

        private function inventoryToolButton_clickHandler(e:Event):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

//            EnergyToolManager.activateTool(EnergyToolManager.TOOL_ROTATE);
            e.stopImmediatePropagation();
        }

        private function rotateToolButton_clickHandler(e:Event):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

            EnergyToolManager.activateTool(EnergyToolManager.TOOL_ROTATE);
            e.stopImmediatePropagation();
        }

        private function moveToolButton_clickHandler(e:Event):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

            EnergyToolManager.activateTool(EnergyToolManager.TOOL_MOVE);
            e.stopImmediatePropagation();
        }


        // TODO: show silo or barn
        private function barnStuffButton_clickHandler(e:Event):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

            Config.scene.show_barn(Inventory.DEPARTMENT_BARN);

            e.stopImmediatePropagation();
        }

        private function siloStuffButton_clickHandler(e:Event):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

            Config.scene.show_barn(Inventory.DEPARTMENT_SILO);

            e.stopImmediatePropagation();
        }
        // END show silo or barn

        private function settingsButton_clickHandler(e:MouseEvent):void {
            var y:int = _settingsPanelEnabled ? PANELS_HIDE_Y : SETTINGS_DROP_DOWN_PANEL_TOP;
            if(!_settingsPanelEnabled){
                settingsPanel.visible = true;
            }

            Tweener.addTween(settingsPanel, {y: y, time: 0.7, transition: "easeOutCubic", onComplete: function ():void {
                settingsPanel.visible = _settingsPanelEnabled;
            }});
            _settingsPanelEnabled = !_settingsPanelEnabled;
        }

        private function musicSettingsButton_clickHandler(e:MouseEvent):void {
            if (SoundManager.instance.music_volume == 0) {
                SoundManager.instance.turn_on_music();
            } else {
                SoundManager.instance.turn_off_music();
            }

            SettingsManager.instance.save_custom_settings({music: SoundManager.instance.music_volume});

            musicSettingsButton.gotoAndStop(SoundManager.instance.music_volume == 0 ? 3 : 1)
            e.stopImmediatePropagation();
        }

        private function soundSettingsButton_clickHandler(e:MouseEvent):void {
            if (SoundManager.instance.sound_volume == 0) {
                SoundManager.instance.sound_volume = 1;
            } else {
                SoundManager.instance.sound_volume = 0;
            }

            SettingsManager.instance.save_custom_settings({sound: SoundManager.instance.sound_volume});

            soundSettingsButton.gotoAndStop(SoundManager.instance.sound_volume == 0 ? 3 : 1)
            e.stopImmediatePropagation();
        }

        private function fullScreenSettingsButton_clickHandler(e:MouseEvent):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;
            //TODO:DO THE SAME IN TOOL
            Config.game.change_screen_mode();

            e.stopImmediatePropagation();
        }

        private function zoomInSettingsButton_clickHandler(e:MouseEvent):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

            Config.scene.zoom(1);

            e.stopImmediatePropagation();
        }

        private function zoomOutSettingsButton_clickHandler(e:MouseEvent):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

            Config.scene.zoom(-1);

            e.stopImmediatePropagation();
        }

        private function animationSettingsButton_clickHandler(e:MouseEvent):void {
            AnimationSettings.enabled = !AnimationSettings.enabled;
            SettingsManager.instance.save_custom_settings({animation: AnimationSettings.enabled});
            animationSettingsButton.gotoAndStop(AnimationSettings.enabled ? 1 : 3)

            e.stopImmediatePropagation();
        }

        private function goHomeButton_clickHandler(e:Event):void {
            if (GuiHelper.isObjectDisabled(e.currentTarget))
                return;

            if (Config.scene.is_home_current_room()) {
                Config.scene.switch_user(Config.real_user_id);
                e.stopImmediatePropagation();
            } else {
                Config.scene.switch_room(Config.scene.HOME_ROOM);
            }
        }
        // END HANDLERS

        // OLD ENERGY GUI BOTTOM
        /*        private function update_farm_name():void {
         var farm_owner:VkUser = Config.is_player_user ? Config.user : Config.neighbors.get_neighbor(Config.model.owner_id);
         if (farm_owner == null) {
         farm_owner = TopUsersManager.instance.get_top_user_by_id(Config.model.owner_id);
         }
         if (farm_owner != null) {
         FontHelper.set_text_with_scale(friendsPanelField, farm_owner.full_name, USER_NAME_MAX_CHAR, 12, 20);
         } else {
         friendsPanelField.text = "";
         }
         }*/

        /** Устанавливает гуи в режим текущей локации */
        public function set_user_mode(user_is_player:Boolean):void {
//            update_farm_name();

            user_is_player = Config.is_player_user && Config.field.on_faked_location == false;

            goHomeButton.visible = !user_is_player || !Config.scene.is_home_current_room();
            new PopupText(goHomeButton, Te.return_button_hint, this, {align:"right"});

            if (_currentUserMode == user_is_player)
                return;

            _currentUserMode = user_is_player;
            toolsDropDownIndy.visible = multiToolButton.visible = shopButton.visible = stuffButton.visible = stuffDropDownIndy.visible = user_is_player;

            // TODO: wonder wtf queue parts do here
            Config.history.clearAllDelayedCommands();
            EnergyToolManager.deactivateTool();
            if (!user_is_player) {
                Config.field.remove_progressbars();
                Config.ticker.stop()
            }
            //EnergyGuiTop(Config.gui_top).set_user_mode(user_is_player);
        }


        public function setEnabled(enabled:Boolean):void {
            _container.mouseChildren = enabled;
        }




        private function setup_button(button:MovieClip, on_click:Function = null, hintName:String = null, hintText:String = null):void {
            trace(button.name,hintName,hintText)
            button.addEventListener(MouseEvent.CLICK, hide_popups);
//            EnergyButton.initButton(button, on_click);
            SkinWrapper.wrapButton(button, on_click);
            if(hintName) {
                setHintText(hintName, hintText);
                hints.setKeyIfEmpty(button, hintName);
                button.addEventListener(MouseEvent.ROLL_OVER, button_rollOverHandler, false, 0, true);
                button.addEventListener(MouseEvent.ROLL_OUT, button_rollOutHandler, false, 0, true);
            }
        }

        private function button_rollOverHandler(event:MouseEvent):void {
            showHint(String(hints.getKey(event.currentTarget)));
        }

        private function button_rollOutHandler(event:MouseEvent):void {
            showHint(String(hints.getKey(event.currentTarget)), false);
        }

        /** Прячет панель инструментов и все всплывающие меню. */
        public function hide_popups(e:MouseEvent = null):void {
            Config.altWindows.hide();
            if (!Config.is_player_user)
                return;

            if(toolsDropDownPanel.visible){
                toolsDropDownIndy.gotoAndStop(1);
                Tweener.addTween(toolsDropDownPanel, {alpha: 0, time: 0.2, transition: "linear"});
                Tweener.addTween(toolsDropDownPanel, {y: PANELS_HIDE_Y, time: 0.2, transition: "easeInCubic", onComplete: function ():void {
                    toolsDropDownPanel.visible = false;
                }});
            }

            if(stuffDropDownIndy.visible){
                stuffDropDownIndy.gotoAndStop(1);
                Tweener.addTween(stuffDropDownPanel, {alpha: 0, time: 0.2, transition: "linear"});
                Tweener.addTween(stuffDropDownPanel, {y: PANELS_HIDE_Y, time: 0.2, transition: "easeInCubic", onComplete: function ():void {
                    stuffDropDownPanel.visible = false;
                }});
            }
        }

        public function update_settings_buttons():void {
            soundSettingsButton.gotoAndStop(SoundManager.instance.sound_volume == 0 ? 3 : 1);
            musicSettingsButton.gotoAndStop(SoundManager.instance.music_volume == 0 ? 3 : 1);
            animationSettingsButton.gotoAndStop(AnimationSettings.enabled ? 1 : 3);
        }

        /*        // TODO: pretend to be deprecated with new tutorial
         // TUTORIAL
         *//** Показывает текстовое сообщение туториала. *//*
     public function show_tutorial(text:String, call_back_click:Function = null, callback_timer:Function = null):void {
     if(!friendsPanel.TutorialMessager)
     return;

     hide_tutorial();
     _tutorialMessagerClickCb = call_back_click;
     _tutorialTimerCb = callback_timer;
     friendsPanel.TutorialMessager.TextMessage.text = text;
     friendsPanel.TutorialMessager.visible = true;

     if (_tutorialMessagerClickCb != null) {
     friendsPanel.TutorialMessager.addEventListener(MouseEvent.CLICK, tutorialMessager_clickHandler);
     }

     _tutorialTimer.reset();
     _tutorialTimer.start();
     }

     public function get tutorialMessager():DisplayObjectContainer {
     return (friendsPanel) ? friendsPanel.TutorialMessager as DisplayObjectContainer : null;
     }

     private function tutorialMessager_clickHandler(e:Event):void {
     var cb:Function = _tutorialMessagerClickCb;
     hide_tutorial();
     if (cb != null) {
     cb(e);
     }
     }

     *//** Прячет сообщение с подсказкой туториала. *//*
     public function hide_tutorial(e:TimerEvent = null):void {
     if(!friendsPanel.TutorialMessager)
     return;

     friendsPanel.TutorialMessager.visible = false;
     _tutorialTimer.stop();

     if (_tutorialMessagerClickCb != null) {
     friendsPanel.TutorialMessager.removeEventListener(MouseEvent.CLICK, _tutorialMessagerClickCb);
     _tutorialMessagerClickCb = null;
     }

     if (e && _tutorialTimerCb != null) {
     _tutorialTimerCb();
     }

     while (friendsPanel.TutorialMessager.AnchorPerson.numChildren > 0) {
     friendsPanel.TutorialMessager.AnchorPerson.removeChildAt(0);
     }
     }
     // END TUTORIAL
     // END pretend to be deprecated with new tutorial*/
    }
}

