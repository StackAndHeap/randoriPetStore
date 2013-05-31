package eventBus {
import randori.signal.SimpleSignal;

public class AppEventBus {

    [Inject] public var rowDoubleClicked:SimpleSignal;
    [Inject] public var tabClicked:SimpleSignal;
    [Inject] public var allTabsRemoved:SimpleSignal;

    public function AppEventBus() {}
}
}