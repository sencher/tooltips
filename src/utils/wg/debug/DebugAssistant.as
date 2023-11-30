package utils.wg.debug {

import utils.wg.utils.debug.*;

import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Stage;
import flash.events.Event;
import flash.external.ExternalInterface;
import flash.text.TextField;

import wowp.account.constants.Nation;

import wowp.account.model.AccountModel;
import wowp.account.model.hangar.event.leaderboard.LeaderBoardModel;
import wowp.account.model.messages.FakeMessageTypeID;
import wowp.account.model.messages.MessageTypeID;

import wowp.account.model.quest.QuestAwardID;

import wowp.core.api.debug.DebugManager;
import wowp.core.eventPipe.EventPipe;
import wowp.data.ivo.compound.PlaneData;
import wowp.hangar.flight.model.FlightModel;
import wowp.hangar.mediator.BaseHangarMediator;
import wowp.hangar.mediator.events.HangarNavigationEvents;
import wowp.hangar.messages.handlers.SMActivity;
import wowp.hangar.model.HangarModel;
import wowp.hangar.quests.models.itemData.AwardDraft;
import wowp.hangar.quests.service.AwardDataFactory;
import wowp.hangar.quests.service.sumAwards;
import wowp.hangar.tickets.tabs.TicketsWindowTabID;
import wowp.settings.views.events.DataEvent;

import wowp.utils.object.mergeObjects;

public class DebugAssistant {
    private static var _stage:Stage;
    
    public static function init(stage:Stage):void {
        trace("99999999 DebugAssistant init");
        DebugManager.start(stage, false);
        DebugAssistant._stage = stage;
        
        DebugManager.debug(showTickets, "showTickets", "Windows");
        DebugManager.debug(showInventory, "showInventory", "Windows");
        DebugManager.debug(showWarCache, "showWarCache", "Windows");
        DebugManager.debug(showTotalWarRules, "TotalWarRules", "Windows");
        DebugManager.debug(showTotalWarRules1, "TotalWarRules1", "Windows");
        DebugManager.debug(showTotalWarRules2, "TotalWarRules2", "Windows");
        DebugManager.debug(showTotalWarRules3, "TotalWarRules3", "Windows");
        DebugManager.debug(showBattleResult, "BattleResult", "Windows");
        DebugManager.debug(showExchangeTicketsWindow, "exchangeTicketsWindow", "Windows");
        DebugManager.debug(showLeaderboardCompletedWindow, "Leaderboard Completed", "Windows");
        DebugManager.debug(showMessage, "TOTAL_WAR_WARNING", "Messages");
        DebugManager.debug(showMessage2, "SQUAD_LEVELS_FAILURE", "Messages");
        DebugManager.debug(showMessage3, "COMMON_TEST", "Messages");
        DebugManager.debug(showConsole, "show", "Console");
        DebugManager.debug(getPlaneData, "getPlaneData", "Planes");
        DebugManager.debug(showDeliveryRewards, "DeliveryRewards", "Windows");
        DebugManager.debug(showDeliveryRewards2, "DeliveryRewards2", "Windows");
        DebugManager.debug(sumAw, "sumAwards", "Test");
        DebugManager.debug(clearEulaVersion, "clearEulaVersion", "Backend");
    
        DebugManager.debug(rewardTrack, "rewardTrack", "Windows");
        
        //Cc.warncw("DebugAssistant", "init loc callback");
        //filters bug
        //ExternalInterfaceProxy.addCallback('receiveLocalization', receiveLocalization2);
        DebugManager.debug(debug, "get2", "Localization");
//        ExternalInterfaceProxy.call("Loader.GetLocalizationTable");
        DebugManager.debug(reloadLocalization, "reloadLocalization", "Localization");
        DebugManager.debug(reInitLogin, "re-init", "Login");
        ExternalInterface.addCallback("setLoginInitializationData", setInitializationData);
        
        DebugManager.debug(minimum, "minimum", "Events");
        DebugManager.debug(maximum, "maximum", "Events");
        DebugManager.debug(value, "value", "Events");
        DebugManager.debug(position, "position", "Events");
        DebugManager.debug(setExperience, "setExperience", "Hangar");
        DebugManager.debug(setGold, "setGold", "Hangar");
        DebugManager.debug(setSilver, "setSilver", "Hangar");
        DebugManager.debug(haveFlight, "haveFlight", "Debug");
        
        _stage.addEventListener(DebugEvent.SET_SILVER, testHandler);
    
//        AccountModel.instance.hangarModel.globalEventModel.totalWar.turnOn();
        
        showConsole();
    }
    
    public static function showConsole():void {
        Cc.start(_stage);
        Cc.commandLine = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
        Cc.visible = true;
        Cc.x = 800;
        Cc.y = 0;
        Cc.width = 1000;
        Cc.height = 1000;
        Cc.config.alwaysOnTop = true;
        Cc.D_MODE = 0;
    }
    
    public static function haveFlight():void {
        Cc.tool( "haveFlight", FlightModel.instance.haveFlight);
    }
    
    public static function setExperience(value:Number = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.SET_EXPERIENCE, value,true, false));
    }
    
    public static function setGold(value:Number = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.SET_GOLD, value,true, false));
    }
    
    public static function setSilver(value:Number = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.SET_SILVER, value,true, false));
    }
    
    public static function minimum(value:int = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.MINIMUM, value,true, false));
    }
    
    public static function maximum(value:int = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.MAXIMUM, value,true, false));
    }
    
    public static function value(value:int = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.VALUE, value,true, false));
    }
    
    public static function position(value:int = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.POSITION, value,true, false));
    }
    
    public static function testHandler(event:DataEvent = null):void {
        Cc.toolw("testHandler2", event, event.data);
    }
    
    public static function rewardTrack():void {
//        HangarModel.instance.gotoRewardTrack();
        HangarModel.instance.ui.showRewardTrackWindow();
    }
    
    public static function reInitLogin():void {
        Cc.toolcw("DebugAssistant", "reInitLogin");
        ExternalInterfaceProxy.call("initialized");
    }
    
    public static function setInitializationData(data:Object):void {
        Cc.toolcw("DebugAssistant", "setInitializationData", data);
    }
    
    public static function reloadLocalization():void {
        Cc.toolcw("DebugAssistant", "reloadLocalization");
        ExternalInterfaceProxy.call("Loader.GetLocalizationTable");
    }
    
    public static function debug(key:String):void {
//        Cc.toolchw("DebugAssistant", "debug", arr);
        if (ExternalInterface.available) {
            var asIs:String = ExternalInterfaceProxy.call("localize", key);
            var lowerCase:String = ExternalInterfaceProxy.call("localize", key.toLowerCase());
            var upperCase:String = ExternalInterfaceProxy.call("localize", key.toUpperCase());
            Cc.tool(key);
            if (asIs != key) Cc.tool("asIs: ", asIs);
            if (lowerCase != key.toLowerCase()) Cc.tool("lowerCase: ", lowerCase);
            if (upperCase != key.toUpperCase()) Cc.tool("upperCase: ", upperCase);
        }
    }
    
    private static function receiveLocalization2(arr:Array):void {
        Cc.toolcw("DebugAssistant", "receiveLocalization", arr);
    }
    
    public static function clearEulaVersion():void {
        ExternalInterface.call("login.clearEulaVersion");
    }
    
    public static function becomeProxyTF(tf:TextField):TextField {
        var parent:DisplayObject = tf.parent;
        if (!parent) return null;
        
        var debugTF:TextFieldProxy = new TextFieldProxy(tf);
        return TextField(debugTF);
    }
    
    public static function becomeDebugTF(tf:TextField):TextField {
        var parent:DisplayObjectContainer = tf.parent;
        if (!parent) return null;
        
        var debugTF:TextFieldDebug = new TextFieldDebug();
        mergeObjects(debugTF, tf, true);
        debugTF.inited = true;
        parent.removeChild(tf);
        parent.addChild(debugTF);
        return TextField(debugTF);
    }
    
    private static function sumAw():void {
        var a1:Array = [
            {
                "id": null,
                "planeID": 3303,
                "type": "crew",
                "ui": {"mainSkillID": 1, "planeID": 3303, "skillPoints": 1},
                "value": 1
                
            },
            {
                "id": null,
                "planeID": 2,
                "type": "garbage",
                "ui": {"mainSkillID": 1, "planeID": 2, "skillPoints": 0},
                "value": 1
                
            },
            {
                "id": null,
                "planeID": 1111,
                "type": "crew",
                "ui": {"mainSkillID": 1, "planeID": 1111, "skillPoints": 0},
                "value": 1
                
            },
            {
                "id": null,
                "planeID": 2505,
                "type": "crew",
                "ui": {"mainSkillID": 1, "planeID": 2505, "skillPoints": 5},
                "value": 1
                
            },
            {
                "id": null,
                "planeID": 55,
                "type": "crew",
                "ui": {"mainSkillID": 1, "planeID": 55, "skillPoints": 5},
                "value": 1
                
            }];
        Cc.tool(sumAwards(a1));
    }
    
    private static function showDeliveryRewards():void {
        var data:Array = [
            new AwardDraft(QuestAwardID.SLOT, 1),
            new AwardDraft(QuestAwardID.PLANE, 1, 3303),
            new AwardDraft(QuestAwardID.CREW, 1)
        ];
        HangarModel.instance.windows.deliveryRewardsWindow.open({setData: data});
    }
    
    private static function showDeliveryRewards2():void {
        var data:Array = [
            new AwardDraft(QuestAwardID.PLANE, 1, 3303),
            new AwardDraft(QuestAwardID.TOTEM, 1, 7),
            new AwardDraft(QuestAwardID.TOTEM, 1, 8),
            new AwardDraft(QuestAwardID.WAR_CACHE, 1, 11),
            new AwardDraft(QuestAwardID.WAR_CACHE, 1, 902),
            new AwardDraft(QuestAwardID.EQUIPMENT, 1, 1393),
            new AwardDraft(QuestAwardID.CONSUMABLE, 15, 566),
            new AwardDraft(QuestAwardID.CREDITS, 30000),
            new AwardDraft(QuestAwardID.CREW, 1)
        ];
        HangarModel.instance.windows.deliveryRewardsWindow.open({setData: data});
    }
    
    private static function getPlaneData(id:int):void {
        var planeData:PlaneData = AccountModel.instance.planesModel.getPlaneData(id);
        var nationId:int = planeData.nationID;
        Cc.toolcw("getPlaneData", planeData, nationId, Nation.getStringNation(nationId));
    }
    
    private static function showMessage():void {
        AccountModel.instance.systemMessages.showCustomMessage({
            msgType: FakeMessageTypeID.TOTAL_WAR_WARNING,
            msgData: {type: SMActivity.DIRECTIVES}
        });
    }
    
    private static function showMessage2():void {
        AccountModel.instance.systemMessages.showCustomMessage({
            msgType: MessageTypeID.SQUAD_LEVELS_FAILURE
        });
    }
    
    private static function showMessage3():void {
        AccountModel.instance.systemMessages.showCustomMessage({
            msgType: FakeMessageTypeID.COMMON_TEST
        });
    }
    
    private static function showLeaderboardCompletedWindow():void {
        var activities:LeaderBoardModel = AccountModel.instance.hangarModel.globalEventModel.leaderBoards.activities[0];
        var factory:AwardDataFactory = AwardDataFactory.instance;
        var awards:Array = [
            factory.getAwardData(new AwardDraft(QuestAwardID.ADDITIONAL, 1, 0, null, "LOBBY_NTF_ICON_PRIZE_TITLE", "awardNFT.dds")),
            factory.getAwardData(new AwardDraft(QuestAwardID.GOLD, 375)),
            factory.getAwardData(new AwardDraft(QuestAwardID.EQUIPMENT, 1, 1375)),
            factory.getAwardData(new AwardDraft(QuestAwardID.EQUIPMENT, 1, 1379)),
            factory.getAwardData(new AwardDraft(QuestAwardID.WAR_CACHE, 1, 11))
        ]
        
        activities.awards = awards;
        
        HangarModel.instance.ui.showLeaderboardCompletedWindow();
    }
    
    private static function showExchangeTicketsWindow():void {
        HangarModel.instance.ui.showExchangeCouponsWindow();
    }
    
    private static function showBattleResult():void {
        Cc.D_MODE = 1;
        HangarModel.instance.ui.showBattleResultWindow("debug", true);
    }
    
    private static function showTotalWarRules():void {
        HangarModel.instance.ui.showTotalWarRulesWindow();
    }
    
    private static function showTotalWarRules1():void {
        HangarModel.instance.ui.showTotalWarRulesWindow(0);
    }
    
    private static function showTotalWarRules2():void {
        HangarModel.instance.ui.showTotalWarRulesWindow(1);
    }
    
    private static function showTotalWarRules3():void {
        HangarModel.instance.ui.showTotalWarRulesWindow(2);
    }
    
    private static function showTickets():void {
        HangarModel.instance.ui.showTicketsWindow({payLoad: {tabID: TicketsWindowTabID.DEFAULT}});
    }
    
    private static function showInventory():void {
        HangarModel.instance.ui.showTicketsWindow({payLoad: {tabID: TicketsWindowTabID.INVENTORY}});
    }
    
    private static function showWarCache():void {
        HangarModel.instance.ui.showTicketsWindow({payLoad: {tabID: TicketsWindowTabID.WAR_CACHE}});
    }
}
}