import Time "mo:base/Time";
import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Text "mo:base/Text";


module {

  public type EventID = Nat;
  public type TicketID = Nat;

  public type Ticket = {
    idTicket: TicketID; // id ticket
    idEvent: EventID; // id event
    amount: Nat; // number of the ticket to buy (ex. max 3) 
    price: Nat; // price event 
    date: Time.Time; // timestamp ticket buy it 
    owner: Principal // owner of the ticket
  };


  public type Event = {
    idEvent: EventID; // id event
    place: Text; // place for the event 
    description: Text; // description
    date: Time.Time; // date of the event
    numSeat: Nat; // max number of seat (feature: can we add also the minimun that the event can be make it)
    price: Nat; // price
    owner: Principal // owner of the event  
  };

  public type NewEvent = {
    place: Text; // place for the event 
    description: Text; // description
    date: Time.Time; // date of the event
    numSeat: Nat; // max number of seat (feature: can we add also the minimun that the event can be make it)
    price: Nat; // price
    owner: Principal // owner of the event  
  };

  // will be the order
  public type BuyTicket = {
    eventId: EventID;
    totPrice: Nat;
  };

  // todo for check payment and return state 
  public type StatusTicketEvent = {
    // No avaiable places
    #failed : Text;
    // Still avaiable place
    #open;
    // No balance
    #rejected;
    // Complete buy ticket
    #succeeded;
};

}