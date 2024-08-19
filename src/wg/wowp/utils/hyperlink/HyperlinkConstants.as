package wowp.utils.hyperlink {

import wowp.account.constants.BrowserTagID;
import wowp.account.model.AccountModel;
import wowp.account.model.hangar.browser.BrowserDataModel;
import wowp.controls.contextMenu.ContextMenuEvents;
import wowp.core.eventPipe.EventPipe;
import wowp.hangar.model.HangarModel;
import wowp.hangar.quests.models.questConst.QuestFilterConst;
import wowp.hangar.widget.planeSpecs.view.planeStage.data.PlaneStages;

public class HyperlinkConstants {
    public static const VIDEO_CONQUEST:String = "video_conquest";
    public static const VIDEO_GUIDE:String = "video_guide";
    public static const BROWSER_GUIDE:String = "browser_guide";
    public static const VIDEO_FIGHTERS:String = "video_fighters";
    public static const VIDEO_ASSAULT:String = "video_assault";
    public static const VIDEO_NAVY:String = "video_navy";
    public static const VIDEO_HFIGHTERS:String = "video_hfighters";
    public static const VIDEO_BOMBERS:String = "video_bombers";
    public static const RESEARCH_TREE:String = "research_tree";
    public static const TAB_MAINTENANCE:String = "tab_maintenance";
    public static const TAB_MODULES:String = "tab_modules";
    public static const TAB_CUSTOMIZATION:String = "tab_customization";
    public static const TAB_CREW:String = "tab_crew";
    public static const ACHIEVEMENTS:String = "achievements";
    public static const STATISTICS:String = "statistics";
    public static const SEARCH_SQUAD:String = "search_squad";
    public static const BARRACKS:String = "barracks";
    public static const CONTACT_LIST:String = "contact_list";
    public static const CURRENT_QUESTS:String = "current_quests";
    public static const BUY_PREMIUM:String = "buy_premium";
    public static const SUPPLY_SERVICE:String = "supply_service";
    public static const GOLD_EXCHANGE:String = "gold_exchange";
    public static const EXP_EXCHANGE:String = "exp_exchange";
    public static const BATTLE_ORDERS:String = "battle_orders";
    public static const CREW_PROFILE:String = "crew_profile";
    public static const PREMIUM_SHOP:String = "premium_shop";
    public static const STORAGE:String = "storage";
    public static const TROPHY_TEAM:String = "trophy_team";
    public static const PROGRESSION_SPECIALIST:String = "progression_specialist";
    public static const WEB_ACHIEVEMENTS:String = "web_achievements";
    
    public static function isWebLink(link:String):Boolean {
        switch (link) {
            case WEB_ACHIEVEMENTS:
                return true;
            default:
                return false;
        }
    }
    
    public static function isOpeningModal(link:String):Boolean {
        switch (link) {
            case VIDEO_CONQUEST:
            case VIDEO_GUIDE:
            case BROWSER_GUIDE:
            case VIDEO_FIGHTERS:
            case VIDEO_ASSAULT:
            case VIDEO_NAVY:
            case VIDEO_HFIGHTERS:
            case VIDEO_BOMBERS:
            case BARRACKS:
            case CONTACT_LIST:
            case CURRENT_QUESTS:
            case BUY_PREMIUM:
            case SUPPLY_SERVICE:
            case CREW_PROFILE:
            case PREMIUM_SHOP:
            case TROPHY_TEAM:
            case PROGRESSION_SPECIALIST:
            case WEB_ACHIEVEMENTS:
                return true;
            default:
                return false;
        }
    }
    
    public static function getFunction(link:String):Function {
        return function () {
            switch (link) {
                case HyperlinkConstants.VIDEO_CONQUEST:
                    tryToCallBrowserPage(BrowserTagID.TUTORIAL);
                    break;
                case HyperlinkConstants.VIDEO_GUIDE:
                    tryToCallBrowserPage(BrowserTagID.DEFAULT);
                    break;
                case HyperlinkConstants.BROWSER_GUIDE:
                    tryToCallBrowserPage(BrowserTagID.GUIDE);
                    break;
                case HyperlinkConstants.VIDEO_FIGHTERS:
                    tryToCallBrowserPage(BrowserTagID.TYPE_LIGHT);
                    break;
                case HyperlinkConstants.VIDEO_ASSAULT:
                    tryToCallBrowserPage(BrowserTagID.TYPE_ATTACKER);
                    break;
                case HyperlinkConstants.VIDEO_NAVY:
                    tryToCallBrowserPage(BrowserTagID.TYPE_NAVY);
                    break;
                case HyperlinkConstants.VIDEO_HFIGHTERS:
                    tryToCallBrowserPage(BrowserTagID.TYPE_HEAVY);
                    break;
                case HyperlinkConstants.VIDEO_BOMBERS:
                    tryToCallBrowserPage(BrowserTagID.TYPE_BOMBER);
                    break;
                case HyperlinkConstants.RESEARCH_TREE:
                    HangarModel.instance.gotoResearchTree();
                    break;
                case HyperlinkConstants.TAB_MAINTENANCE:
                    HangarModel.instance.gotoMaintenance();
                    break;
                case HyperlinkConstants.TAB_MODULES:
                    HangarModel.instance.gotoModules();
                    break;
                case HyperlinkConstants.TAB_CUSTOMIZATION:
                    HangarModel.instance.gotoCustomization();
                    break;
                case HyperlinkConstants.TAB_CREW:
                    HangarModel.instance.gotoCrew();
                    break;
                case HyperlinkConstants.ACHIEVEMENTS:
                    HangarModel.instance.gotoMedals();
                    break;
                case HyperlinkConstants.STATISTICS:
                    HangarModel.instance.gotoAchievements();
                    break;
                case HyperlinkConstants.SEARCH_SQUAD:
                    HangarModel.instance.gotoSquad();
                    break;
                case HyperlinkConstants.BARRACKS:
                    HangarModel.instance.gotoBarracks();
                    break;
                case HyperlinkConstants.CONTACT_LIST:
                    AccountModel.instance.chatModel.openContactList();
                    break;
                case HyperlinkConstants.CURRENT_QUESTS:
                    HangarModel.instance.ui.showQuestWindow(QuestFilterConst.UNFINISHED_QUESTS);
                    break;
                case HyperlinkConstants.BUY_PREMIUM:
                    HangarModel.instance.ui.showBuyPremiumWindow();
                    break;
                case HyperlinkConstants.SUPPLY_SERVICE:
                    HangarModel.instance.ui.showTicketsWindow();
                    break;
                case HyperlinkConstants.GOLD_EXCHANGE:
                    HangarModel.instance.ui.showExchangeGoldWindow();
                    break;
                case HyperlinkConstants.EXP_EXCHANGE:
                    HangarModel.instance.ui.showExchangeExpWindow();
                    break;
                case HyperlinkConstants.BATTLE_ORDERS:
                    EventPipe.dispatcher.dispatchEvent(new ContextMenuEvents(ContextMenuEvents.SHOW_USER_HANGAR_MENU));
                    break;
                case HyperlinkConstants.CREW_PROFILE:
                    HangarModel.instance.gotoCrew();
                    HangarModel.instance.gotoCrewProfile();
                    break;
                case HyperlinkConstants.PREMIUM_SHOP:
                    HangarModel.instance.common.premiumShop();
                    break;
                case HyperlinkConstants.STORAGE:
                    HangarModel.instance.gotoStorage();
                    break;
                case HyperlinkConstants.TROPHY_TEAM:
                    HangarModel.instance.gotoTrophyTeam();
                    break;
                case HyperlinkConstants.PROGRESSION_SPECIALIST:
                    HangarModel.instance.ui.showProgressionWindow(AccountModel.instance.playerModel.selectedPlaneID, PlaneStages.SPECIALIST);
                    break;
                case HyperlinkConstants.WEB_ACHIEVEMENTS:
                    HangarModel.instance.common.showAchievements();
                    break;
            }
        }
        
        function tryToCallBrowserPage(page:String):void {
            var bd:BrowserDataModel = AccountModel.instance.hangarModel.browserData;
            var data:Object;
            data = bd.getDataByTag(page);
            if (data != null) {
                HangarModel.instance.ui.showBrowserWindowObj(data);
            }
        }
    }
}
}
