/**
 * Created by SenCheR on 12.08.2015.
 */
package {
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.MouseEvent;
import flash.events.SecurityErrorEvent;
import flash.external.ExternalInterface;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.net.URLVariables;

[SWF(width=1440 , height=810, backgroundColor="0x000000", frameRate="60")]
public class Test_ExternalInterface extends Sprite {
    public function Test_ExternalInterface() {
        ExternalInterface.call("console.log", "YourString");
        var available:Boolean = ExternalInterface.available;
        trace (available);
        if(!available) return;

        // calls the external function "addNumbers"
        // passing two parameters, and assigning that function's result
        // to the variable "result"
        var param1:uint = 3;
        var param2:uint = 7;
        var result:uint = ExternalInterface.call("addNumbers", param1, param2);
        trace(result);

        function callMe(name:String):String
        {
            trace("callMe", name);
                var url:String = "http://api.flickr.com/services/rest/";
                var request:URLRequest = new URLRequest(url);
                var requestVars:URLVariables = new URLVariables();
                requestVars.api_key = "3c84c0ca7f9ae17842a370a3fbc90b63";
                requestVars.method = "flickr.test.echo";
                requestVars.format = "rest";
                requestVars.foo = "bar";
                requestVars.sessionTime = new Date().getTime();
                request.data = requestVars;
                request.method = URLRequestMethod.POST;

                var urlLoader:URLLoader = new URLLoader();
                urlLoader = new URLLoader();
                urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
                urlLoader.addEventListener(Event.COMPLETE, loaderCompleteHandler, false, 0, true);
                urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler, false, 0, true);
                urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler, false, 0, true);
                urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler, false, 0, true);
                for (var prop:String in requestVars) {
                    //trace("Sent: " + prop + " is: " + requestVars[prop]);
                }
                try {
                    urlLoader.load(request);
                } catch (e:Error) {
                    trace(e);
                }

            function loaderCompleteHandler(e:Event):void {
//                var responseVars = URLVariables( e.target.data );
                trace( "responseVars: " + e.target.data );

            }
            function httpStatusHandler( e:HTTPStatusEvent ):void {
                //trace("httpStatusHandler:" + e);
            }
            function securityErrorHandler( e:SecurityErrorEvent ):void {
                trace("securityErrorHandler:" + e);
            }
            function ioErrorHandler( e:IOErrorEvent ):void {
                //trace("ORNLoader:ioErrorHandler: " + e);
//                dispatchEvent( e );
            }
            return "busy signal";
        }
        ExternalInterface.addCallback("myFunction", callMe);
    }
}
}
