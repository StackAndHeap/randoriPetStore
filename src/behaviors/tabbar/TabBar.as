package behaviors.tabbar {
import randori.behaviors.AbstractBehavior;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.signal.SimpleSignal;

public class TabBar extends AbstractBehavior {

    private var dataProvider:Array;

    [Inject]
    public var dataProviderChanged:SimpleSignal;
    [Inject]
    public var itemClicked:SimpleSignal;

    override protected function onRegister():void {
        dataProvider = [];
        dataProviderChanged.add(render);
    }

    override protected function onDeregister():void {
        dataProviderChanged.remove(render);
    }

    public function addTab(item:TabBarItem):void {
        if(dataProviderHasItem(item)) {
            selectItem(item);
            return;
        }
        deselectAllTabs();
        item.selected = true;
        dataProvider.push(item);
        dataProviderChanged.dispatch();
        itemClicked.dispatch(item);
    }

    public function selectItem(item:TabBarItem):void {
        deselectAllTabs();
        for(var i:int = 0; i< dataProvider.length; i++) {
            var oldItem:TabBarItem = dataProvider[i];
            if(oldItem.id == item.id && oldItem.type == item.type) {
                oldItem.selected = true;
            }
        }
        dataProviderChanged.dispatch();
        itemClicked.dispatch(item);
    }

    public function removeItem(item:TabBarItem):void {
        deselectAllTabs();
        var items:Array = [];
        var selectedItem:TabBarItem = null;
        for(var i:int = 0; i< dataProvider.length; i++) {
            var oldItem:TabBarItem = dataProvider[i];
            if(oldItem.id != item.id || oldItem.type != item.type) {
                items.push(oldItem);
            } else {
                if(i>0 && items[i-1]) {
                    var itemToSelect:TabBarItem = items[i-1];
                    itemToSelect.selected = true;
                    selectedItem = itemToSelect;
                }
            }
        }
        dataProvider = items;
        dataProviderChanged.dispatch();
        itemClicked.dispatch(selectedItem);
    }

    private function dataProviderHasItem(item:TabBarItem):Boolean {
        for (var i:int = 0; i < dataProvider.length; i++) {
            var oldItem:TabBarItem = dataProvider[i];
            if (oldItem.id == item.id && item.type == oldItem.type) {
                return true;
            }
        }
        return false;
    }

    private function deselectAllTabs():void {
        for (var i:int = 0; i < dataProvider.length; i++) {
            var item:TabBarItem = dataProvider[i];
            item.selected = false;
        }
    }

    public function deselectAll():void {
        deselectAllTabs();
        dataProviderChanged.dispatch();
    }

    private function render():void {
        decoratedNode.empty();
        for (var i:uint = 0; i < dataProvider.length; i++) {
            var item:TabBarItem = dataProvider[i];
            var tab:JQuery = renderTab(item, i);
            decoratedNode.append(tab);
        }
    }

    private function renderTab(item:TabBarItem, index:int):JQuery {
        var tab:JQuery = JQueryStatic.J("<li></li>");
        var link:JQuery = JQueryStatic.J("<a></a>");
        link.html(item.label);

        var closeButton:JQuery = JQueryStatic.J("<button></button>");
        closeButton.attr2("type", "button");
        closeButton.attr2("data-dismiss", "alert");
        closeButton.addClass("close");
        closeButton.html("&times;");

        tab.append(link);
        tab.append(closeButton);
        tab.attr2("data-index", index);

        if (item.selected) {
            tab.addClass("selected");
        } else {
            tab.removeClass("selected");
        }

        tab.click1(tabClickedHandler);
        closeButton.click1(closeTabHandler);

        return tab;
    }

    private function tabClickedHandler(e:Event):void {
        var tab:JQuery = JQueryStatic.J(e.currentTarget);
        var item:TabBarItem = dataProvider[tab.attr1("data-index")] as TabBarItem;
        selectItem(item);
    }

    private function closeTabHandler(e:Event):void {
        var tab:JQuery = JQueryStatic.J(e.currentTarget.parentNode);
        var item:TabBarItem = dataProvider[tab.attr1("data-index")] as TabBarItem;
        removeItem(item);
    }

}
}