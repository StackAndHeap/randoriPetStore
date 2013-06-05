package eventBus {
import randori.signal.SimpleSignal;

public class AppEventBus {

    [Inject] public var rowDoubleClicked:SimpleSignal;
    [Inject] public var tabClicked:SimpleSignal;
    [Inject] public var allTabsRemoved:SimpleSignal;
    [Inject] public var login:SimpleSignal;
    [Inject] public var logout:SimpleSignal;

    [Inject] public var nameChanged:SimpleSignal;

    [Inject] public var showModal:SimpleSignal;

    [Inject] public var reloadData:SimpleSignal;

    public function AppEventBus() {}
}
}