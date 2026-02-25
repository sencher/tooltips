package wowp.utils.display
{
    import flash.display.DisplayObject;
    
    public function safeRemove(child:DisplayObject):void {
        if(child!=null && child.parent!=null)child.parent.removeChild(child);
    }
    
}
