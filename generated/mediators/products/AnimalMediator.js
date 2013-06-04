/** Compiled by the Randori compiler v0.2.4 on Fri May 31 14:11:11 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};
if (typeof mediators.products == "undefined")
	mediators.products = {};

mediators.products.AnimalMediator = function() {
	this.gridContainer = null;
	this.appBus = null;
	this.service = null;
	this.grid = null;
	randori.behaviors.AbstractMediator.call(this);
	
};

mediators.products.AnimalMediator.prototype.onRegister = function() {
	this.service.get("assets\/data\/animals50.json", new services.parsers.AnimalParser()).then($createStaticDelegate(this, this.handleResult));
};

mediators.products.AnimalMediator.prototype.handleResult = function(result) {
	this.loadGrid(result);
};

mediators.products.AnimalMediator.prototype.loadGrid = function(result) {
	var col1 = {id:"name", name:"Name", field:"name", sortable:true, formatter:null};
	var col2 = {id:"age", name:"Age", field:"age", sortable:true, formatter:null};
	var col4 = {id:"animal", name:"Animal", field:"animal", sortable:true, formatter:null};
	var col5 = {id:"picture", name:"Picture", field:"picture", sortable:true, formatter:null};
	var col6 = {id:"gender", name:"Gender", field:"gender", sortable:true, formatter:null};
	var col7 = {id:"about", name:"About", field:"about", sortable:true, formatter:null};
	var col8 = {id:"registered", name:"Registered", field:"registered", sortable:true, formatter:null};
	var columns = [col1, col2, col4, col5, col6, col7, col8];
	var options = {};
	options.enableCellNavigation = true;
	options.enableColumnReorder = false;
	options.forceFitColumns = true;
	this.grid = new Slick.Grid(this.gridContainer, result, columns, options);
	var selectionModel = new Slick.RowSelectionModel();
	this.grid.setSelectionModel(selectionModel);
	this.grid.onSort.subscribe($createStaticDelegate(this, this.basicSortFunction));
	this.grid.onDblClick.subscribe($createStaticDelegate(this, this.cellDblClickHandler));
	this.grid.onClick.subscribe($createStaticDelegate(this, this.cellClickHandler));
	this.grid.onSelectedRowsChanged.subscribe($createStaticDelegate(this, this.rowChangedHandler));
};

mediators.products.AnimalMediator.prototype.basicSortFunction = function(e, args) {
	var field = args.sortCol.field;
	args.grid.getData().sort(function(a, b) {
		var result = a[field] > b[field] ? 1 : a[field] < b[field] ? -1 : 0;
		return args.sortAsc ? result : -result;
	});
	args.grid.invalidate();
};

mediators.products.AnimalMediator.prototype.cellClickHandler = function(e, args) {
};

mediators.products.AnimalMediator.prototype.rowChangedHandler = function(e, args) {
};

mediators.products.AnimalMediator.prototype.cellDblClickHandler = function(e, args) {
	var selectedRow = args.row;
	var selectedData = args.grid.getData()[selectedRow];
	this.appBus.rowDoubleClicked.dispatch(selectedData);
};

mediators.products.AnimalMediator.prototype.onDeregister = function() {
};

$inherit(mediators.products.AnimalMediator, randori.behaviors.AbstractMediator);

mediators.products.AnimalMediator.className = "mediators.products.AnimalMediator";

mediators.products.AnimalMediator.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('services.parsers.AnimalParser');
	p.push('Slick.RowSelectionModel');
	p.push('Slick.Grid');
	return p;
};

mediators.products.AnimalMediator.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'service', t:'services.JsonService', r:0, v:null});
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

