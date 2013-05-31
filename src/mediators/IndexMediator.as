package mediators {
import behaviors.MenuList;
import behaviors.TabBar;

import eventBus.AppEventBus;

import mediators.products.AnimalDetailMediator;

import models.Animal;
import models.MenuListItem;

import randori.async.Promise;
import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.webkit.page.Window;

public class IndexMediator extends AbstractMediator {

    [View] public var tabBar:TabBar;
    [View] public var menuLeft:MenuList;
    [View] public var myViewStack:ViewStack;

    [Inject] public var appBus:AppEventBus;

    private var clickedAnimal:Animal;
    private var views:Array;

    public function IndexMediator( ) {

    }

    override protected function onRegister():void {
        menuLeft.dataProvider = getDefaultMenuItems();

        menuLeft.itemClicked.add(menuClickHandler);
        appBus.rowDoubleClicked.add( handleAddTab );
        appBus.tabClicked.add( handleTabClicked );
        appBus.allTabsRemoved.add( allTabsRemovedHandler );

        selectDefaultView();
    }

    private function selectDefaultView():void {
        menuLeft.selectButton("animalsBtn");

        var promise:Promise = loadView( "views/products/animals.html" );
        promise.then( viewAddedHandler );

        tabBar.deselectAllTabs();
    }

    private function menuClickHandler( item:MenuListItem ):void {
        var promise:Promise = loadView( item.url );
        promise.then( viewAddedHandler );

        tabBar.deselectAllTabs();
    }

    private function loadView(url:String):Promise {
        var promise:Promise;

        if(myViewStack.hasView(url) == true) {
            myViewStack.selectView(url);
            promise = new Promise();
            promise.resolve(true);
        } else {
            promise = myViewStack.pushView(url);
            promise.then(function():void {
                myViewStack.selectView(url);
            });
        }

        return promise;
    }

    public function viewAddedHandler ( mediator:* ) :void
    {
        try{
            var animalDetailMediator:AnimalDetailMediator = mediator as AnimalDetailMediator;
            animalDetailMediator.data = clickedAnimal;
        }catch(e:Error){}
    }

    override protected function onDeregister():void {
        menuLeft.itemClicked.remove(menuClickHandler);
        appBus.rowDoubleClicked.remove( handleAddTab );
        appBus.tabClicked.remove( handleTabClicked );
        appBus.allTabsRemoved.remove( allTabsRemovedHandler );

    }

    private function handleAddTab ( selectedAnimal:Animal ):void{
        this.clickedAnimal = selectedAnimal;
        var tabName:String = selectedAnimal.name;
        this.tabBar.addTab("#"+tabName, tabName, selectedAnimal);
        var promise:Promise = loadView("views/products/animals-detail.html");
        promise.then( viewAddedHandler );
    }

    private function handleTabClicked ( tab:JQuery, data:* ) :void{
        this.clickedAnimal = data;
        Window.console.log(data);
        var promise:Promise = loadView("views/products/animals-detail.html");
        promise.then( viewAddedHandler );
    }

    private function allTabsRemovedHandler( e:Event ):void{
        loadView("views/products/animals.html");
    }

    private function getDefaultMenuItems():Array {
        var animalsBtn:MenuListItem = new MenuListItem();
        animalsBtn.id = "animalsBtn";
        animalsBtn.label = "Animals";
        animalsBtn.url = "views/products/animals.html";
        var miscBtn:MenuListItem = new MenuListItem();
        miscBtn.id = "miscBtn";
        miscBtn.label = "Misc";
        miscBtn.url = "views/products/misc.html";
        var closedOrdersBtn:MenuListItem = new MenuListItem();
        closedOrdersBtn.id = "closedOrdersBtn";
        closedOrdersBtn.label = "Closed Orders";
        closedOrdersBtn.url = "views/products/animals.html";
        var processingOrdersBtn:MenuListItem = new MenuListItem();
        processingOrdersBtn.id = "processingOrdersBtn";
        processingOrdersBtn.label = "Processing Orders";
        processingOrdersBtn.url = "views/products/animals.html";

        return [animalsBtn,miscBtn,closedOrdersBtn,processingOrdersBtn];
    }
}
}