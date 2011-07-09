/*---------------------------------------------------------------
    *
    * MainForm Support
    *
    ---------------------------------------------------------------*/
    def bldgtype
    def bldgkind 
    
    def onselectBldgType = { bt ->
        rpu.info.putAll( bt )
        bldgtype                = bt.bldgtypename 
    }
    
    def lookupBldgType() {
        return InvokerUtil.lookupOpener('bldgtype.lookup', [onselect:onselectBldgType, searchText:bldgtype])
    }
    
    def onselectBldgKind = { bk ->
        rpu.info.putAll( bk )
        bldgkind = bk.bldgkindname 
    }
    
    def lookupBldgType() {
        return InvokerUtil.lookupOpener('bldgkind.lookup', [onselect:onselectBldgKind, searchText:bldgkind])
    }
    