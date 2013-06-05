/** Compiled by the Randori compiler v0.2.4 on Wed Jun 05 10:27:05 CEST 2013 */

if (typeof mediators == "undefined")
	var mediators = {};

mediators.IndexMediator = function() {
	this.button_logout = null;
	this.header = null;
	this.appBus = null;
	this.urlRouter = null;
	this.txt_username = null;
	this.mainViewStack = null;
	randori.behaviors.AbstractMediator.call(this);
	
};

mediators.IndexMediator.prototype.onRegister = function() {
	this.button_logout.click($createStaticDelegate(this, this.logoutClickHandler));
	this.appBus.login.add($createStaticDelegate(this, this.loginHandler));
	this.appBus.logout.add($createStaticDelegate(this, this.logoutHandler));
	if (localStorage.getItem("loggedin") == "true") {
		this.login(localStorage.getItem("username"));
	} else {
		this.mainViewStack.pushView("views\/login\/login.html");
	}
};

mediators.IndexMediator.prototype.loginHandler = function(user) {
	localStorage.setItem("loggedin", "true");
	localStorage.setItem("username", user.username);
	this.login(user.username);
};

mediators.IndexMediator.prototype.login = function(userName) {
	this.txt_username.html(userName);
	this.header.css("display", "");
	this.mainViewStack.pushView("views\/content\/content.html");
};

mediators.IndexMediator.prototype.logoutClickHandler = function(e) {
	this.header.css("display", "none");
	localStorage.setItem("loggedin", "false");
	this.appBus.logout.dispatch();
};

mediators.IndexMediator.prototype.logoutHandler = function() {
	this.mainViewStack.pushView("views\/login\/login.html");
};

mediators.IndexMediator.prototype.onDeregister = function() {
};

$inherit(mediators.IndexMediator, randori.behaviors.AbstractMediator);

mediators.IndexMediator.className = "mediators.IndexMediator";

mediators.IndexMediator.getClassDependencies = function(t) {
	var p;
	return [];
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
			p.push({n:'mainViewStack', t:'randori.behaviors.ViewStack'});
			p.push({n:'txt_username'});
			p.push({n:'header'});
			p.push({n:'button_logout'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

