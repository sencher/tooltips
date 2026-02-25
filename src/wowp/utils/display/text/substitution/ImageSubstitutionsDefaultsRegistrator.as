package wowp.utils.display.text.substitution
{
	import flash.display.BitmapData;
	import flash.utils.describeType;
	
	import wowp.account.utils.loader.DomainItemsLoader;
	import wowp.utils.array.getFieldArray;
	import wowp.utils.display.cache.Cache;
	import wowp.utils.string.formatString;
	
	public class ImageSubstitutionsDefaultsRegistrator
	{
		public function ImageSubstitutionsDefaultsRegistrator():void {
			register();
		}
		
		private function register():void {
			var bitmapData:BitmapData;
			var template:String = "icons/onboarding/20x20/{0}.dds";
			var bitmapDataList:Array = [
				{placeholder: "icon_exp", path: "iconExp"},
				{placeholder: "icon_free_exp", path: "iconExpFree"},
				{placeholder: "icon_crew_exp", path: "iconCrewExp"},
				{placeholder: "icon_credits", path: "iconCurrencyCredits"},
				{placeholder: "icon_gold", path: "iconCurrencyGold"},
				{placeholder: "icon_ticket", path: "iconCurrencyTickets"},
				{placeholder: "icon_advice", path: "iconInfo"},
				{placeholder: "icon_advice_grey", path: "iconInfoGrey"},
				{placeholder: "icon_lmb", path: "iconMouseLMB"},
				{placeholder: "icon_rmb", path: "iconMouseRMB"},
				{placeholder: "icon_video", path: "iconVideo"},
				{placeholder: "icon_guide", path: "iconGuide"},
				{placeholder: "icon_directive", path: "iconDirective"},
				{placeholder: "icon_trophy", path: "iconTrophy"},
				{placeholder: "icon_personal_score", path: "iconBattleScore"},
				{placeholder: "icon_pilot", path: "iconCrewPilot"},
				{placeholder: "icon_gunner", path: "iconCrewGunner"},
				{placeholder: "icon_skill_point", path: "iconSkillPoint"},
				{placeholder: "icon_prem_shop", path: "iconPremiumShop"},
				{placeholder: "icon_quest", path: "iconMission"},
				{placeholder: "icon_squad", path: "iconFlight"},
				{placeholder: "icon_upgrade", path: "iconEquipUpgrade"},
				{placeholder: "icon_tech_level", path: "iconTechLevel"},
				{placeholder: "icon_calibrate", path: "iconEquipCalibrate"},
				{placeholder: "icon_rebuild", path: "iconEquipRebuild"},
				{placeholder: "icon_lock", path: "iconLock"},
				{placeholder: "icon_camouflage", path: "iconCamo"},
				{placeholder: "icon_emblem", path: "iconCamoEmblem"},
				{placeholder: "icon_noseart", path: "iconCamoNoseArt"},
				{placeholder: "icon_fighter", path: "iconClassFighter"},
				{placeholder: "icon_multi", path: "iconClassMulti"},
				{placeholder: "icon_heavy", path: "iconClassHeavy"},
				{placeholder: "icon_attacker", path: "iconClassAttack"},
				{placeholder: "icon_bomber", path: "iconClassBomber"},
				{placeholder: "icon_elite_fighter", path: "iconClassFighterElite"},
				{placeholder: "icon_prem_fighter", path: "iconClassFighterPremium"},
				{placeholder: "icon_specialist_fighter", path: "iconClassFighterSpecialist"},
				{placeholder: "icon_aag_light", path: "iconHUDObjectNeutralAAGuns"},
				{placeholder: "icon_aag_heavy", path: "iconHUDObjectNeutralAAGunsHigh"},
				{placeholder: "icon_defenders_light", path: "iconHUDDefenderNeutralFighter", sub: "ico_def_light"},
				{placeholder: "icon_defenders_heavy", path: "iconHUDDefenderNeutralHeavy", sub: "ico_def_heavy"},
				{placeholder: "icon_class_rank", path: "iconRank3"},
				{placeholder: "icon_medal", path: "iconAchievement"}
			];
			
			for each (var obj:Object in bitmapDataList) {
				obj.path = formatString(template, obj.path);
			}
			
			new DomainItemsLoader().loadFiles(getFieldArray(bitmapDataList, "path")).load(onLoaded);
			
			function onLoaded():void {
				trace("[ImageSubstitutionsDefaultsRegistrator] onLoaded");
				for each (var obj:Object in bitmapDataList) {
					if (!obj.sub) obj.sub = obj.placeholder;
					bitmapData = Cache.getLoadedContent(obj.path) as BitmapData;
					ImageSubstitutionsProcessor.registerIcon(
							new CustomImage(bitmapData,
									ImageSubstitutionsProcessor.getSubstring(obj.sub),
									obj.y ? obj.y : 15),
							ImageSubstitutionsProcessor.getSubstring(obj.placeholder)
					);
				}
			}
			
			//	default icons:
			var xml:XML = describeType(ImageSubstitutionIcons);
			for each(var x:XML in xml.variable) {
				var propName:String = x.@name.toString();
				var item:Object = ImageSubstitutionIcons[propName];
				if (item == null) continue;
				ImageSubstitutionsProcessor.registerIcon(item, item["DEFAULT_SUBSTRING"]);
			}
		}
	}
}
