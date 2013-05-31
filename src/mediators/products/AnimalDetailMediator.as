package mediators.products {
import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.template.TemplateBuilder;

public class AnimalDetailMediator extends AbstractMediator {

    [Inject] public var templateBuilder:TemplateBuilder;
    [View(required = "false")] public var template:JQuery;

    private var _data:Object;

    public function AnimalDetailMediator(data:Object):void{}

    public function render():void{
        var row:JQuery;
        var div:JQuery = JQueryStatic.J("<div></div>");
        row = templateBuilder.renderTemplateClone(data).children();
        row.addClass("randoriListItem");
        div.append(row);

        decoratedNode.empty();
        decoratedNode.append(div.children());
    }


    override protected function onPreRegister():void {
        super.onPreRegister();
        templateBuilder.captureAndEmptyTemplateContents(decoratedNode);
    }

    override protected function onRegister():void {

    }

    override protected function onDeregister():void {

    }

    public function get data():Object {
        return _data;
    }

    public function set data(value:Object):void {
        _data = value;
        render();
    }
}
}