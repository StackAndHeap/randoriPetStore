package behaviors.tabs {
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;

public class TabFactory {

    public function TabFactory() {
    }

    public function create( name:String, url:String ):JQuery {

        var li:JQuery =  JQueryStatic.J( "<li></li>" );
        var tabId:int = new Date().getTime();
        var link:JQuery = JQueryStatic.J( "<a></a>" );
        link.attr2("href",url) ;
        link.html(name);

        var closeButton:JQuery = JQueryStatic.J( "<button></button>" );
        closeButton.attr2("type","button");
        closeButton.attr2("data-dismiss","alert");
        closeButton.addClass("close");
        closeButton.html("&times;");

        li.append(link);
        li.append(closeButton);
//        tab.click1(tabClickHandler);

        li.attr2("data-tabindex",tabId);
        return li;
    }
}
}