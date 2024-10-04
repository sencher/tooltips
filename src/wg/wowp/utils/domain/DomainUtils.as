package wowp.utils.domain {

import com.junkbyte.console.Ct;

import flash.display.LoaderInfo;
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
        if (!domain) {
            Ct.orangecw("DomainUtils", "domain null");
            domain = ApplicationDomain.currentDomain;
            if (!domain) Ct.red2c("DomainUtils", "ApplicationDomain.currentDomain null");
        }
        
        if (!domain.hasOwnProperty("getQualifiedDefinitionNames")) {
            return null;
        }
        
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
    
    public static function getDefinition(name:String, loaderInfo:LoaderInfo = null):Class {
        
        var domain:ApplicationDomain =
                (loaderInfo != null && loaderInfo.applicationDomain != null)
                        ? loaderInfo.applicationDomain
                        : ApplicationDomain.currentDomain;
        
        var result:Class;
        do {
            try {
                result = Class(DomainUtils.getDefinitionIgnorePrefix(name, domain));
                if (result) break;
            } catch (e) {
            }
            domain = domain.parentDomain;
        } while (domain != null)
        
        return result;
    }
}
}
