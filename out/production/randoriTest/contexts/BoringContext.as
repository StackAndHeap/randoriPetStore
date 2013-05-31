package contexts {
import eventBus.AppEventBus;

import guice.GuiceModule;
import guice.binding.Binder;
import guice.binding.Scope;

import messages.*;

public class BoringContext extends GuiceModule {

    override public function configure(binder:Binder):void {
        binder.bind(MessageGenerator).to(BoringMessageGenerator);
        binder.bind( AppEventBus ).inScope( Scope.Singleton ).to( AppEventBus );
    }

    public function BoringContext() {
        super();
    }
}
}