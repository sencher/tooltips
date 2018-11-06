/*
 * Copyright (c) 2013 Gamepoint. All Rights Reserved.
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
package legacy.math {

/**
 * 22.03.2013
 *
 * @author The following code was written by Amigo.
 *         Unless it doesn't work, then I have no idea who wrote it.
 */
public class IllegalArgumentError extends BigNumberError {

    /**
     * Constructs a new <code>IllegalArgumentError</code>
     *
     * @param message the message of this error.
     * @param id the numeric code of this error.
     */
    public function IllegalArgumentError(message:* = "", id:* = 0) {
        super(message, id);
    }
}

}