package ideaRefactoring {
import flash.display.Sprite;

public class Test_IdeaRefactoring extends Sprite{
    public function Test_IdeaRefactoring() {
        var a:RefactoringA = new RefactoringA();
        var b:RefactoringB = new RefactoringB();
        a.func();
        b.f2();
        RefactoringB.stat();

    }
}
}
