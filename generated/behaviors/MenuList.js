/** Compiled by the Randori compiler v0.2.4 on Sat May 25 14:59:38 CEST 2013 */

if (typeof behaviors == "undefined")
	var behaviors = {};

behaviors.MenuList = function() {
	this._items = null;
	this.itemClick = null;
	randori.behaviors.AbstractBehavior.call(this);
	this.itemClick = new randori.signal.SimpleSignal();
};

behaviors.MenuList.prototype.onRegister = function() {
};

behaviors.MenuList.prototype.onDeregister = function() {
};

behaviors.MenuList.prototype.get_items = function() {
	return this._items;
};

behaviors.MenuList.prototype.set_items = function(value) {
	this._items = value;
	this.render();
};

behaviors.MenuList.prototype.render = function() {
	var div = jQuery("<ul><\/ul>");
	for (var i = 0; i < this.get_items().length; i++) {
		var menuItem = this.get_items()[i];
		var button = jQuery("<li><\/li>");
		button.addClass("button");
		button.html(menuItem.label);
		button.attr("data-link", menuItem.url);
		button.attr("data-id", "button" + i);
		button.click($createStaticDelegate(this, this.buttonClickHandler));
		div.append(button);
	}
	this.decoratedNode.empty();
	this.decoratedNode.append(div);
};

behaviors.MenuList.prototype.buttonClickHandler = function(event) {
	var clickedButton = jQuery(event.currentTarget);
	this.selectButton(clickedButton, event);
};

behaviors.MenuList.prototype.selectButton = function(clickedButton, event) {
	if (arguments.length < 2) {
		event = null;
	}
	var children = this.decoratedNode.children().children();
	for (var i = 0; i < children.length; i++) {
		var button = children.eq(i);
		if (button.attr("data-id") == clickedButton.attr("data-id")) {
			button.addClass("selected");
		} else {
			button.removeClass("selected");
		}
	}
	if (event)
		this.itemClick.dispatch(event);
};

$inherit(behaviors.MenuList, randori.behaviors.AbstractBehavior);

behaviors.MenuList.className = "behaviors.MenuList";

behaviors.MenuList.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('randori.signal.SimpleSignal');
	return p;
};

behaviors.MenuList.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractBehavior.injectionPoints(t);
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

