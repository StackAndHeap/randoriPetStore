/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 10:16:35 CEST 2013 */

if (typeof behaviors == "undefined")
	var behaviors = {};

behaviors.MenuList = function() {
	this._dataProvider = null;
	this.itemClicked = null;
	randori.behaviors.AbstractBehavior.call(this);
};

behaviors.MenuList.prototype.onRegister = function() {
};

behaviors.MenuList.prototype.onDeregister = function() {
};

behaviors.MenuList.prototype.get_dataProvider = function() {
	return this._dataProvider;
};

behaviors.MenuList.prototype.set_dataProvider = function(value) {
	this._dataProvider = value;
	this.render();
};

behaviors.MenuList.prototype.render = function() {
	var div = jQuery("<ul><\/ul>");
	for (var i = 0; i < this.get_dataProvider().length; i++) {
		var menuItem = this.get_dataProvider()[i];
		var button = jQuery("<li><\/li>");
		button.addClass("button");
		button.html(menuItem.label);
		button.attr("data-link", menuItem.url);
		button.attr("data-id", menuItem.id);
		button.click($createStaticDelegate(this, this.buttonClickHandler));
		div.append(button);
	}
	this.decoratedNode.empty();
	this.decoratedNode.append(div);
};

behaviors.MenuList.prototype.buttonClickHandler = function(event) {
	var clickedButton = jQuery(event.currentTarget);
	this.selectButton(clickedButton.attr("data-id"));
};

behaviors.MenuList.prototype.selectButton = function(id) {
	var children = this.decoratedNode.children().children();
	for (var i = 0; i < children.length; i++) {
		var button = children.eq(i);
		if (button.attr("data-id") == id) {
			button.addClass("selected");
		} else {
			button.removeClass("selected");
		}
	}
	for (var j = 0; j < this.get_dataProvider().length; j++) {
		var item = this.get_dataProvider()[j];
		if (item.id == id) {
			this.itemClicked.dispatch(item);
		}
	}
};

$inherit(behaviors.MenuList, randori.behaviors.AbstractBehavior);

behaviors.MenuList.className = "behaviors.MenuList";

behaviors.MenuList.getClassDependencies = function(t) {
	var p;
	return [];
};

behaviors.MenuList.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractBehavior.injectionPoints(t);
			p.push({n:'itemClicked', t:'randori.signal.SimpleSignal', r:0, v:null});
			break;
		case 2:
			p = randori.behaviors.AbstractBehavior.injectionPoints(t);
			break;
		case 3:
			p = randori.behaviors.AbstractBehavior.injectionPoints(t);
			break;
		default:
			p = [];
			break;
	}
	return p;
};

