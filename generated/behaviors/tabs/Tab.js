/** Compiled by the Randori compiler v0.2.4 on Tue May 28 14:33:57 CEST 2013 */

if (typeof behaviors == "undefined")
	var behaviors = {};
if (typeof behaviors.tabs == "undefined")
	behaviors.tabs = {};

behaviors.tabs.Tab = function(name, url, tabFactory) {
	this.content = null;
	this.selected = null;
	this.domElement = null;
	this.tabId = 0;
	this.tabClicked = null;
	this.tabClicked = new randori.signal.SimpleSignal();
	this.name = name;
	this.url = url;
	this.tabId = new Date().getTime();
	this.domElement = jQuery("<li><\/li>");
	var link = jQuery("<a><\/a>");
	link.attr("href", url);
	link.html(name);
	var closeButton = jQuery("<button><\/button>");
	closeButton.attr("type", "button");
	closeButton.attr("data-dismiss", "alert");
	closeButton.addClass("close");
	closeButton.html("&times;");
	this.domElement.append(link);
	this.domElement.append(closeButton);
	this.domElement.attr("data-tabindex", this.tabId);
};

behaviors.tabs.Tab.prototype.tabClickHandler = function(e) {
	this.tabClicked.dispatch(e, this);
};

behaviors.tabs.Tab.className = "behaviors.tabs.Tab";

behaviors.tabs.Tab.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('randori.signal.SimpleSignal');
	return p;
};

behaviors.tabs.Tab.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 0:
			p = [];
			p.push({n:'name', t:'String'});
			p.push({n:'url', t:'String'});
			p.push({n:'tabFactory', t:'behaviors.tabs.TabFactory'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

