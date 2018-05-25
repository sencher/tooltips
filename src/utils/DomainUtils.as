/*
 * Copyright (c) 2018 Gamepoint. All Rights Reserved.
 *
 * @author Sergey Senkov
 */
package utils {
import flash.system.ApplicationDomain;
import flash.utils.getQualifiedClassName;

public class DomainUtils {

    public static function getPrefix(value:*):String {
        var prefix:String = getQualifiedClassName(value);
        return prefix ? prefix.substr(0, prefix.lastIndexOf(":") + 1) : null;
    }

    public static function getTypeIgnorePrefix(value:*):String {
        var type:String = getQualifiedClassName(value);
        return type ? type.substr(type.lastIndexOf(":") + 1) : null;
    }

    public static function getQualifiedDefinitionNamesIgnorePrefix(domain:ApplicationDomain = null):Vector.<String> {
        if (!domain) domain = ApplicationDomain.currentDomain;
        var list:Vector.<String> = domain.getQualifiedDefinitionNames();
        var i:int;
        var currentString:String;
        for (i = 0; i < list.length; i++) {
            currentString = list[i];
            list[i] = currentString.substr(currentString.lastIndexOf(":") + 1);
        }

        return list;
    }

    public static function hasDefinitionIgnorePrefix(value:String, domain:ApplicationDomain = null):Boolean {
        if (!domain) domain = ApplicationDomain.currentDomain;
        var list:Vector.<String> = getQualifiedDefinitionNamesIgnorePrefix(domain);
        return Boolean(list.indexOf(value));
    }

    public static function getDefinitionIgnorePrefix(value:String, domain:ApplicationDomain = null):Object {
        if (!domain) domain = ApplicationDomain.currentDomain;
        var listShort:Vector.<String> = getQualifiedDefinitionNamesIgnorePrefix(domain);
        var listFull:Vector.<String> = domain.getQualifiedDefinitionNames();
        var id:Number = listShort.indexOf(value);
        return id > -1 ? domain.getDefinition(listFull[id]) : null;
    }
}
}
