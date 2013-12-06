package {
    import flash.display.Sprite;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.net.URLVariables;

    public class Test_WebPage extends Sprite {

        public function Test_WebPage() {
            var url:String = "http://www.google.com";
            var request:URLRequest = new URLRequest(url);

            var variables:URLVariables = new URLVariables();
            variables.exampleSessionId = new Date().getTime();
            variables.exampleUserLabel = "guest";
            request.data = variables;
            request.method = URLRequestMethod.POST;

            navigateToURL(request);
        }
    }
}