package behaviors.tabs {
import randori.jquery.Event;
import randori.jquery.JQuery;
import randori.jquery.JQueryStatic;
import randori.signal.SimpleSignal;

[JavaScript(export="true",name="Tab")]
public class Tab{

    public var name:String;
    public var url:String;
    public var content:*;
    public var domElement:JQuery;
    public var tabId:int;
    public var selected:Boolean;
    public var tabClicked:SimpleSignal;

    public function Tab( name:String, url:String, tabFactory:TabFactory ) {
        tabClicked = new SimpleSignal();

        this.name = name;
        this.url = url;
        this.tabId = new Date().getTime();

        this.domElement =  JQueryStatic.J( "<li></li>" );
        var link:JQuery = JQueryStatic.J( "<a></a>" );
        link.attr2("href",url) ;
        link.html(name);

        var closeButton:JQuery = JQueryStatic.J( "<button></button>" );
        closeButton.attr2("type","button");
        closeButton.attr2("data-dismiss","alert");
        closeButton.addClass("close");
        closeButton.html("&times;");

        domElement.append(link);
        domElement.append(closeButton);
        domElement.attr2("data-tabindex",tabId);;
    }

    public function tabClickHandler(e:Event):void{
        tabClicked.dispatch(e,this);
    }
}
}