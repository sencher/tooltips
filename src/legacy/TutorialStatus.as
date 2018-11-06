/*
 * Copyright (c) 2018 GamePoint. All Rights Reserved.
 * 
 * Woe to the traitor who tries to penetrate my secrets and to stretch forth a sacrilegious
 * hand toward my code. May all calamities and disgrace fall on him! May hunger twist his
 * entrails, and sleep flee from his bloodshot eyes! May the hand of the man wither who
 * hastens to him with rescue and pities him in his misery! May the bread on his table turn
 * into rottenness, and the wine into stinking juice! May his children die out, and his house
 * be filled with bastards who will spit on him and expel him! May he die groaning through many
 * days in loneliness, and may neither earth nor water receive his vile carcass, may no fire burn
 * it, no wild beasts devour it! And may his soul, torn by its sins, wander without rest,
 * through dark places.
 */
package legacy {

/**
 * 27.06.2018
 *
 * @author The following code was written by Amigo.
 *         Unless it doesn't work, then I have no idea who wrote it.
 */
public final class TutorialStatus extends JavaEnum {
    public static const enabled:TutorialStatus = new TutorialStatus("enabled");
    public static const testing:TutorialStatus = new TutorialStatus("testing");

    public function TutorialStatus(name:String) {
        super(name);
    }

    public static function valueOf(name:String):TutorialStatus {
        switch (name) {
            case "enabled":
                return enabled;
            case "testing":
                return testing;

            default:
                throw new Error("IllegalArgumentException(No enum const TutorialStatus." + name);
        }
    }
}
}