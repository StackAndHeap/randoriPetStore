package messages {
public class BoringMessageGenerator extends  MessageGenerator{
    override public function newMessage():Message {
        return new Message("Boring Message", "Yawn" );
    }
}
}