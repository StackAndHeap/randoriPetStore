package mediators {
import behaviors.MenuList;
import behaviors.TabBar;

import eventBus.AppEventBus;

import mediators.products.AnimalDetailMediator;

import models.Animal;

import randori.async.Promise;
import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.webkit.page.Window;

public class IndexMediator extends AbstractMediator {

    [View] public var tabBar:TabBar;
    [View] public var menuLeft:MenuList;
    [View] public var myViewStack:ViewStack;

    [Inject] public var appBus:AppEventBus;

    private var clickedAnimal:Animal;
    private var views:Array;

    public function IndexMediator( ) {}

    override protected function onRegister():void {

        menuLeft.items = [
            {label:"Animals",url:"views/products/animals.html"},
            {label:"Misc",url:"views/products/misc.html"},
            {label:"Closed Orders",url:"views/products/animals.html"},
            {label:"Open Orders",url:"views/products/animals.html"},
            {label:"Processing Orders",url:"views/products/animals.html"},
        ];

        menuLeft.itemClick.add(menuClickHandler);

        appBus.rowDoubleClicked.add( handleAddTab );
        appBus.tabClicked.add( handleTabClicked );
        appBus.allTabsRemoved.add( allTabsRemovedHandler );

    }

    private function menuClickHandler( event:Event ):void {
        var button:JQuery = JQueryStatic.J(event.target);
        var viewUrl:String = button.attr1("data-link");

        var promise:Promise = loadView( viewUrl );
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

        appBus.rowDoubleClicked.remove( handleAddTab );
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

}
}