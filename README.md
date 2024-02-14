# to_event



Welcome to my project, To_Event.
First of all, I want to start by saying that this project is in early stages and is not yet 100% complete, perhaps around 5%.

Briefly, To_Event aims to be an event platform where users can create events and also purchase tickets for other events.
I believe To_Event's model can work very well on ICP, especially in terms of scalability and complete decentralization of every step. (Sure there are other points, but my knowledge is still limited on ICP)

Before diving into development, I conducted a brief analysis of the event industry that could benefit from blockchain technology.
The documentation for this analysis can be found in the directory named "documentation", although it is still a work in progress.

## Running the project locally

If you want to deploy the project locally, you can use the following commands:


```bash
# Stop all the replica running in the background
dfx stop

# Starts the replica, running in the background
dfx start --background

# Move to directory project
cd /to_event

# Deploys  canisters to the replica and generates your candid interface
dfx deploy
```

Once the job completes, application will be available at `http://localhost:4943?canisterId={asset_canister_id}`.

## Demo

1. When the application is available we can try do add some events with the command : 

  ```bash
  dfx canister call to_event_backend insertEvent '(record { "place" = "Moon"; "description" = "Motoko Event"; "date"=  1629311230; "numSeat"= 1000; "price"= 5; "owner"= principal "jnx3g-qqglo-j662o-ixkcz-jp7nm-7xd37-d4oli-vxmca-ihpb6-ock5g-mae" })'
  ```

  Add some event using also different ```owner```

2. To see all events available  we can use : 

  ```bash
    dfx canister call to_event_backend showEvents
  ```

  The output will show all events available  with all information

 3. To buy a ticket for a specific event 

  ```bash
    dfx canister call to_event_backend buyTicketToEvent "EVENT-ID"
  ```

  We need to set ```EVENT-ID``` and after on the output we will see our ticket. 







