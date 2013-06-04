package context {
import eventBus.AppEventBus;

import guice.GuiceModule;
import guice.binding.Binder;
import guice.binding.Scope;

import router.URLRouter;

import services.MockAnimalService;
import services.MockMiscService;

public class BoringContext extends GuiceModule {

    override public function configure(binder:Binder):void {
        binder.bind( AppEventBus ).inScope( Scope.Singleton ).to( AppEventBus );
        binder.bind( URLRouter ).inScope(Scope.Singleton).to(URLRouter);
        binder.bind( MockAnimalService ).inScope(Scope.Singleton).to(MockAnimalService);
        binder.bind( MockMiscService ).inScope(Scope.Singleton).to(MockMiscService);
    }

    public function BoringContext() {
        super();
    }
}
}
