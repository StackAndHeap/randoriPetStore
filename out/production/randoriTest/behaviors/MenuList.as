package behaviors {
import randori.behaviors.AbstractBehavior;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.signal.SimpleSignal;

public class MenuList extends AbstractBehavior {

    private var _items:Array;
    public var itemClick:SimpleSignal;

    public function MenuList(){
        super();
        itemClick = new SimpleSignal();
    }

    override protected function onRegister():void {

    }

    override protected function onDeregister():void {

    }

    public function get items():Array {
        return _items;
    }

    public function set items(value:Array):void {
        _items = value;
        render();
    }

    private function render():void {
        var div:JQuery = JQueryStatic.J("<ul></ul>");
        for ( var i:uint=0; i<items.length; i++ ){
            var menuItem:Object = items[i];
            var button:JQuery = JQueryStatic.J("<li></li>");
            button.addClass1("button");
            button.html(menuItem.label);
            button.attr2("data-link",menuItem.url);
            button.attr2("data-id","button"+i);
            button.click1(buttonClickHandler);
            div.append(button);
        }

        decoratedNode.empty();
        decoratedNode.append(div);
    }

    private function buttonClickHandler( event:Event ):void{
        var clickedButton:JQuery = JQueryStatic.J( event.currentTarget );
        selectButton( clickedButton, event );
    }

    private function selectButton( clickedButton:JQuery, event:Event=null ):void {
        var children:JQuery = decoratedNode.children().children();
        for ( var i:uint=0; i<children.length; i++ ){
            var button:JQuery = children.eq(i);
            if(button.attr1("data-id") == clickedButton.attr1("data-id")){
                button.addClass("selected");
            }else{
                button.removeClass("selected");
            }
        }
        if(event) itemClick.dispatch(event);
    }
}
}