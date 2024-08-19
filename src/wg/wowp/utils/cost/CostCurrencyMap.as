package wowp.utils.cost
{
	import wowp.account.constants.ColorConstants;
	import wowp.hangar.vo.CostVO;
	import wowp.utils.display.text.substitution.CertificatesSmallIcon;
	import wowp.utils.display.text.substitution.CertificatesSmallIconDisabled;
	import wowp.utils.display.text.substitution.CouponIcon;
	import wowp.utils.display.text.substitution.CouponIconDisabled;
	import wowp.utils.display.text.substitution.CouponSmallIcon;
	import wowp.utils.display.text.substitution.CouponSmallIconDisabled;
	import wowp.utils.display.text.substitution.CreditsIcon;
	import wowp.utils.display.text.substitution.CreditsIconDisabled;
	import wowp.utils.display.text.substitution.ExperienceIcon;
	import wowp.utils.display.text.substitution.ExperienceIconDisabled;
	import wowp.utils.display.text.substitution.FreeExperienceIcon;
	import wowp.utils.display.text.substitution.FreeExperienceIconDisabled;
	import wowp.utils.display.text.substitution.GoldIcon;
	import wowp.utils.display.text.substitution.GoldIconDisabled;
	import wowp.utils.display.text.substitution.GoldIconOff;
	
	public class CostCurrencyMap
	{
		public static const map:Array = [
			{
				name: "tickets",
				resourcesName: "tickets",
				color: ColorConstants.TICKET,
				colorDisabled: ColorConstants.TICKET_DISABLED,
				icon: CouponSmallIcon.DEFAULT_SUBSTRING,
				iconDisabled: CouponSmallIconDisabled.DEFAULT_SUBSTRING,
				bigIcon: CouponIcon.DEFAULT_SUBSTRING,
				bigIconDisabled: CouponIconDisabled.DEFAULT_SUBSTRING
			},
			{
				name: "gold",
				resourcesName: "gold",
				color: ColorConstants.GOLD,
				colorDisabled: ColorConstants.GOLD_DISABLED,
				icon: GoldIcon.DEFAULT_SUBSTRING,
				iconDisabled: GoldIconDisabled.DEFAULT_SUBSTRING,
				iconNotSynced: GoldIconOff.DEFAULT_SUBSTRING,
				notSynced: true
			},
			{
				name: "certificates",
				resourcesName: "certificates",
				color: ColorConstants.GOLD,
				colorDisabled: ColorConstants.GOLD_DISABLED,
				icon: CertificatesSmallIcon.DEFAULT_SUBSTRING,
				iconDisabled: CertificatesSmallIconDisabled.DEFAULT_SUBSTRING
			},
			{
				name: "freeExp",
				resourcesName: "experience",
				color: ColorConstants.FREE_EXP,
				colorDisabled: ColorConstants.FREE_EXP_DISABLED,
				icon: FreeExperienceIcon.DEFAULT_SUBSTRING,
				iconDisabled: FreeExperienceIconDisabled.DEFAULT_SUBSTRING
			},
			{
				name: "exp",
				resourcesName: null,
				color: ColorConstants.EXP,
				colorDisabled: ColorConstants.EXP_DISABLED,
				icon: ExperienceIcon.DEFAULT_SUBSTRING,
				iconDisabled: ExperienceIconDisabled.DEFAULT_SUBSTRING
			},
			{
				name: "credits",
				resourcesName: "credits",
				color: ColorConstants.CREDITS,
				colorDisabled: ColorConstants.CREDITS_DISABLED,
				icon: CreditsIcon.DEFAULT_SUBSTRING,
				iconDisabled: CreditsIconDisabled.DEFAULT_SUBSTRING
			}
		];
		
		public static function findFirstNotZero(costVO:CostVO):Object {
			for each (var currency:Object in CostCurrencyMap.map) {
				if (costVO[currency.name] != 0) {
					return currency;
				}
			}
			return null;
		}
	}
}
