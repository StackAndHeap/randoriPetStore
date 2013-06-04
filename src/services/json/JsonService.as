package services.json {
import randori.async.Promise;
import randori.service.AbstractService;
import randori.webkit.page.Window;
import randori.webkit.xml.XMLHttpRequest;

public class JsonService extends AbstractService{

    public function JsonService( xmlHttpRequest:XMLHttpRequest ) {
        super( xmlHttpRequest );
    }
    public function get(url:String , parser:*=null):Promise {
        Window.console.log(url);
        var promise:Promise = sendRequest("GET",url);
        return promise.then( parser.parseResult );
    }
}
}