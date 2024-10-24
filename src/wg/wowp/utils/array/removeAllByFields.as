package wowp.utils.array {

public function removeAllByFields(iterable:*, field:String, values:Array):* {
    if(!iterable || !iterable.length) return null;
    
    if(!values || !values.length) return iterable;
    
    var result = iterable.concat();
    result.length = 0;
    var i, item, v, value, skip;
    for(i = 0; i < iterable.length; i++){
        skip = false;
        item = iterable[i];
        for(v = 0; v < values.length; v++){
            value = values[v];
            if(item[field] == value){
                skip = true;
                break;
            }
        }
        
        if(!skip){
            result.push(item);
        }
    }
    
    return result;
}
}
