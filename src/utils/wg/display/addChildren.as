package utils.wg.display
{
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    
    public function addChildren(container:DisplayObjectContainer, ...children):void {
        for each(var child:DisplayObject in children) {
            container.addChild(child);
        }
    }
    
}
