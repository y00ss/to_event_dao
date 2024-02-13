import Time "mo:base/Time";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Principal "mo:base/Principal";

import Types "./Types";

module Utils {

  public func createNewEvent(newEvent : Types.NewEvent) : Types.Event {
    
    let id = Time.now(); // I will get from chain
    
     let event : Types.Event =  {
      idEvent = Int.abs(id);
      place = newEvent.place; 
      description = newEvent.description;
      date = newEvent.date;
      numSeat =  newEvent.numSeat; 
      price= newEvent.price;
      owner= newEvent.owner;
      
    };
    return event;
  };


  public func generateTicket(event: Types.Event, ownerTicket: Principal) : async Types.Ticket{

    let id = Time.now(); // I will get from chain

    let ticket : Types.Ticket = {
      idTicket=Int.abs(id);
      idEvent= event.idEvent;
      amount=1; //we will get from the order
      price=event.price;
      date = Time.now();
      owner= ownerTicket 

    };

    return ticket;

  };


}