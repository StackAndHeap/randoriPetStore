/** Compiled by the Randori compiler v0.2.4 on Fri May 31 15:00:32 CEST 2013 */

if (typeof services == "undefined")
	var services = {};

services.JsonService = function(xmlHttpRequest) {
	randori.service.AbstractService.call(this, xmlHttpRequest);
};

services.JsonService.prototype.get = function(url, parser) {
	if (arguments.length < 2) {
		parser = null;
	}
	var promise = this.sendRequest("GET", url);
	return promise.then(parser.parseResult);
};

$inherit(services.JsonService, randori.service.AbstractService);

services.JsonService.className = "services.JsonService";

services.JsonService.getClassDependencies = function(t) {
	var p;
	return [];
};

services.JsonService.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 0:
			p = [];
			p.push({n:'xmlHttpRequest', t:'XMLHttpRequest'});
			break;
		case 1:
			p = randori.service.AbstractService.injectionPoints(t);
			break;
		case 2:
			p = randori.service.AbstractService.injectionPoints(t);
			break;
		case 3:
			p = randori.service.AbstractService.injectionPoints(t);
			break;
		default:
			p = [];
			break;
	}
	return p;
};

