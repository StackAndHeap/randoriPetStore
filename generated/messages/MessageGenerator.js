/** Compiled by the Randori compiler v0.2.4 on Sat May 25 14:59:38 CEST 2013 */

if (typeof messages == "undefined")
	var messages = {};

messages.MessageGenerator = function() {
	
};

messages.MessageGenerator.prototype.newMessage = function() {
	var dateString = new Date().toString();
	var message = "My Message " + dateString;
	return {title:"My Title", message:message};
};

messages.MessageGenerator.className = "messages.MessageGenerator";

messages.MessageGenerator.getClassDependencies = function(t) {
	var p;
	return [];
};

messages.MessageGenerator.injectionPoints = function(t) {
	return [];
};
