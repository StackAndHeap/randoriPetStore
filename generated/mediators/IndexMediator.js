/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 12:21:20 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};

mediators.IndexMediator = function() {
this.selectedTabBarItem = null;
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
	this.tabBar.itemClicked.add($createStaticDelegate(this, this.onItemSelected));
	this.selectDefaultView();
};

mediators.IndexMediator.prototype.itemDoubleClickedHandler = function(data) {
	var tabItem = new behaviors.tabbar.TabBarItem();
	tabItem.id = data.id;
	tabItem.label = data.name;
	tabItem.type = "animal";
	this.tabBar.addTab(tabItem);
};

mediators.IndexMediator.prototype.onItemSelected = function(item) {
	this.selectedTabBarItem = item;
	this.menuLeft.deselectAll();
	this.urlRouter.removeRoute();
	if (item == null) {
		this.allTabsRemovedHandler();
	}
	switch (item.type) {
		case "animal":
			var loadAnimal = this.loadView("views\/products\/animals-detail.html");
			loadAnimal.then($createStaticDelegate(this, this.viewAddedHandler));
			break;
		case "misc":
			break;
	}
};

mediators.IndexMediator.prototype.selectDefaultView = function() {
	if (this.urlRouter.route[0]) {
		var items = this.getDefaultMenuItems();
		for (var i = 0; i < items.length; i++) {
			var menuItem = items[i];
			if (menuItem.route == this.urlRouter.route[0]) {
				this.menuLeft.selectButton(menuItem.id);
				return;
			}
		}
	} else {
		this.menuLeft.selectButton("animalsBtn");
	}
};

mediators.IndexMediator.prototype.menuClickHandler = function(item) {
	this.tabBar.deselectAll();
	this.urlRouter.replaceRoute(0, item.route);
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
	switch (this.selectedTabBarItem.type) {
		case "animal":
			mediator.setData(this.selectedTabBarItem);
			break;
	}
};

mediators.IndexMediator.prototype.onDeregister = function() {
	this.menuLeft.itemClicked.remove($createStaticDelegate(this, this.menuClickHandler));
	this.tabBar.itemClicked.remove($createStaticDelegate(this, this.onItemSelected));
};

mediators.IndexMediator.prototype.allTabsRemovedHandler = function() {
	console.log("allTabsRemovedHandler");
	this.selectDefaultView();
};

mediators.IndexMediator.prototype.getDefaultMenuItems = function() {
	var animalsBtn = {};
	animalsBtn.id = "animalsBtn";
	animalsBtn.label = "Animals";
	animalsBtn.url = "views\/products\/animals.html";
	animalsBtn.route = "animals";
	var miscBtn = {};
	miscBtn.id = "miscBtn";
	miscBtn.label = "Misc";
	miscBtn.url = "views\/products\/misc.html";
	miscBtn.route = "misc";
	var closedOrdersBtn = {};
	closedOrdersBtn.id = "closedOrdersBtn";
	closedOrdersBtn.label = "Closed Orders";
	closedOrdersBtn.url = "views\/products\/animals.html";
	closedOrdersBtn.route = "closedOrders";
	var processingOrdersBtn = {};
	processingOrdersBtn.id = "processingOrdersBtn";
	processingOrdersBtn.label = "Processing Orders";
	processingOrdersBtn.route = "processingOrders";
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

