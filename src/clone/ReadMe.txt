The Cheat-Sheet for Your Future Review (Months from Now)
When you look back at these logs later, here is the quick breakdown of how every method handles complex properties:

ByteArray (No Alias): Flattens your class definition completely. Drops all custom types, custom namespaces, methods, and properties. Reverts to a plain anonymous object [object Object]. Calling methods on it crashes the game.

ByteArray (With Alias): Successfully recovers the type traits, executes the default parameterless constructor from the registry, handles properties exposed via public getters/setters flawlessly, but skips internal raw private/protected fields completely.

Brute-Force Reflection (describeType + String Brackets): Reconstructs a proper class instance, but dynamic string lookup inside brackets (instance["privateVar"]) targets the public namespace, causing it to bypass strictly hidden private fields.

Manual Custom Clone (manualClone): The undisputed king for data fidelity. It forces a clean constructor run for deep reference separation, allows you to deliberately retain, regenerate, or copy any internal private, protected, or nested sub-class fields safely using explicit references.

Key Takeaway on UIDs: 
- Fields set in the constructor (like _constructorUid) will be "fresh" in clones created via 'new Class()'.
- Fields set post-construction (like _runtimeUid) must be manually carried over if you want the clone to share that specific state.

https://gemini.google.com/share/68937e0b9f45
