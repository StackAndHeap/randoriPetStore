package behaviors {
import models.MenuListItem;

import randori.behaviors.AbstractBehavior;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.signal.SimpleSignal;
import randori.webkit.page.Window;

public class MenuList extends AbstractBehavior {

    private var _dataProvider:Array;

    [Inject]
    public var itemClicked:SimpleSignal;

    public function MenuList() {
        super();
    }

    override protected function onRegister():void {

    }

    override protected function onDeregister():void {

    }

    public function get dataProvider():Array {
        return _dataProvider;
    }

    public function set dataProvider(value:Array):void {
        _dataProvider = value;
        render();
    }

    private function render():void {
        var div:JQuery = JQueryStatic.J("<ul></ul>");
        for (var i:uint = 0; i < dataProvider.length; i++) {
            var menuItem:MenuListItem = dataProvider[i];
            var button:JQuery = JQueryStatic.J("<li></li>");
            button.addClass1("button");
            button.html(menuItem.label);
            button.attr2("data-link", menuItem.url);
            button.attr2("data-id", menuItem.id);
            button.click1(buttonClickHandler);
            div.append(button);
        }

        decoratedNode.empty();
        decoratedNode.append(div);
    }

    private function buttonClickHandler(event:Event):void {
        var clickedButton:JQuery = JQueryStatic.J(event.currentTarget);
        selectButton(clickedButton.attr("data-id"));
    }

    public function deselectAll():void {
        Window.console.log("deselectAll");
        var children:JQuery = decoratedNode.children().children();
        for (var i:uint = 0; i < children.length; i++) {
            var button:JQuery = children.eq(i);
            button.removeClass("selected");
        }
    }

    public function selectButton(id:String):void {
        var children:JQuery = decoratedNode.children().children();
        for (var i:uint = 0; i < children.length; i++) {
            var button:JQuery = children.eq(i);
            if (button.attr1("data-id") == id) {
                button.addClass("selected");
            } else {
                button.removeClass("selected");
            }
        }
        for (var j:uint = 0; j < dataProvider.length; j++) {
            var item:MenuListItem = dataProvider[j] as MenuListItem;
            if (item.id == id) {
                itemClicked.dispatch(item);
            }
        }
    }
}
}