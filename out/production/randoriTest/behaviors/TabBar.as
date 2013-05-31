package behaviors {
import behaviors.tabs.Tab;
import behaviors.tabs.TabFactory;

import eventBus.AppEventBus;

import randori.behaviors.AbstractBehavior;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;

public class TabBar extends AbstractBehavior
{

    [Inject] public var appBus:AppEventBus;

    private var _items:Array;
    private var tabFactory:TabFactory;

    override protected function onRegister():void
    {
        super.onRegister();
    }

    override protected function onDeregister():void
    {
        super.onDeregister();
    }

    public function addTab( url:String, name:String, data:*=null ):int
    {
        deselectAllTabs();
        var tab:Tab = new Tab(name,url,tabFactory);
        tab.tabClicked.add(tabClickHandler);
        tab.content = data;
        tab.selected = true;
        items.push(tab);
        render();

        return tab.tabId;
    }

    public function render():void{
        decoratedNode.empty();
        for ( var i:uint=0; i<items.length; i++ ){
            var tab:Tab = items[i];
            tab.selected ? tab.domElement.addClass("selected"): tab.domElement.removeClass("selected");
            tab.domElement.click1( tab.tabClickHandler );
            decoratedNode.append( tab.domElement );
        }
    }

    public function closeButtonClickHandler( e:Event ):void
    {
        var clickedTab:JQuery = JQueryStatic.J( e.currentTarget.parentNode );
        removeTab(clickedTab);
        e.stopImmediatePropagation();
    }

    public function removeTab(clickedTab:JQuery):void {
        var clickedTabIndex:int = clickedTab.attr1("data-tabindex") as int;
        var children:JQuery = decoratedNode.children();

//        if( clickedTabIndex == _selectedIndex )
//        {
//            // last tab to be removed
//            if(children.length > 1 ){
//                selectPreviousTab( children );
//            }else{
//                appBus.allTabsRemoved.dispatch();
//            }
//
//        }
        decoratedNode.children().remove( "li[data-tabindex=" + clickedTabIndex + "]" );
    }

    private function  selectPreviousTab ( children:JQuery ):void{
//        var tab:JQuery;
//        var tabToSelect:JQuery;
//        for(var i:uint=0;i<children.length;i++)
//        {
//            tab = children.eq(i);
//            if( tab.attr1("data-tabindex") as int == _selectedIndex )
//            {
//                if( i>0 ){
//                if( i>0 ){
//                    tabToSelect = children.eq( i-1 );
//                }else{
//                    tabToSelect = children.eq( i+1 );
//                }
//                selectTab( tabToSelect.attr1("data-tabindex") as int );
//            }
//        }
    }

    public function tabClickHandler( e:Event, tab:Tab ):void
    {
        selectTab( tab );
    }

    public function selectTab(tab:Tab):void{

        deselectAllTabs();
        tab.selected = true;
        render();
    }

    public function deselectAllTabs():void
    {
        for( var i:uint=0; i<items.length; i++ )
        {
            var tab:Tab = items[i];
            tab.selected = false;
        }
    }

    public function TabBar( )
    {
        items = new Array();
        tabFactory = new TabFactory();
    }

    public function get items():Array {
        return _items;
    }

    public function set items(value:Array):void {
        _items = value;
    }
}
}