package wowp.utils.debug {

import com.junkbyte.console.Cc;

import wowp.account.model.AccountModel;
import wowp.account.model.quest.QuestAwardID;
import wowp.account.model.warCache.WarCachePrizeVO;
import wowp.account.utils.account_model_internal;
import wowp.account.utils.loader.AchievementsModelWrapper;
import wowp.account.utils.loader.AllActionDiscountQuestLoadedWrapper;
import wowp.account.utils.loader.AllObjectiveQuestLoadedWrapper;
import wowp.account.utils.loader.AllPlanesLoadingWrapper;
import wowp.account.utils.loader.AllQuestLoadedWrapper;
import wowp.account.utils.loader.AllWarCachesLoadedWrapper;
import wowp.account.utils.loader.BaseModelWrapper;
import wowp.account.utils.loader.BomberPartModelWrapper;
import wowp.account.utils.loader.CollectionWrapper;
import wowp.account.utils.loader.CrewMemberLoader;
import wowp.account.utils.loader.CrewSkillModelWrapper;
import wowp.account.utils.loader.DiscountsLoadedWrapper;
import wowp.account.utils.loader.ExtraDomainDataLoader;
import wowp.account.utils.loader.FileLoaderWrapper;
import wowp.account.utils.loader.IVOCollectionLoader;
import wowp.account.utils.loader.LeaderBoardModelWrapper;
import wowp.account.utils.loader.PlanesModelWrapper;
import wowp.account.utils.loader.TotemsModelWrapper;
import wowp.core.api.debug.DebugManager;
import wowp.utils.array.getFirstKey;
import wowp.utils.array.getKeyArray;
import wowp.utils.data.binding.Signal;
import wowp.utils.data.binding.SignalOnce;

use namespace account_model_internal;

public class dDomainItemsLoader {
    private const _wrappers:Vector.<BaseModelWrapper> = new <BaseModelWrapper>[];
    public const onLoaded:Signal = new Signal();
    public const onLoadedOnce:SignalOnce = new SignalOnce();
    protected static var _onDebug:Signal = new Signal();
    private static var _initialized:Boolean = false;
    private var _autoDispose:Boolean = false;
    private var _ammoPacks:BaseModelWrapper;
    private var _consumables:BaseModelWrapper;
    private var _accountConsumables:BaseModelWrapper;
    private var _equipmentRecipes:BaseModelWrapper;
    private var _equipmentInstances:BaseModelWrapper;
    private var _pieces:BaseModelWrapper;
    private var _camouflages:BaseModelWrapper;
    private var _upgrades:BaseModelWrapper;
    private var _planes:BaseModelWrapper;
    private var _leaderboards:BaseModelWrapper;
    private var _bomberParts:BaseModelWrapper;
    private var _files:BaseModelWrapper;
    private var _achievements:BaseModelWrapper;
    private var _crewSkills:BaseModelWrapper;
    private var _crewMember:BaseModelWrapper;
    private var _allQuests:BaseModelWrapper;
    private var _allObjectiveQuests:BaseModelWrapper;
    private var _planesStages:BaseModelWrapper;
    private var _gameEventObjects:BaseModelWrapper;
    private var _allPlanes:BaseModelWrapper;
    private var _totems:BaseModelWrapper;
    private var _warCaches:BaseModelWrapper;
    private var _discounts:BaseModelWrapper;
    private var _actionDiscountQuests:BaseModelWrapper;
    private var _fractions:BaseModelWrapper;
    private var _nations:BaseModelWrapper;
    private var _alliances:BaseModelWrapper;
    private var _extra:BaseModelWrapper;
    private var _isInited:Boolean;
    
    private static function initDebug():void {
        _initialized = true;
        DebugManager.debug(debug, "DebugDomainLoader", "Account");
    }
    
    private static function debug():void {
        _onDebug.fire();
    }
    
    public function dDomainItemsLoader(autoDispose:Boolean = true) {
        _autoDispose = autoDispose;
        if (!_initialized) {
            initDebug();
        }
    }
    
    private var _isLoaded:Boolean = false;
    
    public function get isLoaded():Boolean {
        return _isLoaded;
    }
    
    private var _isLoading:Boolean = false;
    
    public function get isLoading():Boolean {
        return _isLoading;
    }
    
    public function init():void {
        if (!_isInited) {
            _isInited = true;
            var am:AccountModel = AccountModel.instance;
            _ammoPacks = registerLoader(new CollectionWrapper(am.ammoPacks, "ammopacks"));
            _consumables = registerLoader(new CollectionWrapper(am.consumables, "consumables"));
            _accountConsumables = registerLoader(new CollectionWrapper(am.accountConsumablesModel.consumablesCollection,
                    "account consumables"));
            _equipmentRecipes = registerLoader(new CollectionWrapper(am.equipmentRecipes, "equipment recipes"));
            _equipmentInstances = registerLoader(new CollectionWrapper(am.equipmentInstances,
                    "equipment instances"));
            _pieces = registerLoader(new CollectionWrapper(am.equipmentPieces, "pieces"));
            _camouflages = registerLoader(new CollectionWrapper(am.camouflages, "camouflages"));
            _upgrades = registerLoader(new CollectionWrapper(am.upgrades, "upgrades"));
            _planes = registerLoader(new PlanesModelWrapper());
            _bomberParts = registerLoader(new BomberPartModelWrapper());
            _files = registerLoader(new FileLoaderWrapper());
            _achievements = registerLoader(new AchievementsModelWrapper());
            _crewSkills = registerLoader(new CrewSkillModelWrapper());
            _crewMember = registerLoader(new CrewMemberLoader());
            _allQuests = registerLoader(new AllQuestLoadedWrapper());
            _allObjectiveQuests = registerLoader(new AllObjectiveQuestLoadedWrapper());
            _planesStages = registerLoader(new CollectionWrapper(am.planesStages, "plane stages"));
            _gameEventObjects = registerLoader(new CollectionWrapper(am.gameEventObjects, "game event objects"));
            _allPlanes = registerLoader(new AllPlanesLoadingWrapper());
            _leaderboards = registerLoader(new LeaderBoardModelWrapper());
            _totems = registerLoader(new TotemsModelWrapper());
            _warCaches = registerLoader(new AllWarCachesLoadedWrapper());
            _discounts = registerLoader(new DiscountsLoadedWrapper());
            _fractions = registerLoader(new CollectionWrapper(am.equipmentsModel.fraction,
                    "fractions"));
            _extra = registerLoader(new ExtraDomainDataLoader());
            _actionDiscountQuests = registerLoader(new AllActionDiscountQuestLoadedWrapper());
            _nations = registerLoader(new IVOCollectionLoader(am.nationsModel._nations, "nation list"));
            _alliances = registerLoader(new IVOCollectionLoader(am.nationsModel._alliances, "alliance list"));
        }
    }
    
    public function dispose():void {
        for each(var w:BaseModelWrapper in _wrappers) {
            w.onLoaded.remove(loadedHandler);
            w.dispose();
        }
        dDomainItemsLoader._onDebug.remove(traceDebug);
    }
    
    public function clear():void {
        onLoadedOnce.dispose();
        _isLoaded = false;
        _isLoading = false;
        for each(var w:BaseModelWrapper in _wrappers) {
            w.clear();
        }
    }
    
    public function load(callback:Function = null):void {
        dDomainItemsLoader._onDebug.add(traceDebug);
        if (callback != null) {
            onLoadedOnce.add(callback);
        }
        if (_isInited) {
            for each(var w:BaseModelWrapper in _wrappers) {
                w.load();
            }
            _isLoading = true;
            loadedHandler();
        } else {
            dispatchLoaded();
        }
    }
    
    public function ammoPacks(ids:Array):dDomainItemsLoader {
        init();
        _ammoPacks.addIds(ids);
        return this;
    }
    
    public function consumables(ids:Array):dDomainItemsLoader {
        init();
        _consumables.addIds(ids);
        return this;
    }
    
    public function accountConsumables(ids:Array):dDomainItemsLoader {
        init();
        _accountConsumables.addIds(ids);
        return this;
    }
    
    public function equipmentRecipes(ids:Array):dDomainItemsLoader {
        init();
        _equipmentRecipes.addIds(ids);
        return this;
    }
    
    public function pieces(ids:Array):dDomainItemsLoader {
        init();
        _pieces.addIds(ids);
        return this;
    }
    
    public function equipmentInstances(ids:Array):dDomainItemsLoader {
        init();
        _equipmentInstances.addIds(ids);
        return this;
    }
    
    public function camouflages(ids:Array):dDomainItemsLoader {
        init();
        _camouflages.addIds(ids);
        return this;
    }
    
    public function planes(ids:Array):dDomainItemsLoader {
        init();
        _planes.addIds(ids);
        return this;
    }
    
    public function upgrades(ids:Array):dDomainItemsLoader {
        init();
        _upgrades.addIds(ids);
        return this;
    }
    
    public function loadBomberParts(ids:Array):dDomainItemsLoader {
        init();
        _bomberParts.addIds(ids);
        return this;
    }
    
    public function loadFiles(paths:Array):dDomainItemsLoader {
        init();
        _files.addIds(paths);
        return this;
    }
    
    public function loadAchievements(ids:Array):dDomainItemsLoader {
        init();
        _achievements.addIds(ids);
        return this;
    }
    
    public function loadCrewSkills(ids:Array):dDomainItemsLoader {
        //Cc.green2cw(this, "loadCrewSkills", ids);
        init();
        _crewSkills.addIds(ids);
        return this;
    }
    
    public function crewMembers(ids:Array):dDomainItemsLoader {
        //Cc.green2cw(this, "crewMembers", ids);
        init();
        _crewMember.addIds(ids);
        return this;
    }
    
    public function allQuests():dDomainItemsLoader {
        init();
        _allQuests.addIds([-1]);
        return this;
    }
    
    public function allActionDiscountQuests():dDomainItemsLoader {
        init();
        _actionDiscountQuests.addIds([-1]);
        return this;
    }
    
    public function allObjectiveQuests():dDomainItemsLoader {
        init();
        _allObjectiveQuests.addIds([-1]);
        return this;
    }
    
    public function allLeaderBoards():dDomainItemsLoader {
        init();
        _leaderboards.addIds([-1]);
        return this;
    }
    
    public function planesStages(ids:Array):dDomainItemsLoader {
        init();
        _planesStages.addIds(ids);
        return this;
    }
    
    public function gameEventObjects(ids:Array):dDomainItemsLoader {
        init();
        _gameEventObjects.addIds(ids);
        return this;
    }
    
    public function allPlanes():dDomainItemsLoader {
        init();
        _allPlanes.addIds([-1]);
        return this;
    }
    
    public function allTotems():dDomainItemsLoader {
        init();
        _totems.addIds([-1]);
        return this;
    }
    
    public function allWarCaches():dDomainItemsLoader {
        init();
        _warCaches.addIds([-1]);
        return this;
    }
    
    public function discounts():dDomainItemsLoader {
        init();
        _discounts.addIds([-1]);
        return this;
    }
    
    public function fractions(ids:Array):dDomainItemsLoader {
        init();
        _fractions.addIds(ids);
        return this;
    }
    
    public function nations(ids:Array):dDomainItemsLoader {
        init();
        _nations.addIds(ids);
        return this;
    }
    
    public function alliance(ids:Array):dDomainItemsLoader {
        init();
        _alliances.addIds(ids);
        return this;
    }
    
    public function parse(items:Object):dDomainItemsLoader {
        //Cc.green2cw(this, "parse", items);
        var len:int = items.length;
        var key:String;
        for (var i:int = 0; i < len; i++) {
            var data:Object = items[i];
            if (data == null) continue;
            //Cc.green2c(this, data.type);
            switch (data.type) {
                case QuestAwardID.PIECE:
                    pieces([data.id]);
                    break;
                case QuestAwardID.EQUIPMENT:
                    equipmentRecipes([data.id]);
                    break;
                case QuestAwardID.EQUIPMENT_INSTANCE:
                    equipmentInstances([data.id]);
                    break;
                case QuestAwardID.AMMO_PACK:
                    ammoPacks([data.id]);
                    break;
                case QuestAwardID.CONSUMABLE:
                    consumables([data.id]);
                    break;
                case QuestAwardID.ACHIEVEMENTS:
                case QuestAwardID.GAME_EVENT_OBJECT:
                    loadAchievements([data.id]);
                    if (data.value) {
                        loadAchievements(getKeyArray(data.value));
                    }
                    break;
                case QuestAwardID.CAMOUFLAGE:
                    if (data.id) camouflages([data.id]);
                    break;
                case QuestAwardID.CREW:
                    //Cc.redch(this, "CREW", data, data.id);
//                    if (data.id) crewMembers([data.id]);
                    if (data.hasOwnProperty("kwargs")) {
                        if (!data.hasOwnProperty("ui")) {
                            data.ui = {};
                        }
                        for (key in data.kwargs) {
                            data.ui[key] = data.kwargs[key];
                        }
                    }
                    if (data.planeID && !data.ui.planeID) data.ui.planeID = data.planeID;
                    if (data.ui && data.ui.skillLevel == 100 && !data.ui.hasOwnProperty("skillPoints")) {
                        data.ui.skillPoints = 1;
                    }
                    if (data.ui && data.ui.planeID) planes([data.ui.planeID]);
                    break;
                case QuestAwardID.CREW_MEMBER:
                    //Cc.redch(this, "CREW_MEMBER", data, data.id);
                    if (data.id) crewMembers([data.id]);
                    if (data.hasOwnProperty("kwargs")) {
                        if (!data.hasOwnProperty("ui")) {
                            data.ui = {};
                        }
                        for (key in data.kwargs) {
                            data.ui[key] = data.kwargs[key];
                        }
                    }
                    if (data.planeID && !data.ui.planeID) data.ui.planeID = data.planeID;
                    if (data.ui && data.ui.skillLevel == 100 && !data.ui.hasOwnProperty("skillPoints")) {
                        data.ui.skillPoints = 1;
                    }
                    if (data.ui && data.ui.planeID) planes([data.ui.planeID]);
                    break;
                case WarCachePrizeVO.PLANE_COMPENSATION:
                case QuestAwardID.PLANE:
                case QuestAwardID.RENT:
                    planes([data.id]);
                    break;
                case QuestAwardID.UNLOCK_PLANE:
                    planes([getFirstKey(data.value)]);
                    break;
                case QuestAwardID.MISSION:
                    allQuests();
                    break;
                case QuestAwardID.TOTEM:
                    allTotems();
                case QuestAwardID.WAR_CACHE:
                    allWarCaches();
                    break;
                case QuestAwardID.ACCOUNT_CONSUMABLE:
                    accountConsumables([data.id]);
                    break;
                case QuestAwardID.DISCOUNT:
                    discounts();
                    break;
            }
        }
        return this;
    }
    
    private function registerLoader(wrapper:BaseModelWrapper):BaseModelWrapper {
        wrapper.onLoaded.add(loadedHandler);
        _wrappers.push(wrapper);
        return wrapper;
    }
    
    private function loadedHandler():void {
//        Cc.green2cw(this, "loadedHandler");
        if (_isLoading) {
            for each(var w:BaseModelWrapper in _wrappers) {
                if (!w.isAllLoaded) {
//                    Cc.green2c(this, w,"all is not loaded >>> return");
                    return;
                }
            }
            dispatchLoaded();
        }
    }
    
    private function traceDebug():void {
        for each(var wrapper:BaseModelWrapper in _wrappers) {
            if (!wrapper.isAllLoaded) {
                trace("##### ", wrapper.name, ":", wrapper.getPendingIDs());
            }
        }
    }
    
    private function dispatchLoaded():void {
        _isLoaded = true;
        _isLoading = false;
        onLoaded.fire();
        onLoadedOnce.fire();
        if (_autoDispose) {
            dispose();
        }
    }
}
}

