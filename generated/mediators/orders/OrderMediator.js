/** Compiled by the Randori compiler v0.2.4 on Wed Jun 05 14:57:03 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};
if (typeof mediators.orders == "undefined")
	mediators.orders = {};

mediators.orders.OrderMediator = function() {
	this.appBus = null;
	this.service = null;
	this.grid = null;
	this.gridDiv = null;
	randori.behaviors.AbstractMediator.call(this);
	
};

mediators.orders.OrderMediator.prototype.onRegister = function() {
	this.service.get("assets\/data\/things.json", new services.json.parsers.MiscParser()).then($createStaticDelegate(this, this.handleResult));
};

mediators.orders.OrderMediator.prototype.loadGrid = function(result) {
	var col1 = {id:"name", name:"Name", field:"name", sortable:true, formatter:null};
	var col2 = {id:"animal", name:"Animal", field:"animal", sortable:true, formatter:null};
	var col3 = {id:"picture", name:"Picture", field:"picture", sortable:true, formatter:null};
	var col4 = {id:"quantity", name:"Quantity", field:"quantity", sortable:true, formatter:null};
	var col5 = {id:"about", name:"About", field:"about", sortable:true, formatter:null};
	var col6 = {id:"added", name:"Date added", field:"added", sortable:true, formatter:null};
	var columns = [col1, col2, col3, col4, col5, col6];
	var options = {};
	options.enableCellNavigation = true;
	options.enableColumnReorder = false;
	this.grid = new Slick.Grid(this.gridDiv, result, columns, options);
};

mediators.orders.OrderMediator.prototype.handleResult = function(result) {
	this.loadGrid(result);
};

mediators.orders.OrderMediator.prototype.onDeregister = function() {
};

$inherit(mediators.orders.OrderMediator, randori.behaviors.AbstractMediator);

mediators.orders.OrderMediator.className = "mediators.orders.OrderMediator";

mediators.orders.OrderMediator.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('services.json.parsers.MiscParser');
	p.push('Slick.Grid');
	return p;
};

mediators.orders.OrderMediator.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'service', t:'services.json.JsonService', r:0, v:null});
			p.push({n:'appBus', t:'eventBus.AppEventBus', r:0, v:null});
			break;
		case 2:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			break;
		case 3:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'gridDiv'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

