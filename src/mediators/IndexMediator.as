package mediators {
import behaviors.MenuList;
import behaviors.tabbar.TabBar;
import behaviors.tabbar.TabBarItem;

import eventBus.AppEventBus;

import mediators.products.AnimalDetailMediator;

import models.Animal;
import models.MenuListItem;

import randori.async.Promise;
import randori.behaviors.AbstractMediator;
import randori.behaviors.ViewStack;
import randori.webkit.page.Window;

import router.URLRouter;

public class IndexMediator extends AbstractMediator {

    [View] public var menuLeft:MenuList;
    [View] public var myViewStack:ViewStack;
    [View] public var tabBar:TabBar;

    [Inject] public var appBus:AppEventBus;
    [Inject] public var urlRouter:URLRouter;

    private var selectedTabBarItem:TabBarItem;
    private var views:Array;

    public function IndexMediator( ) {

    }

    override protected function onRegister():void {
        menuLeft.dataProvider = getDefaultMenuItems();

        menuLeft.itemClicked.add(menuClickHandler);

        appBus.rowDoubleClicked.add(itemDoubleClickedHandler);

        tabBar.itemClicked.add(onItemSelected);

        selectDefaultView();
    }

    private function itemDoubleClickedHandler(data:Animal):void {
        var tabItem:TabBarItem = new TabBarItem();
        tabItem.id = data.id;
        tabItem.label = data.name;
        tabItem.type = "animal";
        tabBar.addTab(tabItem);
    }

    private function onItemSelected(item:TabBarItem):void {
        selectedTabBarItem = item;

        menuLeft.deselectAll();

        urlRouter.removeRoute();

        if(item == null) {
            allTabsRemovedHandler();
        }

        switch (item.type) {
            case "animal":
                    var loadAnimal:Promise = loadView("views/products/animals-detail.html");
                    loadAnimal.then(viewAddedHandler);
                break;
            case "misc":

                break;
        }
    }

    private function selectDefaultView():void {
        if(urlRouter.route[0]) {
            var items:Array = getDefaultMenuItems();
            for(var i:int = 0; i<items.length;i++) {
                var menuItem:MenuListItem = items[i] as MenuListItem;
                if(menuItem.route == urlRouter.route[0]) {
                    menuLeft.selectButton(menuItem.id);
                    return;
                }
            }
        } else {
            menuLeft.selectButton("animalsBtn");
        }
    }

    private function menuClickHandler( item:MenuListItem ):void {
        tabBar.deselectAll();
        urlRouter.replaceRoute(0,item.route);
        var promise:Promise = loadView( item.url );
        promise.then( viewAddedHandler );
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
        switch(selectedTabBarItem.type) {
            case "animal":
                (mediator as AnimalDetailMediator).setData(selectedTabBarItem);
                break;
        }
    }

    override protected function onDeregister():void {
        menuLeft.itemClicked.remove(menuClickHandler);
        tabBar.itemClicked.remove( onItemSelected );

    }

    private function allTabsRemovedHandler():void{
        Window.console.log("allTabsRemovedHandler");
        selectDefaultView();
    }

    private function getDefaultMenuItems():Array {
        var animalsBtn:MenuListItem = new MenuListItem();
        animalsBtn.id = "animalsBtn";
        animalsBtn.label = "Animals";
        animalsBtn.url = "views/products/animals.html";
        animalsBtn.route = "animals";
        var miscBtn:MenuListItem = new MenuListItem();
        miscBtn.id = "miscBtn";
        miscBtn.label = "Misc";
        miscBtn.url = "views/products/misc.html";
        miscBtn.route = "misc"
        var closedOrdersBtn:MenuListItem = new MenuListItem();
        closedOrdersBtn.id = "closedOrdersBtn";
        closedOrdersBtn.label = "Closed Orders";
        closedOrdersBtn.url = "views/products/animals.html";
        closedOrdersBtn.route = "closedOrders";
        var processingOrdersBtn:MenuListItem = new MenuListItem();
        processingOrdersBtn.id = "processingOrdersBtn";
        processingOrdersBtn.label = "Processing Orders";
        processingOrdersBtn.route = "processingOrders";
        processingOrdersBtn.url = "views/products/animals.html";

        return [animalsBtn,miscBtn,closedOrdersBtn,processingOrdersBtn];
    }
}
}