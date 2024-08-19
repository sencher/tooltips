package wowp.utils.domain {

import com.junkbyte.console.Cc;
import com.junkbyte.console.Ct;

import flash.display.LoaderInfo;
import flash.system.ApplicationDomain;

//import wowp.core.error;

public function getDefinition(name:String, loaderInfo:LoaderInfo = null):Class {
    var domain:ApplicationDomain = ApplicationDomain.currentDomain;
    if (loaderInfo != null && loaderInfo.applicationDomain != null) domain = loaderInfo.applicationDomain;
    var result:Class;
    try {
        result = domain.getDefinition(name) as Class;
    } catch (e) {
//        error( "getDefinition", name, "loaderInfo:", loaderInfo, "domain:", domain);
    }
    
    Cc.orangecw(this, "getDefinition.result", result);
//    if (!result) error( "getDefinition", name, "loaderInfo:", loaderInfo, "domain:", domain);
    
    return result;
}
}
