/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 15:14:43 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};
if (typeof mediators.products == "undefined")
	mediators.products = {};

mediators.products.AnimalDetailMediator = function() {
this.template = null;
this.templateBuilder = null;
this.animalService = null;
this.nameTxt = null;
this._data = null;
randori.behaviors.AbstractMediator.call(this);
};

mediators.products.AnimalDetailMediator.prototype.render = function() {
	this.nameTxt.set_value(this._data.name);
	this.nameTxt.set_dataField("name");
};

mediators.products.AnimalDetailMediator.prototype.onRegister = function() {
	this.nameTxt.valueCommit.add($createStaticDelegate(this, this.saveValue));
};

mediators.products.AnimalDetailMediator.prototype.onDeregister = function() {
	this.nameTxt.valueCommit.remove($createStaticDelegate(this, this.saveValue));
};

mediators.products.AnimalDetailMediator.prototype.saveValue = function(value, dataField) {
	this.animalService.save(this._data.id, value, dataField);
};

mediators.products.AnimalDetailMediator.prototype.setData = function(value) {
	this.animalService.getById(value.id).then($createStaticDelegate(this, this.dataReceivedHandler));
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
			p.push({n:'nameTxt', t:'behaviors.components.TextInput'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

