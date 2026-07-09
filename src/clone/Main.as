package clone {

import flash.display.Sprite;
import flash.net.registerClassAlias;
import flash.utils.ByteArray;

public class Main extends Sprite {
    
    public function Main() {
        runTest();
    }
    
    private function runTest():void {
        trace("=== 1. INITIALIZING ORIGINAL OBJECT ===");
        var original:ComplexAward = new ComplexAward();
        original.id = 777;
        original.publicName = "Original Medal";
        original.title = "Epic Win";
        original.child = new ChildData("Sub-Item Alpha");
        original.rawData = { gold: 500 };
        
        // Run the generator ONCE before any clones are made
        original.generateRuntimeUid();
        
        trace("Original: " + original.toString());
        trace("--------------------------------------------------\n");
        
        
        trace("=== 2. CLONING WITH BYTEARRAY (NO ALIAS REGISTERED) ===");
        var byteCloneNoAlias:Object;
        try {
            var ba1:ByteArray = new ByteArray();
            ba1.writeObject(original);
            ba1.position = 0;
            byteCloneNoAlias = ba1.readObject();
            
            trace("Result: " + byteCloneNoAlias.toString());
            trace("Is proper ComplexAward instance? " + (byteCloneNoAlias is ComplexAward));
        } catch (e:Error) {
            trace("Failed/Crashed: " + e.message);
        }
        trace("--------------------------------------------------\n");
        
        
        trace("=== 3. REGISTERING ALIAS AND CLONING WITH BYTEARRAY ===");
        registerClassAlias("AwardData", ComplexAward);
        registerClassAlias("ChildData", ChildData);
        
        var byteCloneWithAlias:ComplexAward;
        try {
            var ba2:ByteArray = new ByteArray();
            ba2.writeObject(original);
            ba2.position = 0;
            byteCloneWithAlias = ba2.readObject() as ComplexAward;
            
            trace("Result: " + byteCloneWithAlias.toString());
            trace("Is proper ComplexAward instance? " + (byteCloneWithAlias is ComplexAward));
        } catch (e:Error) {
            trace("Failed/Crashed: " + e.message);
        }
        trace("--------------------------------------------------\n");
        
        
        trace("=== 4. USING INTERNAL MANUAL CLONE METHOD ===");
        var manualClone:ComplexAward = original.manualClone();
        trace("Result: " + manualClone.toString());
        trace("Is proper ComplexAward instance? " + (manualClone is ComplexAward));
        trace("--------------------------------------------------\n");
        
        
        trace("=== 5. USING AUTOMATED REFLECTION CLONE METHOD ===");
        var reflectionClone:ComplexAward = original.reflectionClone();
        trace("Result: " + reflectionClone.toString());
        trace("Is proper ComplexAward instance? " + (reflectionClone is ComplexAward));
        trace("--------------------------------------------------\n");
        
        
        trace("=== 6. VERIFYING UNLINKED MUTATIONS ===");
        // Mutate the original to prove links are broken across all pipelines
        original.publicName = "MUTATED NAME";
        original.child.childName = "MUTATED CHILD";
        original.rawData.gold = 9999;
        
        trace("Original after changes:            " + original.toString());
        trace("ByteArray Clone No Alias output:   " + byteCloneNoAlias.toString());
        trace("ByteArray Clone with Alias output: " + byteCloneWithAlias.toString());
        trace("Manual Clone output:               " + manualClone.toString());
        trace("Reflection Clone output:           " + reflectionClone.toString());
    }
}
}