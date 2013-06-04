package behaviors.components {
import randori.behaviors.AbstractBehavior;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.signal.SimpleSignal;

public class Image extends AbstractBehavior {

    private var _url:String;

    [Inject] public var urlChanged:SimpleSignal;

    public function get url():String {
        return _url;
    }

    public function set url(value:String):void {
        _url = value;
        urlChanged.dispatch();
    }

    private function render():void {
        decoratedNode.empty();
        var img:JQuery = JQueryStatic.J("<img />");
        img.attr("src", _url);
        decoratedNode.append(img);
    }

    override protected function onRegister():void {
        urlChanged.add(render);

    }

    override protected function onDeregister():void {
        urlChanged.remove(render);
    }

}
}