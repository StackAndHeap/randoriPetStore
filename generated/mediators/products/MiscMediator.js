/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 11:08:26 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};
if (typeof mediators.products == "undefined")
	mediators.products = {};

mediators.products.MiscMediator = function() {
	this.miscService = null;
	this.appBus = null;
	this.grid = null;
	this.gridContainer = null;
	randori.behaviors.AbstractMediator.call(this);
	
};

mediators.products.MiscMediator.prototype.onRegister = function() {
	this.miscService.getAll().then($createStaticDelegate(this, this.handleResult));
};

mediators.products.MiscMediator.prototype.loadGrid = function(result) {
	var col1 = {id:"name", name:"Name", field:"name", sortable:true, formatter:null};
	var col2 = {id:"animal", name:"Animal", field:"animal", sortable:true, formatter:null};
	var col3 = {id:"picture", name:"Picture", field:"picture", sortable:true, formatter:null};
	var col4 = {id:"quantity", name:"quantity", field:"quantity", sortable:true, formatter:null};
	var col5 = {id:"about", name:"about", field:"about", sortable:true, formatter:null};
	var col6 = {id:"added", name:"added", field:"added", sortable:true, formatter:null};
	var columns = [col1, col2, col3, col4, col5, col6];
	var options = {};
	options.forceFitColumns = true;
	options.enableCellNavigation = true;
	options.enableColumnReorder = false;
	this.grid = new Slick.Grid(this.gridContainer, result, columns, options);
};

mediators.products.MiscMediator.prototype.handleResult = function(result) {
	this.loadGrid(result);
};

mediators.products.MiscMediator.prototype.onDeregister = function() {
};

$inherit(mediators.products.MiscMediator, randori.behaviors.AbstractMediator);

mediators.products.MiscMediator.className = "mediators.products.MiscMediator";

mediators.products.MiscMediator.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('Slick.Grid');
	return p;
};

mediators.products.MiscMediator.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'miscService', t:'services.MockMiscService', r:0, v:null});
			p.push({n:'appBus', t:'eventBus.AppEventBus', r:0, v:null});
			break;
		case 2:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			break;
		case 3:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'gridContainer'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

