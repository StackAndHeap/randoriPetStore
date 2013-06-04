/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 16:25:46 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};
if (typeof mediators.products == "undefined")
	mediators.products = {};

mediators.products.AnimalDetailMediator = function() {
this.aboutTxt = null;
this.ageTxt = null;
this.animalTxt = null;
this.appBus = null;
this.animalService = null;
this.nameTxt = null;
this.genderDropDown = null;
this._data = null;
this.pictureImg = null;
randori.behaviors.AbstractMediator.call(this);
};

mediators.products.AnimalDetailMediator.prototype.render = function() {
	this.nameTxt.set_value(this._data.name);
	this.nameTxt.set_dataField("name");
	this.ageTxt.set_value("" + this._data.age);
	this.ageTxt.set_dataField("age");
	this.ageTxt.set_type("number");
	this.animalTxt.set_value(this._data.animal);
	this.animalTxt.set_dataField("animal");
	this.genderDropDown.set_value(this._data.gender);
	this.genderDropDown.set_dataField("gender");
	this.genderDropDown.set_dataProvider(["male", "female"]);
	this.aboutTxt.set_value(this._data.about);
	this.aboutTxt.set_dataField("about");
	this.pictureImg.set_url(this._data.picture_large);
};

mediators.products.AnimalDetailMediator.prototype.onRegister = function() {
	this.nameTxt.valueCommit.add($createStaticDelegate(this, this.saveValue));
	this.ageTxt.valueCommit.add($createStaticDelegate(this, this.saveValue));
	this.animalTxt.valueCommit.add($createStaticDelegate(this, this.saveValue));
	this.genderDropDown.valueCommit.add($createStaticDelegate(this, this.saveValue));
	this.aboutTxt.valueCommit.add($createStaticDelegate(this, this.saveValue));
};

mediators.products.AnimalDetailMediator.prototype.onDeregister = function() {
	this.nameTxt.valueCommit.remove($createStaticDelegate(this, this.saveValue));
	this.ageTxt.valueCommit.remove($createStaticDelegate(this, this.saveValue));
	this.animalTxt.valueCommit.remove($createStaticDelegate(this, this.saveValue));
	this.genderDropDown.valueCommit.remove($createStaticDelegate(this, this.saveValue));
	this.aboutTxt.valueCommit.remove($createStaticDelegate(this, this.saveValue));
};

mediators.products.AnimalDetailMediator.prototype.saveValue = function(value, dataField) {
	this.animalService.save(this._data.id, value, dataField);
	this._data[dataField] = value;
	if (dataField == "name") {
		this.appBus.nameChanged.dispatch(this._data, "animal");
	}
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
			p.push({n:'animalService', t:'services.MockAnimalService', r:0, v:null});
			p.push({n:'appBus', t:'eventBus.AppEventBus', r:0, v:null});
			break;
		case 2:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			break;
		case 3:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'nameTxt', t:'behaviors.components.TextInput'});
			p.push({n:'ageTxt', t:'behaviors.components.TextInput'});
			p.push({n:'animalTxt', t:'behaviors.components.TextInput'});
			p.push({n:'genderDropDown', t:'behaviors.components.DropDown'});
			p.push({n:'aboutTxt', t:'behaviors.components.TextArea'});
			p.push({n:'pictureImg', t:'behaviors.components.Image'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

