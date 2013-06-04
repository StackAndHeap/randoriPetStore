/** Compiled by the Randori compiler v0.2.4 on Fri May 31 14:11:11 CEST 2013 */

if (typeof messages == "undefined")
	var messages = {};

messages.BoringMessageGenerator = function() {
	messages.MessageGenerator.call(this);
	
};

messages.BoringMessageGenerator.prototype.newMessage = function() {
	return {title:"Boring Message", message:"Yawn"};
};

$inherit(messages.BoringMessageGenerator, messages.MessageGenerator);

messages.BoringMessageGenerator.className = "messages.BoringMessageGenerator";

messages.BoringMessageGenerator.getClassDependencies = function(t) {
	var p;
	return [];
};

messages.BoringMessageGenerator.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = messages.MessageGenerator.injectionPoints(t);
			break;
		case 2:
			p = messages.MessageGenerator.injectionPoints(t);
			break;
		case 3:
			p = messages.MessageGenerator.injectionPoints(t);
			break;
		default:
			p = [];
			break;
	}
	return p;
};

