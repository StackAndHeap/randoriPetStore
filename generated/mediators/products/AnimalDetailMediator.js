/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 11:00:48 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};
if (typeof mediators.products == "undefined")
	mediators.products = {};

mediators.products.AnimalDetailMediator = function() {
this.template = null;
this.templateBuilder = null;
this.animalService = null;
this._data = null;
randori.behaviors.AbstractMediator.call(this);
};

mediators.products.AnimalDetailMediator.prototype.render = function() {
	var row;
	var div = jQuery("<div><\/div>");
	row = this.templateBuilder.renderTemplateClone(this._data).children();
	row.addClass("randoriListItem");
	div.append(row);
	this.decoratedNode.empty();
	this.decoratedNode.append(div.children());
};

mediators.products.AnimalDetailMediator.prototype.onPreRegister = function() {
	randori.behaviors.AbstractMediator.prototype.onPreRegister.call(this);
	this.templateBuilder.captureAndEmptyTemplateContents(this.decoratedNode);
};

mediators.products.AnimalDetailMediator.prototype.onRegister = function() {
};

mediators.products.AnimalDetailMediator.prototype.onDeregister = function() {
};

mediators.products.AnimalDetailMediator.prototype.setData = function(value) {
	console.log("setData");
	this.animalService.getById(value.id).then($createStaticDelegate(this, this.dataReceivedHandler));
	this.render();
};

mediators.products.AnimalDetailMediator.prototype.dataReceivedHandler = function(data) {
	this._data = data;
	this.render();
};

$inherit(mediators.products.AnimalDetailMediator, randori.behaviors.AbstractMediator);

mediators.products.AnimalDetailMediator.className = "mediators.products.AnimalDetailMediator";

mediators.products.AnimalDetailMediator.getClassDependencies = function(t) {
	var p;
	return [];
};

mediators.products.AnimalDetailMediator.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'templateBuilder', t:'randori.template.TemplateBuilder', r:0, v:null});
			p.push({n:'animalService', t:'services.MockAnimalService', r:0, v:null});
			break;
		case 2:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			break;
		case 3:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'template', r:0});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

