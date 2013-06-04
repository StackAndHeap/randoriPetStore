package router {
import randori.webkit.page.Window;

public class URLRouter {
    public var route:Array = [];

    public function URLRouter() {
        parseUrl();
    }

    private function parseUrl():void {
        var currentHashes:Array = Window.location.hash.split("/");

        for (var i:uint = 0; i < currentHashes.length; i++) {
            var hash:String = currentHashes[i];
            if (hash != "") {
                hash = hash.replace("#", "");
                route.push(hash);
            }
        }
    }

    private function renderHash():void {
        Window.location.hash = "#" + route.join("/");
    }

    public function addRoute(newRoute:String):void {
        route.push(newRoute);
        renderHash();
    }

    public function replaceRoute(id:int, newRoute:String):void {
        route[id] = newRoute;
        renderHash();
    }

    public function removeRoute():void {
        route = [];
        renderHash();
    }
}
}