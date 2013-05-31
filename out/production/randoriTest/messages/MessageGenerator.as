package messages {

/**
 * Created with IntelliJ IDEA.
 * User: pieter
 * Date: 6/05/13
 * Time: 12:17
 * To change this template use File | Settings | File Templates.
 */
public class MessageGenerator {
    public function newMessage():Message {
        var dateString:String = new Date().toString();
        var message:String = "My Message " + dateString;

        return new Message("My Title", message );
    }
}
}