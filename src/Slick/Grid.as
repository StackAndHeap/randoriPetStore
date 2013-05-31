package  Slick {
import randori.jquery.JQuery;

public class Grid {

    // Events
    public var onSort:Event;
    public var onClick:Event;
    public var onDblClick:Event;
    public var onSelectedRowsChanged:Event;
    public var onScroll:Event;
    public var onHeaderMouseEnter:Event;
    public var onHeaderMouseLeave:Event;
    public var onHeaderContextMenu:Event;
    public var onHeaderClick:Event;
    public var onHeaderCellRendered:Event;
    public var onBeforeHeaderCellDestroy:Event;
    public var onHeaderRowCellRendered:Event;
    public var onBeforeHeaderRowCellDestroy:Event;
    public var onMouseEnter:Event;
    public var onMouseLeave:Event;
    public var onContextMenu:Event;
    public var onKeyDown:Event;
    public var onAddNewRow:Event;
    public var onValidationError:Event;
    public var onViewportChanged:Event;
    public var onColumnsReordered:Event;
    public var onColumnsResized:Event;
    public var onCellChange:Event;
    public var onBeforeEditCell:Event;
    public var onBeforeCellEditorDestroy:Event;
    public var onBeforeDestroy:Event;
    public var onActiveCellChanged:Event;
    public var onActiveCellPositionChanged:Event;
    public var onDragInit:Event;
    public var onDragStart:Event;
    public var onDrag:Event;
    public var onDragEnd:Event;
    public var onCellCssStylesChanged:Event;

    public function init() : void {}
    public function render() : void {}
    public function destroy() : void {}
    public function setSelectionModel( model:Object ) : void {}
    public function updateRowCount() : void {}
    public function setData( data:Array ) : void {}
    public function getSelectedRows() : void {}
    public function setColumns( columns:Array ) : void {}
    public function setOptions( options:Options ) : void {}
    public function invalidate() : void {}

    public function Grid( gridDiv:JQuery, data:Array, columns:Array, options:Options ) {
    }
}
}