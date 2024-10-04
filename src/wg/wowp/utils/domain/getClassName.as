package wowp.utils.domain {

import flash.utils.getQualifiedClassName;

public function getClassName(object:Object):String {
    return shortName(getQualifiedClassName(object));
}
}
