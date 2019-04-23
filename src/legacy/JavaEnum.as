/*
 * Copyright (c) 2012 Gamepoint. All Rights Reserved.
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
 * 01.06.2012
 *
 * @author The following code was written by Amigo.
 *         Unless it doesn't work, then I have no idea who wrote it.
 */
public class JavaEnum {
    protected var name:String;

    public function JavaEnum(name:String) {
        this.name = name;
    }

    public function getID():Number {
        return 0;
    }

    public function toString():String {
        return name;
    }

    public function clone():*{
        return new this["constructor"](name);
    }
}
}