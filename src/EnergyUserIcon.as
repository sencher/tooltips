package skins.energy {
    import api.wrapper.VkAPIWrapper;

    import common.GameUser;
    import common.item.SharedConfig;
    import common.ui.lib.PopupText;

    import energy.EnergyScene;
    import energy.EnergyUser;
    import energy.Te;
    import energy.managers.EnergyNeighborsManager;
    import energy.ui.alts.common.AltWindowParameters;
    import energy.ui.alts.core.IAltWindowTarget;
    import energy.ui.alts.core.action.EnergyPopupItemAction;
    import energy.ui.alts.core.action.IEnergyAction;
    import energy.ui.alts.windows.AltWindowPopupMenu;

    import flash.display.BitmapData;
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.utils.Timer;

    import ru.vkontakte.VkUser;

    import utils.ArrayHelper;
    import utils.GuiHelper;
    import utils.ImageContainer;

    public class EnergyUserIcon extends MovieClip implements IAltWindowTarget {
        private const RANDOM_FRIEND_UPDATE_INTERVAL:int = 20000;

        private var _friends:Array = new Array();
        private var _random_friend_timer:Timer;
        private var _popup_text:PopupText;
        private var _container:DisplayObjectContainer;
        public var _user_data:VkUser;


        public function EnergyUserIcon(mc:MovieClip) {
            _container = new ContainerClass();
            addChild(_container);

            attentionIcon.visible = false;
            user_button.removeEventListener(MouseEvent.CLICK, switch_user);
        }

        public function get user_id():String {
            return (_user_data != null) ? _user_data.uid: "";
        }

        public function get user_name():String {
            return (_user_data != null) ? _user_data.firstName: "";
        }


        public function update_photo():void {
            var url:String = _user_data.photoUrl;

        }

        protected function get user_button():MovieClip {
            return this;
        }

        protected function get friend_exp():TextField {
            return starIcon.text_level;
        }

        private function get subscribeIcon():MovieClip {
            return _container["subs"];
        }

        private function get socialIcon():MovieClip {
            return _container["social"];
        }

        private function get attentionIcon():MovieClip {
            return _container["attention"];
        }

        protected function get starIcon():MovieClip {
            return _container["level"];
        }

        public function get avatarContainer():MovieClip {
            return _container["image"];
        }

        protected function get friend_bottom_text():String {
            return _user_data._level.toString();
        }

        public function update_gui(e:Event = null):void {
            if (_user_data.uid == EnergyScene.IMAGINARY_FRIEND_ID)
                _user_data = Config.scene.imaginary_friend;

//            user_name_field.text = user_name;
            buttonMode = true;

            user_button.removeEventListener(MouseEvent.CLICK, show_context_menu);
            user_button.removeEventListener(MouseEvent.CLICK, show_invite_window);

            if (!(_user_data as EnergyUser).is_neighbor && EnergyNeighborsManager.VIEW_APP_FRIENDS) {
                user_button.addEventListener(MouseEvent.CLICK, show_invite_window);
                starIcon.visible = false;
            } else {
                user_button.addEventListener(MouseEvent.CLICK, show_context_menu);
                starIcon.visible = true;
                friend_exp.autoSize = TextFieldAutoSize.CENTER;
                friend_exp.text = friend_bottom_text;
            }
        }

        // RANDOM FRIEND
        public function set random_friend_mode(value:Boolean):void {
            if (random_friend_mode == value)
                return;

            if (value) {
                _friends = get_friends();
                if (ArrayHelper.is_empty(_friends))
                    return;

                if (!_popup_text)
                    _popup_text = new PopupText(this, Config.api is VkAPIWrapper ? Te.reward_for_invite_new_user_vk : Te.invite_friend_that_not_in_game, Config.guiBottom, {align: 'right'});
                else
                    _popup_text.subscribe();

                if (!_random_friend_timer) {
                    _random_friend_timer = new Timer(RANDOM_FRIEND_UPDATE_INTERVAL);
                    _random_friend_timer.addEventListener(TimerEvent.TIMER, update_random_friend, false, 0, true);
                    update_random_friend();
                } else {
                    _random_friend_timer.reset();
                    _random_friend_timer.delay = RANDOM_FRIEND_UPDATE_INTERVAL;
                }
                _random_friend_timer.start();
                Config.friendPanel.align_user_pics();
            } else {
                if (_random_friend_timer)
                    _random_friend_timer.stop();

                if (_popup_text)
                    _popup_text.unsubscribe();
            }
        }

        public function get_friends():Array {
            if (_friends.length) return _friends;

            if (!Config.all_friends || Config.all_friends.length == 0)
                return Config.friends.concat();
            else
                return Config.not_in_game_game_friends.concat();

            return [];
        }

        public function get friends_count():int {
            return _friends.length;
        }

        public function get random_friend_mode():Boolean {
            if (_random_friend_timer)
                return _random_friend_timer.running;

            return false;
        }

        private function update_random_friend(e:TimerEvent = null):void {
            var friend:EnergyUser = _friends[Math.round(Math.random() * (_friends.length - 1))];
            if (!friend)
                return;

            if (_user_data)
                _user_data.removeEventListener(GameUser.USER_UPDATE, update_gui);

            init(friend);
            update_photo();
            update_gui();
        }

        public function init(user:VkUser):void{
            _user_data = user;
            _user_data.addEventListener(GameUser.USER_UPDATE, update_gui);
        }

        // END RANDOM FRIEND

        private function on_hire_click(ev:Event = null):void {
            if (!Config.is_player_user) {
                return;
            }
            if (EnergyScene(Config.scene).friend_hire_points <= 0 && EnergyUser(_user_data).time_to_hire() != "") {
                GuiHelper.MessageBox(Te.you_have_no_hire_points, {button1Text: Te.button_ok_text, no_close_button: true});
            }
            else if (!EnergyUser(_user_data).can_be_hired) {
                GuiHelper.MessageBox(Te.your_friend_can_not_be_hired, {button1Text: Te.button_ok_text, no_close_button: true});
            }
            else if (Config.model.coins < SharedConfig.friend_hire_cost) {
                GuiHelper.MessageBox(Te.your_have_no_money_to_hire_friend, {button1Text: Te.button_ok_text, no_close_button: true});
            }
            else {
                GuiHelper.MessageBox(Te.do_you_want_to_hire_friend, {button1Text: Te.button_ok_text, button2Text: Te.button_cancel_text, onOk: set_tool, no_close_button: true});
            }

            function set_tool():void {
                if (EnergyScene(Config.scene).friend_hire_points == 0 && EnergyUser(_user_data).time_to_hire() == "")
                    EnergyScene(Config.scene).friend_hire_points = 1;
                //Config.scene._tools["friend_hire"]._friend = _user_data;
                //Config.scene.set_tool("friend_hire", null);
            }
        }

        private function show_context_menu(event:MouseEvent):void {
            if (Config.model.owner_id == _user_data.uid)
                return;

            Config.guiBottom.hide_popups();

            Config.altWindows.show(this, this, 0, true);
        }

        private function show_invite_window(e:MouseEvent = null):void {
            Config.neighbors.show_invite_neighbors_subwindow([
                {user: _user_data}
            ], true);
        }

        protected function switch_user(ev:Event):void
        {
            if (Config.scene.is_tutorial_active) {
                return;
            }
            if(Config.user_id == user_id)
                return;
            Config.scene.switch_user(user_id);
        }
    }
}