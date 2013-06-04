package mediators.products {
import behaviors.tabbar.TabBarItem;

import models.Animal;

import randori.behaviors.AbstractMediator;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.template.TemplateBuilder;
import randori.webkit.page.Window;

import services.MockAnimalService;

[JavaScript(export="true", name="AnimalDetailMediator")]
public class AnimalDetailMediator extends AbstractMediator {

    [Inject] public var templateBuilder:TemplateBuilder;
    [View(required = "false")] public var template:JQuery;

    [Inject] public var animalService:MockAnimalService;

    private var _data:Animal;

    public function AnimalDetailMediator():void{}

    public function render():void{

        var row:JQuery;
        var div:JQuery = JQueryStatic.J("<div></div>");
        row = templateBuilder.renderTemplateClone(_data).children();
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

    public function setData(value:TabBarItem):void {
        Window.console.log("setData");
        animalService.getById(value.id).then(dataReceivedHandler);
        render();
    }

    private function dataReceivedHandler(data:Animal):void {
        _data = data;
        render();
    }
}
}