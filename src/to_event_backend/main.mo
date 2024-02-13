import Map "mo:base/HashMap";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Hash "mo:base/Hash";
import Iter "mo:base/Iter";
import Error "mo:base/Error";
import Debug "mo:base/Debug";
import Time "mo:base/Time";


import Types "./modules/Types";
import Utils "./modules/Utils";

 actor  {

  let events = Map.HashMap<Types.EventID, Types.Event>(0,  Nat.equal, Hash.hash);

  system func heartbeat() : async () {
        //Debug.print("Alive!");
  };

  // ==== CRUD

  public func insertEvent(newEvent : Types.NewEvent): async () {
    var event = Utils.createNewEvent(newEvent);
    events.put(event.idEvent, event)
  };

  public func showEvents() : async [(Types.EventID, Types.Event)] {
    Iter.toArray(events.entries());
  };

  public query func getEvent(id: Types.EventID) : async ?Types.Event {
    events.get(id);
  };

  public func updateEvent(eventId: Types.EventID, newEvent: Types.Event) : async () {
    events.put(eventId, newEvent);
  };


  // we can add a type Order with more information
    public shared(msg) func buyTicketToEvent(eventId: Types.EventID): async Types.Ticket {
    
      let event : ?Types.Event = events.get(eventId);

      switch (event) {
      
        case (null) {throw Error.reject("Event can not be found");};

        case (?event) {
          let paymentStatus = await makePayment(event.price);
      
          if (paymentStatus) {
            // generate the ticket 
            let ticket = await Utils.generateTicket(event, msg.caller);
            return ticket;
          } else {
          throw Error.reject("Error during payment. Unable to generate the ticket");
          }
      };
    }
  };

  private func makePayment(amount: Nat): async Bool {

  // todo we will add here the logic for the payment. 
  // The question : 
  // We pay the canister and the canister trasfer to owner event ?  
    return true; 
  };
};
