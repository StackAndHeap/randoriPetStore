package mediators.products {
import Slick.*;

import eventBus.AppEventBus;

import models.Misc;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;
import randori.webkit.html.HTMLInputElement;

import services.MockMiscService;

public class MiscMediator extends AbstractMediator {

    [View]
    public var gridContainer:JQuery;
    [View]
    public var filter:JQuery;
    [Inject]
    public var miscService:MockMiscService;
    [Inject]
    public var appBus:AppEventBus;

    private var grid:Grid;

    override protected function onRegister():void {
        filter.keyup1( filterData );
        miscService.getAll().then( handleResult );
    }

    private function filterData(event:randori.jquery.Event):void{
        var input:HTMLInputElement = event.target as HTMLInputElement;
        miscService.get( input.value ).then( handleResult );
    }

    protected function loadGrid( result:Array ):void {
        var col1:Column = new Column( "name", "Name", "name" );
        var col2:Column = new Column( "animal", "Animal", "animal" );
        var col3:Column = new Column( "picture", "Picture", "picture" );
        var col4:Column = new Column( "quantity", "quantity", "quantity" );
        var col5:Column = new Column( "about", "about", "about" );
        var col6:Column = new Column( "added", "added", "added" );

        var columns:Array = [col1,col2 ,col4,col5,col6];

        var options:Options = new Options();
        options.forceFitColumns = true;
        options.enableCellNavigation = true;
        options.enableColumnReorder = false;

        grid = new Grid( gridContainer, result, columns, options);
        grid.onDblClick.subscribe( cellDblClickHandler );
    }
    private function cellDblClickHandler( e:*, args:Object  ):void {
        var selectedRow:int =  args.row;
        var selectedData:Object = args.grid.getData()[ selectedRow ];
        appBus.rowDoubleClicked.dispatch( selectedData as Misc , "misc");
    }
    private function handleResult( result:Array ):void {
        loadGrid( result );
    }

    override protected function onDeregister():void {

    }

}
}