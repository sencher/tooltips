package utils.wg {

import flash.display.DisplayObject;

import wowp.account.model.AccountModel;
import wowp.account.model.quest.QuestAwardID;
import wowp.data.ivo.compound.PlaneData;
import wowp.hangar.delivery.progress.utils.*;
import wowp.hangar.infoTips.InfoTipLayout;
import wowp.hangar.infoTips.utils.InfoTipBuilder;
import wowp.hangar.infoTips.utils.InfoTipFactory;
import wowp.hangar.infoTips.utils.ItemInfoUtils;
import wowp.hangar.quests.models.itemData.AwardData;
import wowp.hangar.quests.service.AwardDataFactory;
import wowp.utils.string.loc;
import wowp.utils.string.nbsp;

public class BasePopupLayoutBuilder {
    public static function buildHeader(reward:AwardData):DisplayObject {
        if (reward.type == QuestAwardID.PLANE) {
            var pd:PlaneData = AccountModel.instance.planesModel.getPlaneData(reward.id);
            var planeHeader:String = loc("TOOLTIPS_SUPERGIFT") + nbsp() + pd.staticDescription.description.name;
            var image:String = DeliveryProgressConstants.camouflageIcon(reward.id);
            
            return InfoTipBuilder.planeHeader(pd, planeHeader, image);
        } else if (reward.type == QuestAwardID.CREW_MEMBER) {
            reward = AwardDataFactory.instance.getAwardData(reward.data);
            switch (reward.id) {
                case 6:
                    reward.title = loc("LOBBY_UNIQUE_PILOT");
                    reward.subtitle = DeliveryProgressConstants.getDeerName();
                    break;
                default:
                    reward.title = ItemInfoUtils.getTrainedCrewMemberSpec(reward.data.ui.mainSkillID);
                    break;
                
            }
        }
        return InfoTipBuilder.rewardHeader(reward);
    }
    
    public static function buildToolTip(reward:AwardData, layout:InfoTipLayout):void {
        layout.mouseChildren = layout.mouseEnabled = false;
        
        if (reward == null) return;
        
        layout.append(buildHeader(reward));
        layout.append(InfoTipFactory.separator());
        
        var d:DisplayObject = InfoTipBuilder.description(reward.type, reward.item);
        
        if (d) {
            layout.append(d);
        }
    }
}
}
