/** Compiled by the Randori compiler v0.2.4 on Fri May 31 15:00:32 CEST 2013 */

if (typeof behaviors == "undefined")
	var behaviors = {};
if (typeof behaviors.tabs == "undefined")
	behaviors.tabs = {};

behaviors.tabs.TabFactory = function() {
};

behaviors.tabs.TabFactory.prototype.create = function(name, url) {
	var li = jQuery("<li><\/li>");
	var tabId = new Date().getTime();
	var link = jQuery("<a><\/a>");
	link.attr("href", url);
	link.html(name);
	var closeButton = jQuery("<button><\/button>");
	closeButton.attr("type", "button");
	closeButton.attr("data-dismiss", "alert");
	closeButton.addClass("close");
	closeButton.html("&times;");
	li.append(link);
	li.append(closeButton);
	li.attr("data-tabindex", tabId);
	return li;
};

behaviors.tabs.TabFactory.className = "behaviors.tabs.TabFactory";

behaviors.tabs.TabFactory.getClassDependencies = function(t) {
	var p;
	return [];
};

behaviors.tabs.TabFactory.injectionPoints = function(t) {
	return [];
};
