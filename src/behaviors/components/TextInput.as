package behaviors.components {
import randori.behaviors.AbstractBehavior;
import randori.signal.SimpleSignal;

public class TextInput extends AbstractBehavior {

    private var _value:String;
    private var _state:String;

    [Inject] public var valueChanged:SimpleSignal;

    override protected function onRegister():void {
        valueChanged.add(render);
    }

    override protected function onDeregister():void {
        valueChanged.remove(render);
    }

    private function render():void {

    }

    public function get value():String {
        return _value;
    }

    public function set value(value:String):void {
        _value = value;
    }

}
}