package skins.energy {
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;

    public class FriendPanel extends MovieClip {

        private static const USER_NAME_MAX_CHAR:int = 20;
        private const USERBAR_CAPACITY:int = 6;
        private const FRIEND_ICON_DX:int = 67;
        private const FRIEND_ICON_Y:Number = 7.5;
        private const FRIEND_ICON_MIDDLE_X:int = 241;

        private var _usersCount:int;
        private var _currentFirstUser:int = 0;  // first EnergyEnergyUserIcon index after player`s one
        private var _previousFirstUser:int = 0;
        private var _icons:Array /*of EnergyEnergyUserIcon */ = [];
        private var _panelUsers:Array /* of VkUser */ = new Array();
        private var _addFriendButtons:Array = []; // add friend icons (button_add_friend)
        private var _leftmostAddFriendButton:MovieClip;
        private var _leftmostRandomFriend:EnergyEnergyUserIcon;
        private var friendsPanel:MovieClip;
        private var _container:DisplayObjectContainer;

        // user and friends icons
        public function init():void {


            fillEnergyUserIconIcons(_icons, USERBAR_CAPACITY);

            _leftmostRandomFriend = new user_friend_class();
            _leftmostRandomFriend.x = -3 * FRIEND_ICON_DX + FRIEND_ICON_MIDDLE_X;
            _leftmostRandomFriend.y = FRIEND_ICON_Y;
            _leftmostRandomFriend.name = "_RandomFriend";
            _leftmostRandomFriend.visible = false;
            I18nHelper.set_font_for_display_object(_leftmostRandomFriend);
            friendsPanel.addChild(_leftmostRandomFriend);

            _leftmostAddFriendButton = new user_friend_class();
            _leftmostAddFriendButton.x = -3 * FRIEND_ICON_DX + FRIEND_ICON_MIDDLE_X;
            _leftmostAddFriendButton.y = FRIEND_ICON_Y;
            _leftmostAddFriendButton.name = "_AddFriendButton";
//            setup_button(_leftmostAddFriendButton);
            I18nHelper.set_font_for_display_object(_leftmostAddFriendButton);
            friendsPanel.addChild(_leftmostAddFriendButton);

            fillAddFriendButtons(_addFriendButtons, USERBAR_CAPACITY, user_friend_class);


            var btn:MovieClip;
//            var text:String = Te.add + "\n" + Te.neighbors_second_form;
            var all_friend_buttons:Array = _addFriendButtons.concat([_leftmostAddFriendButton]);
            var n:uint = all_friend_buttons.length;
            for (var i:int = 0; i < n; i++){
                btn = all_friend_buttons[i];
                setup_button(btn, on_add_friend);
            }
        }





//        /** Обновляет список друзей. */
//        public function update_friends_strings():void {
//            var i:int = -1;
//            var len:int = _icons.length;
//
//            while (i++ < len) {
//                if (_icons[i] && _icons[i].visible)
//                    _icons[i].update_gui();
//            }
//        }

        private function fillAddFriendButtons(addFriendButtons:Array, capacity:int, addFriendButtonClass:Class):void {
            var length:int = addFriendButtons.length;
            var button:MovieClip;
            var newButtonsCount:int = capacity - length;
            if (newButtonsCount <= 0) return;
            for (var i:int = length; i < capacity; i++) {
                button = new addFriendButtonClass();
                GuiHelper.hide_i18n(button);
                friendsPanel.addChild(button);
                button.x = (i - 2) * FRIEND_ICON_DX + FRIEND_ICON_MIDDLE_X;
                button.y = FRIEND_ICON_Y;
                button.name = "fillAddFriendButtons"+i;
                setup_button(button);
                addFriendButtons[i] = button;
            }
            dispatchEvent(new EnergyGuiPanelEvent(EnergyGuiPanelEvent.FRIEND_BUTTON_ADDED, newButtonsCount));
            var buttonsLength:int = Math.min(capacity, addFriendButtons.length);
            for (i = 0; i < buttonsLength; i++) {
                button = addFriendButtons[i];
                if (!friendsPanel.contains(button)) friendsPanel.addChild(button);
            }
        }





    }
}
