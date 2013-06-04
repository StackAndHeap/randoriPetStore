package behaviors.components {
import randori.behaviors.AbstractBehavior;
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.signal.SimpleSignal;

public class DropDown extends AbstractBehavior {

    private var _value:String;
    private var _dataField:String;
    private var _dataProvider:Array;
    private var _label:String;
    private var _state:String = "view";

    [Inject]
    public var valueCommit:SimpleSignal;
    [Inject]
    public var valueChanged:SimpleSignal;

    override protected function onRegister():void {
        valueChanged.add(render);
        parseNodeDataAttributes(decoratedNode);
    }

    private function parseNodeDataAttributes(node:JQuery):void {
        if (node.attr1("data-label")) {
            _label = node.attr1("data-label");
        }
        valueChanged.dispatch();
    }

    override protected function onDeregister():void {
        valueChanged.remove(render);

    }

    private function render():void {
        decoratedNode.empty();
        switch (_state) {
            case "edit":
                renderEditState(decoratedNode);
                break;
            case "view":
                renderViewState(decoratedNode);
                break;
        }
    }

    private function renderEditState(node:JQuery):void {
        var div:JQuery = JQueryStatic.J("<div></div>");
        node.append(div);

        var paragraph:JQuery = JQueryStatic.J("<p></p>");
        paragraph.css3("font-weight", "bold");
        paragraph.css3("display", "inline-block");
        paragraph.css3("vertical-align", "middle");
        paragraph.html(label + ": ");
        div.append(paragraph);

        var dropdown:JQuery = JQueryStatic.J("<select></select>");
        dropdown.css3("display", "inline-block");
        dropdown.css3("margin-left", "5px");
        for (var i:int = 0; i < dataProvider.length; i++) {
            var item:String = dataProvider[i];
            var option:JQuery = JQueryStatic.J("<option></option>");
            option.html(item);
            if(item == value) {
                option.attr2("selected", "selected");
            } else {
                option.removeAttr("selected");
            }
            dropdown.append(option);
        }
        dropdown.focusout1(onLostFocus);
        dropdown.change(onLostFocus);
        div.append(dropdown);
        
        dropdown.focus();
    }

    private function onLostFocus(e:*):void {
        commit(e.currentTarget.value);
    }

    private function commit(value:String):void {
        _state = "view";
        _value = value;
        valueChanged.dispatch();
        valueCommit.dispatch(_value, _dataField);
    }

    private function renderViewState(node:JQuery):void {
        var paragraph:JQuery = JQueryStatic.J("<p></p>");
        paragraph.click(gotoEditState);
        paragraph.html(_label + ": " + _value);
        node.append(paragraph);
    }

    private function gotoEditState(e:Event):void {
        state = "edit";
    }


    public function get value():String {
        return _value;
    }

    public function set value(value:String):void {
        _value = value;
        valueChanged.dispatch();
    }

    public function get dataField():String {
        return _dataField;
    }

    public function set dataField(value:String):void {
        _dataField = value;
        valueChanged.dispatch();
    }

    public function get label():String {
        return _label;
    }

    public function set label(value:String):void {
        _label = value;
        valueChanged.dispatch();
    }

    public function get state():String {
        return _state;
    }

    public function set state(value:String):void {
        _state = value;
        valueChanged.dispatch();
    }

    public function get dataProvider():Array {
        return _dataProvider;
    }

    public function set dataProvider(value:Array):void {
        _dataProvider = value;
        valueChanged.dispatch();
    }
}
}