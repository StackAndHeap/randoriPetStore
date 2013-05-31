/** Compiled by the Randori compiler v0.2.4 on Fri May 31 15:00:32 CEST 2013 */

if (typeof contexts == "undefined")
	var contexts = {};

contexts.BoringContext = function() {
	guice.GuiceModule.call(this);
};

contexts.BoringContext.prototype.configure = function(binder) {
	binder.bind(messages.MessageGenerator).to(messages.BoringMessageGenerator);
	binder.bind(eventBus.AppEventBus).inScope(guice.binding.Scope.Singleton).to(eventBus.AppEventBus);
};

$inherit(contexts.BoringContext, guice.GuiceModule);

contexts.BoringContext.className = "contexts.BoringContext";

contexts.BoringContext.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('messages.BoringMessageGenerator');
	p.push('messages.MessageGenerator');
	p.push('eventBus.AppEventBus');
	return p;
};

contexts.BoringContext.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 1:
			p = guice.GuiceModule.injectionPoints(t);
			break;
		case 2:
			p = guice.GuiceModule.injectionPoints(t);
			break;
		case 3:
			p = guice.GuiceModule.injectionPoints(t);
			break;
		default:
			p = [];
			break;
	}
	return p;
};

