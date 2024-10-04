package wowp.utils.domain {

import com.junkbyte.console.Ct;

import flash.system.ApplicationDomain;

import wowp.core.error;

public function createObject(name:String, domain:ApplicationDomain = null):Object {
    var instance:Object;
    try {
        instance = new (getDefinition(name) as Class)();
    } catch (e:Error) {
        error("createObject <> Cannot create instance: " + name);
    }
    return instance;
}

}