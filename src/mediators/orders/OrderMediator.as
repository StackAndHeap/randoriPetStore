package mediators.orders {
import Slick.*;

import eventBus.AppEventBus;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;

import services.json.JsonService;
import services.json.parsers.MiscParser;

public class OrderMediator extends AbstractMediator {

    [View]
    public var gridDiv:JQuery;
    [Inject]
    public var service:JsonService;
    [Inject]
    public var appBus:AppEventBus;

    private var grid:Grid;

    override protected function onRegister():void {
        service.get( "assets/data/things.json",new MiscParser() ).then( handleResult );
    }

    protected function loadGrid( result:Array ):void {
        var col1:Column = new Column("name", "Name", "name" );
        var col2:Column = new Column("animal", "Animal", "animal" );
        var col3:Column = new Column("picture", "Picture", "picture" );
        var col4:Column = new Column("quantity", "Quantity", "quantity" );
        var col5:Column = new Column("about", "About", "about" );
        var col6:Column = new Column("added", "Date added", "added" );

        var columns:Array = [col1,col2,col3,col4,col5,col6];

        var options:Options = new Options();
        options.enableCellNavigation = true;
        options.enableColumnReorder = false;

        grid = new Grid( gridDiv, result, columns, options);
    }

    private function handleResult( result:Array ):void {
        loadGrid( result );
    }

    override protected function onDeregister():void {

    }

}
}