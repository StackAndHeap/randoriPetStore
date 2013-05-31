/** Compiled by the Randori compiler v0.2.4 on Sat May 25 14:59:38 CEST 2013 */

if (typeof services == "undefined")
	var services = {};
if (typeof services.parsers == "undefined")
	services.parsers = {};

services.parsers.AnimalParser = function() {
};

services.parsers.AnimalParser.prototype.parseResult = function(result) {
	var json = JSON.parse(result);
	for (var i = 0; i < json.length; i++) {
		var animal = json[i];
		animal.picture = "<img src=\'" + json[i]["picture"] + "\'\/>";
		animal.picture_large = "<img src=\'" + json[i]["picture_large"] + "\'\/>";
	}
	return json;
};

services.parsers.AnimalParser.className = "services.parsers.AnimalParser";

services.parsers.AnimalParser.getClassDependencies = function(t) {
	var p;
	return [];
};

services.parsers.AnimalParser.injectionPoints = function(t) {
	return [];
};
