/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 10:49:48 CEST 2013 */

if (typeof eventBus == "undefined")
	var eventBus = {};

eventBus.AppEventBus = function() {
this.rowDoubleClicked = null;
this.tabClicked = null;
this.allTabsRemoved = null;
};

eventBus.AppEventBus.className = "eventBus.AppEventBus";

eventBus.AppEventBus.getClassDependencies = function(t) {
	var p;
	return [];
};

eventBus.AppEventBus.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = [];
			p.push({n:'rowDoubleClicked', t:'randori.signal.SimpleSignal', r:0, v:null});
			p.push({n:'tabClicked', t:'randori.signal.SimpleSignal', r:0, v:null});
			p.push({n:'allTabsRemoved', t:'randori.signal.SimpleSignal', r:0, v:null});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

