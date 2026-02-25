package wowp.utils.data
{
    
    public function among(value:Object, ...rest):Boolean {
        return rest.indexOf(value) != -1;
    }
    
}
