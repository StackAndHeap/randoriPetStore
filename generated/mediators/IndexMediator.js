/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 14:35:26 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};

mediators.IndexMediator = function() {
	this.appBus = null;
	this.urlRouter = null;
	randori.behaviors.AbstractMediator.call(this);
	
};

$inherit(mediators.IndexMediator, randori.behaviors.AbstractMediator);

mediators.IndexMediator.className = "mediators.IndexMediator";

mediators.IndexMediator.getClassDependencies = function(t) {
	var p;
	return [];
};

mediators.IndexMediator.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'appBus', t:'eventBus.AppEventBus', r:0, v:null});
			p.push({n:'urlRouter', t:'router.URLRouter', r:0, v:null});
			break;
		case 2:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			break;
		case 3:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			break;
		default:
			p = [];
			break;
	}
	return p;
};

