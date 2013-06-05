package mediators.products {
import Slick.*;

import eventBus.AppEventBus;

import models.Animal;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;
import randori.webkit.html.HTMLInputElement;

import services.MockAnimalService;

public class AnimalMediator extends AbstractMediator {

    [View] public var gridContainer:JQuery;
    [View] public var filter:JQuery;
    [View] public var addBtn:JQuery;
    [Inject] public var animalService:MockAnimalService;
    [Inject] public var appBus:AppEventBus;

    private var grid:Grid;

    override protected function onRegister():void {
        filter.keyup1( filterData );
        animalService.getAll().then( handleResult );
        addBtn.click(addBtnClickedHandler);
    }

    private function addBtnClickedHandler(e:randori.jquery.Event):void {
        appBus.showModal.dispatch("","dit is een titel");
    }

    private function filterData(event:randori.jquery.Event):void{
        var input:HTMLInputElement = event.target as HTMLInputElement;
        animalService.get( input.value ).then( handleResult );
    }

    private function handleResult( result:Array ):void {
        loadGrid( result );
    }

    protected function loadGrid( result:Array ):void {
        var col1:Column = new Column("name", "Name", "name" );
        var col2:Column = new Column("age", "Age", "age" );
        var col4:Column = new Column("animal", "Animal", "animal" );
        var col6:Column = new Column("gender", "Gender", "gender" );
        var col7:Column = new Column("about", "About", "about" );
        var col8:Column = new Column("registered", "Registered", "registered" );

        var columns:Array = [col1,col2,col4,col6,col7,col8];

        var options:Options = new Options();
        options.enableCellNavigation = true;
        options.enableColumnReorder = false;
        options.forceFitColumns = true;

        grid = new Grid( gridContainer, result, columns, options);

        var selectionModel:Object = new RowSelectionModel();
        grid.setSelectionModel( selectionModel );

        grid.onSort.subscribe( basicSortFunction );
        grid.onDblClick.subscribe( cellDblClickHandler );
        grid.onClick.subscribe( cellClickHandler );
        grid.onSelectedRowsChanged.subscribe( rowChangedHandler );

    }
    private function basicSortFunction( e:Event, args:Object ):void{
        var field:Object = args.sortCol.field;

        args.grid.getData().sort(function(a, b):int{
            var result:int =
                a[field] > b[field] ? 1 :
                a[field] < b[field] ? -1 :
                0;

            return args.sortAsc ? result : -result;
        });

        args.grid.invalidate();
    }

    private function cellClickHandler( e:*, args:Object ):void {

    }
    private function rowChangedHandler( e:*, args:Object ):void {
    }
    private function cellDblClickHandler( e:*, args:Object  ):void {
        var selectedRow:int =  args.row;
        var selectedData:Object = args.grid.getData()[ selectedRow ];
        appBus.rowDoubleClicked.dispatch( selectedData as Animal , "animal");
    }

    override protected function onDeregister():void {

    }


}
}