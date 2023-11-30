package utils.wg.data.binding.presets.clik
{
    import flash.events.Event;
    import wowp.utils.data.binding.core.IBindingModel;
    import wowp.utils.data.binding.EventBinder;


    public class ButtonChangeBinder extends EventBinder
    {

        public function ButtonChangeBinder(model:IBindingModel)
        {
            super(model, Event.CHANGE, "selectedIndex");
        }

    }

}
