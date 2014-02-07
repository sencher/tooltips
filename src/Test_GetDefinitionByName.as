//В следующем примере для создания оранжевого квадрата в рабочей области используется класс GetDefinitionByNameExample. Это можно сделать, выполнив следующие действия:
//        Объявляются переменные для оранжевого цвета фона и размера в 80 пикселей, которые позже будут использованы при рисовании квадрата.
//        В конструкторе классу Sprite назначается переменная ClassReference типа Class.
//        Создается экземпляр объекта ClassReference с именем instance.
//        Поскольку instance по ссылке является объектом Sprite, квадрат можно нарисовать и добавить в список отображения с помощью методов, доступных классу Sprite.
package {
    import definition.Widget;

    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.utils.getDefinitionByName;

    public class Test_GetDefinitionByName extends Sprite {
        private var bgColor:uint = 0xFFCC00;
        private var size:uint = 80;

        public function Test_GetDefinitionByName() {
//            var ClassReference:Class = getDefinitionByName("flash.display.Sprite") as Class;
//            var instance:Object = new ClassReference();
//            instance.graphics.beginFill(bgColor);
//            instance.graphics.drawRect(0, 0, size, size);
//            instance.graphics.endFill();
//            addChild(DisplayObject(instance));


            var widgetClass:Class = getDefinitionByName("definition.Widget") as Class;
            var widgetInstance:Object = new widgetClass();
            widgetInstance.test();

            //-includes definition.Widget
            //or Widget; here
            //to additional compiler options (and then everything will work ;))
            //http://help.adobe.com/en_US/flex/using/WS2db454920e96a9e51e63e3d11c0bf 69084-7a92.html
        }
    }
}