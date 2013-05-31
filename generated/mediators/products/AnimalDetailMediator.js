/** Compiled by the Randori compiler v0.2.4 on Sat May 25 14:59:38 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};
if (typeof mediators.products == "undefined")
	mediators.products = {};

mediators.products.AnimalDetailMediator = function(data) {
this.template = null;
this.templateBuilder = null;
this._data = null;
randori.behaviors.AbstractMediator.call(this);
};

mediators.products.AnimalDetailMediator.prototype.render = function() {
	var row;
	var div = jQuery("<div><\/div>");
	row = this.templateBuilder.renderTemplateClone(this.get_data()).children();
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

mediators.products.AnimalDetailMediator.prototype.get_data = function() {
	return this._data;
};

mediators.products.AnimalDetailMediator.prototype.set_data = function(value) {
	this._data = value;
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
		case 0:
			p = [];
			p.push({n:'data', t:'Object'});
			break;
		case 1:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'templateBuilder', t:'randori.template.TemplateBuilder', r:0, v:null});
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

