package wowp.utils.debug {

import com.junkbyte.console.Cc;
import com.junkbyte.console.Ct;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.LoaderInfo;
import flash.display.Sprite;
import flash.display.Stage;
import flash.external.ExternalInterface;
import flash.text.TextField;

import scaleform.gfx.SystemEx;

import wowp.account.constants.Nation;
import wowp.account.model.AccountModel;
import wowp.account.model.QuestsModel;
import wowp.account.model.hangar.event.leaderboard.LeaderBoardModel;
import wowp.account.model.messages.FakeMessageTypeID;
import wowp.account.model.messages.MessageTypeID;
import wowp.account.model.quest.QuestAwardID;
import wowp.core.api.debug.DebugManager;
import wowp.core.eventPipe.EventPipe;
import wowp.core.layers.tip.events.HideTipEvent;
import wowp.data.ivo.compound.PlaneData;
import wowp.hangar.crew.models.ifaces.Ifaces;
import wowp.hangar.flight.model.FlightModel;
import wowp.hangar.messages.handlers.SMActivity;
import wowp.hangar.model.HangarModel;
import wowp.hangar.model.ui.HangarWindowsModel;
import wowp.hangar.quests.models.itemData.AwardDraft;
import wowp.hangar.quests.models.vo.QuestData;
import wowp.hangar.quests.service.AwardDataFactory;
import wowp.hangar.quests.service.sumAwards;
import wowp.hangar.tickets.tabs.TicketsWindowTabID;
import wowp.settings.views.events.DataEvent;
import wowp.utils.domain.getDefinition;
import wowp.utils.object.mergeObjects;

public class DebugAssistant {
    private static var inited:Boolean;
    
    private static var _stage:Stage;
    private static var loaderInfo:LoaderInfo;
    private static var _eventPipe:EventPipe = new EventPipe();
    
    public static var DEFAULT_INTERFACE_FILTER:Array = ["IEquipment", "IEquipmentInstance"];
    public static var INTERFACE_SERVICE_FILTER:Array = [Ifaces.ISKILL_PENALTY/*, Ifaces.ICREW_MEMBER*/];
    
    public static const CALL:String = "\\\\\\\\";
    public static const RESPONSE:String = "////";
    
    public static var FAKE_BATTLE_RESULT:Boolean;
    public static var FAKE_WAR_CACHE:Boolean;
    public static var PERMANENT_TOOLTIPS:Boolean;
    public static var LONG_TOOLTIP:Boolean;
    public static var KILL_TOOLTIP:Boolean;
    public static var TOOLTIPS_INFO:Boolean;
    public static var SHOW_BUY_TICKETS:Boolean;
    public static var IGNORE_WING_LEVEL_DIFFERENCE:Boolean;
    
    public static var IGNORE_LOGOUT:Boolean;
    public static var ALL_QUESTS_FINISHED:Boolean;
    public static var NO_MODAL_WINDOWS:Boolean;
    
    private static var hangarWindowsModel:HangarWindowsModel;
    private static var questsModel:QuestsModel;
    
    public static function init(stage:Stage, mini:Boolean = false):void {
        //trace("8888", inited);
        if (inited) {
            return;
        }
        _stage = stage;
        loaderInfo = _stage.loaderInfo;
    
        if (!mini) {
            hangarWindowsModel = HangarModel.instance.ui;
            questsModel = AccountModel.instance.questsModel;
        }
    
        DebugManager.start(stage, mini);
        DebugManager.debug(showBattleResult, "BattleResult", "Windows");
        DebugManager.debug(showQuestWindow, "QuestWindow", "Windows");
        DebugManager.debug(showQuestData, "QuestData", "Quests");
        DebugManager.debug(showQuestDataAll, "QuestDataAll", "Quests");
        DebugManager.debug(showTickets, "showTickets", "Windows");
        DebugManager.debug(showInventory, "showInventory", "Windows");
        DebugManager.debug(showWarCache, "showWarCache", "Windows");
        DebugManager.debug(showTotalWarRules, "TotalWarRules", "Windows");
        DebugManager.debug(showTotalWarRules1, "TotalWarRules1", "Windows");
        DebugManager.debug(showTotalWarRules2, "TotalWarRules2", "Windows");
        DebugManager.debug(showTotalWarRules3, "TotalWarRules3", "Windows");
        DebugManager.debug(showExchangeTicketsWindow, "exchangeTicketsWindow", "Windows");
        DebugManager.debug(showLeaderboardCompletedWindow, "Leaderboard Completed", "Windows");
        DebugManager.debug(showMessage, "TOTAL_WAR_WARNING", "Messages");
        DebugManager.debug(showMessage2, "SQUAD_LEVELS_FAILURE", "Messages");
        DebugManager.debug(showMessage3, "COMMON_TEST", "Messages");
        DebugManager.debug(showConsole, "show", "Console");
        DebugManager.debug(colorTest, "colorTest", "Console");
        DebugManager.debug(getPlaneData, "getPlaneData", "Planes");
        DebugManager.debug(showDeliveryRewards, "DeliveryRewards", "Windows");
        DebugManager.debug(showDeliveryRewards2, "DeliveryRewards2", "Windows");
        DebugManager.debug(sumAw, "sumAwards", "Test");
        DebugManager.debug(clearEulaVersion, "clearEulaVersion", "Backend");
    
        DebugManager.debug(rewardTrack, "rewardTrack", "Windows");

//        Cc.redcw("DebugAssistant", "init loc callback");
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
    
        DebugManager.debug(traceInterfaceResponces, "traceInterfaceResponces", "Interface");
        DebugManager.debug(traceInterfaceCalls, "traceInterfaceCalls", "Interface");
        DebugManager.debug(consoleAllInterfaceResponces, "consoleAllInterfaceResponces", "Interface");
        DebugManager.debug(consoleAllInterfaceCalls, "consoleAllInterfaceCalls", "Interface");
        DebugManager.debug(consoleFiltredInterfaceResponces, "consoleFiltredInterfaceResponces", "Interface");
        DebugManager.debug(consoleFiltredInterfaceCalls, "consoleFiltredInterfaceCalls", "Interface");
    
        DebugManager.debug(fakeBattleResult, "fakeBattleResult", "Flags");
        DebugManager.debug(fakeWarCache, "fakeWarCache", "Flags");
        DebugManager.debug(permanentTooltips, "permanentTooltips", "Flags");
        DebugManager.debug(longTooltip, "longTooltip", "Flags");
        DebugManager.debug(killTooltip, "killTooltip", "Flags");
        DebugManager.debug(showBuyTickets, "showBuyTickets", "Flags");
        DebugManager.debug(ignoreWingLevelDifference, "ignoreWingLevelDifference", "Flags");
        DebugManager.debug(ignoreWingLevelDifference, "ignoreWingLevelDifference", "Flags");
    
        DebugManager.debug(haveFlight, "haveFlight", "Debug");
        DebugManager.debug(systemEx, "SystemEx", "Debug");
        DebugManager.debug(createClass, "createClass", "Debug");
        DebugManager.debug(disposeClass, "disposeClass", "Debug");
    
        _stage.addEventListener(DebugEvent.SET_SILVER, testHandler);
        inited = true;

//        AccountModel.instance.hangarModel.globalEventModel.totalWar.turnOn();

//        FAKE_WAR_CACHE = true;
//        CONSOLE_FILTERED_INTERFACE_CALLS = true;
//        CONSOLE_FILTERED_INTERFACE_RESPONCES = true;
//        PERMANENT_TOOLTIPS = true;
//        TOOLTIPS_INFO = true;
//        IGNORE_LOGOUT = true;
//        ALL_QUESTS_FINISHED = true;
//        CONSTRUCTOR_INFO = true;
    
        //DEVELOPMENT MODE
//        NO_MODAL_WINDOWS = true;
        showConsole();

//        TweenLite.delayedCall(15, showBattleResult);
    }
    
    public static const LOAD_INFO_FILTER:Array = ["swf"];
    //Many pathCallers executed in constructors before DebugAssistant.init(), so in DEV mode hardcode this to true
    public static var SANDBOX_MODE:Boolean// = true;
    public static var LOAD_INFO:Boolean = true;
    public static var CONSTRUCTOR_INFO:Boolean = true;
    public static var WINDOWS_INFO:Boolean = true;
    public static var SAVE_STACK_ON_ASYNC_CALLS:Boolean = true;
    public static var SKIP_LOGIN_SCREEN:Boolean = true;
    
    public static var TRACE_INTERFACE_RESPONCES:Boolean// = true;
    public static var TRACE_INTERFACE_CALLS:Boolean// = true;
    public static var CONSOLE_ALL_INTERFACE_CALLS:Boolean// = true;
    public static var CONSOLE_ALL_INTERFACE_RESPONCES:Boolean// = true;
    public static var CONSOLE_FILTERED_INTERFACE_RESPONCES:Boolean// = true;
    public static var CONSOLE_FILTERED_INTERFACE_CALLS:Boolean// = true;
    
    
    public static function showConsole():void {
        Cc.start(_stage);
        Cc.commandLine = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
        Cc.config.flashTrace = false;
        Cc.visible = true;
        
        Cc.y = 0;
        Cc.width = 685;
//        Cc.height = _stage.stageHeight;
        Cc.height = 1095;
        Cc.config.alwaysOnTop = true;
        Cc.D_MODE = 0;
        
        if (LOAD_INFO && LOAD_INFO_FILTER.length) Ct.orange("LOAD_INFO_FILTER:", LOAD_INFO_FILTER);
        //TODO:SS Implement filters
        //if(DEFAULT_INTERFACE_FILTER.length) Ct.orange("DEFAULT_INTERFACE_FILTER:", DEFAULT_INTERFACE_FILTER);
        if ((CONSOLE_FILTERED_INTERFACE_RESPONCES || CONSOLE_FILTERED_INTERFACE_CALLS) && INTERFACE_SERVICE_FILTER.length) Ct.orange("INTERFACE_SERVICE_FILTER:", INTERFACE_SERVICE_FILTER);

//        Cc.spam = ["crew"];

//        Cc.x = 286;
//        Cc.x = 1235;
    }
    
    public static function isInLoadInfoFilter(value:String):Boolean {
        if (!LOAD_INFO) return false;
        
        if (!LOAD_INFO_FILTER || !LOAD_INFO_FILTER.length) return true;
        
        var lowerCaseValue:String = value.toLowerCase();
        for each (var search:String in LOAD_INFO_FILTER) {
            if (lowerCaseValue.indexOf(search.toLowerCase()) > -1) {
                return true;
            }
        }
        return false;
    }
    
    public static function colorTest():void {
        func1();
    }
    
    public static function func1():void {
        func2();
    }
    
    public static function func2():void {
        Ct.berryc("DA", "berryc", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.bluec("DA", "bluec", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.blue2c("DA", "blue2c", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.brownc("DA", "brownc", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.cyancw("DA", "cyancw", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.grassj("DA", "grassj", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.grass2c("DA", "grass2c", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.greenc("DA", "greenc", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.green2wj("DA", "green2wj", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.greyc("DA", "greyc", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.grey2c("DA", "grey2c", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.magenta("magenta", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.orangec("DA", "orangec", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.pinkc("DA", "pinkc", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.purplec("DA", "purplec", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.redc("DA", "redc", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.red2c("DA", "red2c", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.red3c("DA", "red3c", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.skycj("DA", "skycj", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.sky2cwj("DA", "sky2cwj", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.tealc("DA", "tealc", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.teal2c("DA", "teal2c", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.white("white", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.yellowc("DA", "yellowc", {arr: [1, 7, 8], str: "string"}, 789);
        Ct.yellow2c("DA", "yellow2c", {arr: [1, 7, 8], str: "string"}, 789);
    }
    
    
    public static function fakeBattleResult():void {
        FAKE_BATTLE_RESULT = !FAKE_BATTLE_RESULT;
        Ct.orange("fakeBattleResult:", FAKE_BATTLE_RESULT);
    }
    
    public static function fakeWarCache():void {
        FAKE_WAR_CACHE = !FAKE_WAR_CACHE;
        Ct.orange("fakeWarCache:", FAKE_WAR_CACHE);
    }
    
    public static function permanentTooltips():void {
        PERMANENT_TOOLTIPS = !PERMANENT_TOOLTIPS;
        Ct.orange("permanentTooltips:", PERMANENT_TOOLTIPS);
    }
    
    public static function longTooltip():void {
        LONG_TOOLTIP = !LONG_TOOLTIP;
        Ct.orange("longTooltip:", LONG_TOOLTIP);
    }
    
    public static function killTooltip():void {
        KILL_TOOLTIP = !KILL_TOOLTIP;
        Ct.orange("killTooltip:", KILL_TOOLTIP);
        _eventPipe.dispatchEvent(new HideTipEvent());
    }
    
    public static function showBuyTickets():void {
        SHOW_BUY_TICKETS = !SHOW_BUY_TICKETS;
        Ct.orange("showBuyTickets:", SHOW_BUY_TICKETS);
    }
    
    public static function ignoreWingLevelDifference():void {
        IGNORE_WING_LEVEL_DIFFERENCE = !IGNORE_WING_LEVEL_DIFFERENCE;
        Ct.orange("ignoreWingLevelDifference:", IGNORE_WING_LEVEL_DIFFERENCE);
    }
    
    public static function traceInterfaceResponces():void {
        TRACE_INTERFACE_RESPONCES = !TRACE_INTERFACE_RESPONCES;
        Ct.orange("traceInterfaceResponces:", TRACE_INTERFACE_RESPONCES);
    }
    
    public static function traceInterfaceCalls():void {
        TRACE_INTERFACE_CALLS = !TRACE_INTERFACE_CALLS;
        Ct.orange("traceInterfaceRequests:", TRACE_INTERFACE_CALLS);
    }
    
    public static function consoleAllInterfaceResponces():void {
        CONSOLE_ALL_INTERFACE_RESPONCES = !CONSOLE_ALL_INTERFACE_RESPONCES;
        Ct.orange("consoleAllInterfaceResponces:", CONSOLE_ALL_INTERFACE_RESPONCES);
    }
    
    public static function consoleAllInterfaceCalls():void {
        CONSOLE_ALL_INTERFACE_CALLS = !CONSOLE_ALL_INTERFACE_CALLS;
        Ct.orange("consoleAllInterfaceRequests:", CONSOLE_ALL_INTERFACE_CALLS);
    }
    
    public static function consoleFiltredInterfaceResponces():void {
        CONSOLE_FILTERED_INTERFACE_RESPONCES = !CONSOLE_FILTERED_INTERFACE_RESPONCES;
        Ct.orange("consoleFiltredInterfaceResponces:", CONSOLE_FILTERED_INTERFACE_RESPONCES);
    }
    
    public static function consoleFiltredInterfaceCalls():void {
        CONSOLE_FILTERED_INTERFACE_CALLS = !CONSOLE_FILTERED_INTERFACE_CALLS;
        Ct.orange("consoleFiltredInterfaceRequests:", CONSOLE_FILTERED_INTERFACE_CALLS);
    }
    
    public static function haveFlight():void {
        Ct.orange("haveFlight", FlightModel.instance.haveFlight);
    }
    
    private static var _addedInstances:Array = [];
    
    public static function disposeClass():void {
        Ct.orange("disposeClass", _addedInstances.length);
        var instance:*;
        for each(instance in _addedInstances) {
            _stage.removeChild(instance);
            if (instance.hasOwnProperty("dispose")) instance.dispose();
        }
        _addedInstances = [];
    }
    
    public static function createClass(value:String):void {
        var _class:Class = getDefinition(value, loaderInfo);
        if (!_class) return;
        
        var instance:* = new _class();
        
        if (instance is DisplayObject) {
            instance.x = instance.y = 500;
            _addedInstances.push(instance);
            _stage.addChild(instance);
        }
        Ct.orange("loaderInfo:", loaderInfo, "class:", _class, "instance:", instance);
    }
    
    public static function systemEx():void {
        Ct.orange("getStackTrace", SystemEx.getStackTrace(), "\n");
        var s:Sprite = new Sprite();
        s.name = "ASD1234567890";
        s.x = 1234;
        Ct.orange("describeType", SystemEx.describeType(s), "\n");
        Ct.orange("actionVerbose", SystemEx.actionVerbose, "\n");
        Ct.orange("getCodeFileName", SystemEx.getCodeFileName(), "\n");
        Ct.orange("getCodeFileNames", SystemEx.getCodeFileNames(), "\n");
        //Ct.orange("setBackgroundAlpha", SystemEx.setBackgroundAlpha(0), "\n");
    }
    
    public static function setExperience(value:Number = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.SET_EXPERIENCE, value, true, false));
    }
    
    public static function setGold(value:Number = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.SET_GOLD, value, true, false));
    }
    
    public static function setSilver(value:Number = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.SET_SILVER, value, true, false));
    }
    
    public static function minimum(value:int = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.MINIMUM, value, true, false));
    }
    
    public static function maximum(value:int = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.MAXIMUM, value, true, false));
    }
    
    public static function value(value:int = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.VALUE, value, true, false));
    }
    
    public static function position(value:int = 0):void {
        new EventPipe().dispatchEvent(new DebugEvent(DebugEvent.POSITION, value, true, false));
    }
    
    public static function testHandler(event:DataEvent = null):void {
        Ct.orangew("testHandler2", event, event.data);
    }
    
    public static function rewardTrack():void {
//        HangarModel.instance.gotoRewardTrack();
        hangarWindowsModel.showRewardTrackWindow();
    }
    
    public static function reInitLogin():void {
        Ct.orangecw("DebugAssistant", "reInitLogin");
        ExternalInterfaceProxy.call("initialized");
    }
    
    public static function setInitializationData(data:Object):void {
        Ct.orangecw("DebugAssistant", "setInitializationData", data);
    }
    
    public static function reloadLocalization():void {
        Ct.orangecw("DebugAssistant", "reloadLocalization");
        ExternalInterfaceProxy.call("Loader.GetLocalizationTable");
    }
    
    public static function debug(key:String):void {
//        Ct.orangechw("DebugAssistant", "debug", arr);
        if (ExternalInterface.available) {
            var asIs:String = ExternalInterfaceProxy.call("localize", key);
            var lowerCase:String = ExternalInterfaceProxy.call("localize", key.toLowerCase());
            var upperCase:String = ExternalInterfaceProxy.call("localize", key.toUpperCase());
            Ct.orange(key);
            if (asIs != key) Ct.orange("asIs: ", asIs);
            if (lowerCase != key.toLowerCase()) Ct.orange("lowerCase: ", lowerCase);
            if (upperCase != key.toUpperCase()) Ct.orange("upperCase: ", upperCase);
        }
    }
    
    private static function receiveLocalization2(arr:Array):void {
        Ct.orangecw("DebugAssistant", "receiveLocalization", arr);
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
        Ct.orange(sumAwards(a1));
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
        Ct.orangecw("getPlaneData", planeData, nationId, Nation.getStringNation(nationId));
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
    
        hangarWindowsModel.showLeaderboardCompletedWindow();
    }
    
    private static function showExchangeTicketsWindow():void {
        hangarWindowsModel.showExchangeCouponsWindow();
    }
    
    private static function showQuestData(id:*):void {
        var quest:QuestData = questsModel.getQuest(id);
        logQuestData(quest);
    }
    
    private static function showQuestDataAll():void {
        var quests:Array = questsModel.allItems;
//        Cc.grey2("quests:", quests.length);
        for (var i:int = 0; i < quests.length; i++) {
            logQuestData(quests[i]);
        }
    }
    
    private static function logQuestData(value:QuestData):void {
//        Cc.cyan(value.shortInfo(), value);
    }
    
    private static function showQuestWindow(id:*):void {
        if (id is int) {
            hangarWindowsModel.showQuestWindow(null, id);
        } else if (id is String) {
            hangarWindowsModel.showQuestWindow(id, 0);
        }
    }
    
    private static function showBattleResult():void {
        FAKE_BATTLE_RESULT = true;
        hangarWindowsModel.showBattleResultWindow("debug", true);
    }
    
    private static function showTotalWarRules():void {
        hangarWindowsModel.showTotalWarRulesWindow();
    }
    
    private static function showTotalWarRules1():void {
        hangarWindowsModel.showTotalWarRulesWindow(0);
    }
    
    private static function showTotalWarRules2():void {
        hangarWindowsModel.showTotalWarRulesWindow(1);
    }
    
    private static function showTotalWarRules3():void {
        hangarWindowsModel.showTotalWarRulesWindow(2);
    }
    
    private static function showTickets():void {
        hangarWindowsModel.showTicketsWindow({payLoad: {tabID: TicketsWindowTabID.DEFAULT}});
    }
    
    private static function showInventory():void {
        hangarWindowsModel.showTicketsWindow({payLoad: {tabID: TicketsWindowTabID.INVENTORY}});
    }
    
    private static function showWarCache():void {
        hangarWindowsModel.showTicketsWindow({payLoad: {tabID: TicketsWindowTabID.WAR_CACHE}});
    }
}
}