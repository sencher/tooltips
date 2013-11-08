package {
    import flash.display.Sprite;

    import rtree.Cube;

    import utils.rtree.Cube;

    import utils.rtree.RTree;


    public class Test_rtree extends Sprite{
        internal var rtree:RTree = new RTree();
        public function Test_rtree() {
            var c1:Cube = new Cube(0,0,0,10,10,0);
            var c2:Cube = new Cube(5,5,0,15,15,0);
            rtree.addCube(c1,1)
            rtree.addCube(c2,2)
            trace(rtree.intersects(c1))
        }
    }
}
