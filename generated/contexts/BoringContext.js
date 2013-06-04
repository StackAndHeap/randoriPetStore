/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 10:16:35 CEST 2013 */

if (typeof contexts == "undefined")
	var contexts = {};

contexts.BoringContext = function() {
	guice.GuiceModule.call(this);
};

contexts.BoringContext.prototype.configure = function(binder) {
	binder.bind(messages.MessageGenerator).to(messages.BoringMessageGenerator);
	binder.bind(eventBus.AppEventBus).inScope(guice.binding.Scope.Singleton).to(eventBus.AppEventBus);
	binder.bind(router.URLRouter).inScope(guice.binding.Scope.Singleton).to(router.URLRouter);
	binder.bind(services.MockAnimalService).inScope(guice.binding.Scope.Singleton).to(services.MockAnimalService);
	binder.bind(services.MockMiscService).inScope(guice.binding.Scope.Singleton).to(services.MockMiscService);
};

$inherit(contexts.BoringContext, guice.GuiceModule);

contexts.BoringContext.className = "contexts.BoringContext";

contexts.BoringContext.getClassDependencies = function(t) {
	var p;
	p = [];
	p.push('services.MockAnimalService');
	p.push('router.URLRouter');
	p.push('messages.BoringMessageGenerator');
	p.push('services.MockMiscService');
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

