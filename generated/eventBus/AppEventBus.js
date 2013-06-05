/** Compiled by the Randori compiler v0.2.4 on Wed Jun 05 10:13:17 CEST 2013 */

if (typeof eventBus == "undefined")
	var eventBus = {};

eventBus.AppEventBus = function() {
this.showModal = null;
this.rowDoubleClicked = null;
this.logout = null;
this.allTabsRemoved = null;
this.nameChanged = null;
this.login = null;
this.tabClicked = null;
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
			p.push({n:'login', t:'randori.signal.SimpleSignal', r:0, v:null});
			p.push({n:'logout', t:'randori.signal.SimpleSignal', r:0, v:null});
			p.push({n:'nameChanged', t:'randori.signal.SimpleSignal', r:0, v:null});
			p.push({n:'showModal', t:'randori.signal.SimpleSignal', r:0, v:null});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

