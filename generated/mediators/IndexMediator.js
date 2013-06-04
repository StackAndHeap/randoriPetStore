/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 10:49:48 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};

mediators.IndexMediator = function() {
this.clickedAnimal = null;
this.tabBar = null;
this.menuLeft = null;
this.appBus = null;
this.views = null;
this.urlRouter = null;
this.myViewStack = null;
randori.behaviors.AbstractMediator.call(this);
};

mediators.IndexMediator.prototype.onRegister = function() {
	this.menuLeft.set_dataProvider(this.getDefaultMenuItems());
	this.menuLeft.itemClicked.add($createStaticDelegate(this, this.menuClickHandler));
	this.appBus.rowDoubleClicked.add($createStaticDelegate(this, this.itemDoubleClickedHandler));
	this.appBus.tabClicked.add($createStaticDelegate(this, this.handleTabClicked));
	this.appBus.allTabsRemoved.add($createStaticDelegate(this, this.allTabsRemovedHandler));
	this.selectDefaultView();
};

mediators.IndexMediator.prototype.itemDoubleClickedHandler = function(data) {
	var tabItem = new behaviors.tabbar.TabBarItem();
	tabItem.id = data.id;
	tabItem.label = data.name;
	tabItem.type = "animal";
	this.tabBar.addTab(tabItem);
};

mediators.IndexMediator.prototype.selectDefaultView = function() {
	if (this.urlRouter.route[0]) {
		this.menuLeft.selectButton(this.urlRouter.route[0]);
	} else {
		this.menuLeft.selectButton("animalsBtn");
	}
};

mediators.IndexMediator.prototype.menuClickHandler = function(item) {
	this.urlRouter.replaceRoute(0, item.id);
	var promise = this.loadView(item.url);
	promise.then($createStaticDelegate(this, this.viewAddedHandler));
};

mediators.IndexMediator.prototype.loadView = function(url) {
	var promise;
	if (this.myViewStack.hasView(url) == true) {
		this.myViewStack.selectView(url);
		promise = new randori.async.Promise();
		promise.resolve(true);
	} else {
		promise = this.myViewStack.pushView(url);
		promise.then(function() {
			this.myViewStack.selectView(url);
		});
	}
	return promise;
};

mediators.IndexMediator.prototype.viewAddedHandler = function(mediator) {
	try {
		var animalDetailMediator = mediator;
		animalDetailMediator.set_data(this.clickedAnimal);
	} catch (e) {
	}
};

mediators.IndexMediator.prototype.onDeregister = function() {
	this.menuLeft.itemClicked.remove($createStaticDelegate(this, this.menuClickHandler));
	this.appBus.tabClicked.remove($createStaticDelegate(this, this.handleTabClicked));
	this.appBus.allTabsRemoved.remove($createStaticDelegate(this, this.allTabsRemovedHandler));
};

mediators.IndexMediator.prototype.handleTabClicked = function(tab, data) {
	this.clickedAnimal = data;
	console.log(data);
	var promise = this.loadView("views\/products\/animals-detail.html");
	promise.then($createStaticDelegate(this, this.viewAddedHandler));
};

mediators.IndexMediator.prototype.allTabsRemovedHandler = function(e) {
	this.loadView("views\/products\/animals.html");
};

mediators.IndexMediator.prototype.getDefaultMenuItems = function() {
	var animalsBtn = {};
	animalsBtn.id = "animalsBtn";
	animalsBtn.label = "Animals";
	animalsBtn.url = "views\/products\/animals.html";
	var miscBtn = {};
	miscBtn.id = "miscBtn";
	miscBtn.label = "Misc";
	miscBtn.url = "views\/products\/misc.html";
	var closedOrdersBtn = {};
	closedOrdersBtn.id = "closedOrdersBtn";
	closedOrdersBtn.label = "Closed Orders";
	closedOrdersBtn.url = "views\/products\/animals.html";
	var processingOrdersBtn = {};
	processingOrdersBtn.id = "processingOrdersBtn";
	processingOrdersBtn.label = "Processing Orders";
	processingOrdersBtn.url = "views\/products\/animals.html";
	return [animalsBtn, miscBtn, closedOrdersBtn, processingOrdersBtn];
};

$inherit(mediators.IndexMediator, randori.behaviors.AbstractMediator);

mediators.IndexMediator.className = "mediators.IndexMediator";

mediators.IndexMediator.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('randori.async.Promise');
	p.push('behaviors.tabbar.TabBarItem');
	return p;
};

mediators.IndexMediator.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'appBus', t:'eventBus.AppEventBus', r:0, v:null});
			p.push({n:'urlRouter', t:'router.URLRouter', r:0, v:null});
			break;
		case 2:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			break;
		case 3:
			p = randori.behaviors.AbstractMediator.injectionPoints(t);
			p.push({n:'menuLeft', t:'behaviors.MenuList'});
			p.push({n:'myViewStack', t:'randori.behaviors.ViewStack'});
			p.push({n:'tabBar', t:'behaviors.tabbar.TabBar'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

