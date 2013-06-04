/** Compiled by the Randori compiler v0.2.4 on Tue Jun 04 12:21:20 CEST 2013 */

if (typeof Slick == "undefined")
	var Slick = {};

Slick.Grid = function(gridDiv, data, columns, options) {
this.onClick = null;
this.onDrag = null;
this.onViewportChanged = null;
this.onSort = null;
this.onColumnsReordered = null;
this.onDragInit = null;
this.onBeforeHeaderRowCellDestroy = null;
this.onSelectedRowsChanged = null;
this.onScroll = null;
this.onKeyDown = null;
this.onMouseLeave = null;
this.onColumnsResized = null;
this.onCellCssStylesChanged = null;
this.onDragStart = null;
this.onBeforeEditCell = null;
this.onHeaderMouseLeave = null;
this.onValidationError = null;
this.onHeaderRowCellRendered = null;
this.onHeaderMouseEnter = null;
this.onDblClick = null;
this.onBeforeCellEditorDestroy = null;
this.onBeforeHeaderCellDestroy = null;
this.onActiveCellChanged = null;
this.onDragEnd = null;
this.onContextMenu = null;
this.onHeaderCellRendered = null;
this.onHeaderClick = null;
this.onActiveCellPositionChanged = null;
this.onMouseEnter = null;
this.onCellChange = null;
this.onBeforeDestroy = null;
this.onAddNewRow = null;
this.onHeaderContextMenu = null;
};

Slick.Grid.prototype.init = function() {
};

Slick.Grid.prototype.render = function() {
};

Slick.Grid.prototype.destroy = function() {
};

Slick.Grid.prototype.setSelectionModel = function(model) {
};

Slick.Grid.prototype.updateRowCount = function() {
};

Slick.Grid.prototype.setData = function(data) {
};

Slick.Grid.prototype.getSelectedRows = function() {
};

Slick.Grid.prototype.setColumns = function(columns) {
};

Slick.Grid.prototype.setOptions = function(options) {
};

Slick.Grid.prototype.invalidate = function() {
};

Slick.Grid.className = "Slick.Grid";

Slick.Grid.getClassDependencies = function(t) {
	var p;
	return [];
};

Slick.Grid.injectionPoints = function(t) {
	var p;
	switch (t) {
		case 0:
			p = [];
			p.push({n:'gridDiv', t:'randori.jquery.JQuery'});
			p.push({n:'data', t:'Array'});
			p.push({n:'columns', t:'Array'});
			p.push({n:'options', t:'Object'});
			break;
		default:
			p = [];
			break;
	}
	return p;
};

