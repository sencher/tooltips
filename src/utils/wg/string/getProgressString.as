package utils.wg.string {

import utils.wg.utils.string.*;

import wowp.account.constants.ColorConstants;
import wowp.hangar.quests.models.questConst.QuestAwardsColor;
import wowp.hangar.quests.models.vo.ProgressVO;
import wowp.hangar.quests.models.vo.QuestProgress;

public function getProgressString(progress:QuestProgress):String {
    if (!progress) {
        return "";
    }
    var st:String;
    var total:ProgressVO = progress.progressTotal;
    if (progress.isMultiple) {
        st = paint(
                formatNumber(total.currentValue) + "%",
                total.currentValue > 0 ?
                        QuestAwardsColor.PROGRESS_COLOR :
                        ColorConstants.TEXT_SECONDARY
        );
    } else {
        st = paint(
                formatNumber(total.currentValue),
                total.currentValue > 0 ?
                        QuestAwardsColor.PROGRESS_COLOR :
                        ColorConstants.TEXT_SECONDARY)
                + slash()
                + formatNumber(total.maxValue);
    }

    return st;
}
}

