/** Compiled by the Randori compiler v0.2.4 on Fri May 31 15:00:32 CEST 2013 */

if (typeof behaviors == "undefined")
	var behaviors = {};

behaviors.TabBar = function() {
	this.appBus = null;
	this._items = null;
	this.tabFactory = null;
	randori.behaviors.AbstractBehavior.call(this);
	this.set_items([]);
	this.tabFactory = new behaviors.tabs.TabFactory();
};

behaviors.TabBar.prototype.onRegister = function() {
	randori.behaviors.AbstractBehavior.prototype.onRegister.call(this);
};

behaviors.TabBar.prototype.onDeregister = function() {
	randori.behaviors.AbstractBehavior.prototype.onDeregister.call(this);
};

behaviors.TabBar.prototype.addTab = function(url, name, data) {
	if (arguments.length < 3) {
		data = null;
	}
	this.deselectAllTabs();
	var tab = new behaviors.tabs.Tab(name, url, this.tabFactory);
	tab.tabClicked.add($createStaticDelegate(this, this.tabClickHandler));
	tab.content = data;
	tab.selected = true;
	this.get_items().push(tab);
	this.render();
	return tab.tabId;
};

behaviors.TabBar.prototype.render = function() {
	this.decoratedNode.empty();
	for (var i = 0; i < this.get_items().length; i++) {
		var tab = this.get_items()[i];
		tab.selected ? tab.domElement.addClass("selected") : tab.domElement.removeClass("selected");
		tab.domElement.click($createStaticDelegate(tab, tab.tabClickHandler));
		this.decoratedNode.append(tab.domElement);
	}
};

behaviors.TabBar.prototype.closeButtonClickHandler = function(e) {
	var clickedTab = jQuery(e.currentTarget.parentNode);
	this.removeTab(clickedTab);
	e.stopImmediatePropagation();
};

behaviors.TabBar.prototype.removeTab = function(clickedTab) {
	var clickedTabIndex = clickedTab.attr("data-tabindex");
	var children = this.decoratedNode.children();
	this.decoratedNode.children().remove("li[data-tabindex=" + clickedTabIndex + "]");
};

behaviors.TabBar.prototype.selectPreviousTab = function(children) {
};

behaviors.TabBar.prototype.tabClickHandler = function(e, tab) {
	this.selectTab(tab);
};

behaviors.TabBar.prototype.selectTab = function(tab) {
	this.deselectAllTabs();
	tab.selected = true;
	this.render();
};

behaviors.TabBar.prototype.deselectAllTabs = function() {
	for (var i = 0; i < this.get_items().length; i++) {
		var tab = this.get_items()[i];
		tab.selected = false;
	}
};

behaviors.TabBar.prototype.get_items = function() {
	return this._items;
};

behaviors.TabBar.prototype.set_items = function(value) {
	this._items = value;
};

$inherit(behaviors.TabBar, randori.behaviors.AbstractBehavior);

behaviors.TabBar.className = "behaviors.TabBar";

behaviors.TabBar.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('behaviors.tabs.Tab');
	p.push('behaviors.tabs.TabFactory');
	return p;
};

behaviors.TabBar.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractBehavior.injectionPoints(t);
			p.push({n:'appBus', t:'eventBus.AppEventBus', r:0, v:null});
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

