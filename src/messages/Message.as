package messages {

[JavaScript(export="false",name="Object",mode="json")]
public class Message {
    public var title:String;
    public var message:String;

    public function Message( title:String, message:String ) {
        this.title = title;
        this.message = message;
    }
}
}