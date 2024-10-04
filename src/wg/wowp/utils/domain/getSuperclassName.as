package wowp.utils.domain {

import flash.utils.getQualifiedSuperclassName;

public function getSuperclassName(object:Object):String {
    return shortName(getQualifiedSuperclassName(object));
}
}
