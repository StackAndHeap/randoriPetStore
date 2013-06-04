package mediators {
import eventBus.AppEventBus;

import randori.behaviors.AbstractMediator;

import router.URLRouter;

public class IndexMediator extends AbstractMediator {

    [Inject] public var appBus:AppEventBus;
    [Inject] public var urlRouter:URLRouter;

}
}