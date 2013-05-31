/** Compiled by the Randori compiler v0.2.4 on Sat May 25 14:59:38 CEST 2013 */

if (typeof services == "undefined")
	var services = {};
if (typeof services.parsers == "undefined")
	services.parsers = {};

services.parsers.MiscParser = function() {
};

services.parsers.MiscParser.prototype.parseResult = function(result) {
	var json = JSON.parse(result);
	for (var i = 0; i < json.length; i++) {
		var misc = json[i];
		misc.picture = "<img src=\'" + json[i]["picture"] + "\'\/>";
	}
	return json;
};

services.parsers.MiscParser.className = "services.parsers.MiscParser";

services.parsers.MiscParser.getClassDependencies = function(t) {
	var p;
	return [];
};

services.parsers.MiscParser.injectionPoints = function(t) {
	return [];
};
