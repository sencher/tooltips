public function modal(value:Boolean = true):HangarWindowController {
	_isModal = value;
	return this;
}

public function overlap(value:Boolean = true):HangarWindowController {
	_isOverlap = value;
	return this;
}

public function dontSortOnMouseDown(value:Boolean = false):HangarWindowController {
	_sortOnMouseDown = value;
	return this;
}

public function openOnBottom(value:Boolean = true):HangarWindowController {
	_openOnBottom = value;
	return this;
}

public function putUnder(value:String):HangarWindowController {
	_putUnder = value;
	return this;
}

public function owner(value:Sprite):HangarWindowController {
	_owner = value;
	return this;
}

public function defaultPayLoad(value:Object):HangarWindowController {
	_defaultPayLoad = value;
	return this;
}

public function dontCloseByEscape(value:Boolean = false):HangarWindowController {
	_closeByEscape = value;
	return this;
}

public function skipEscape(value:Boolean = true):HangarWindowController {
	_skipEscape = value;
	return this;
}

public function dontCache(value:Boolean = false):HangarWindowController {
	_cache = value;
	return this;
}

public function disableTempEmptyWindow(value:Boolean = false):HangarWindowController {
	_tempEmptyWindowEnabled = value;
	return this;
}

public function hangarOnly(value:Boolean = true):HangarWindowController {
	_hangarOnly = value;
	_onVisibleFlagChanged.fire();
	return this;
}


public function hideInCustomTab(value:Boolean = true):HangarWindowController {
	_hideInCustomTab = value;
	_onVisibleFlagChanged.fire();
	return this;
}