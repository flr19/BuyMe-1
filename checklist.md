I. Create accounts of users; login, logout.

II. Auctions (Manual)
   - [ ] seller creates auctions and posts items for sale
	= [ ] set all the characteristics of the item
	= [ ] set closing date and time
        - [ ] set a hidden minimum price (reserve)
    [] a buyer should be able to bid
	    [] let the buyer set a new bid
	    [] alert other buyers of the item that a higher bid has been placed 
  [] define the winner of the auction
	[] when the closing time has come, check if the seller has set a reserve
	    [] if yes: if the reserve is higher than the last bid none is the winner.
	    [] if no: whoever has the higher bid is the winner
		[] alert the winner that they won the auction

III Auctions (Automatic)
    [] a buyer should be able to set an automatic bidding
	[] set a secret upper limit
	[] set a bid increment (put in the database a higher bid automatically for the user in       
       case someone bids higher)
    	[] alert buyers in case someone bids more than their upper limit 
   [] define the winner of the auction
	[] when the closing time has come, check if the seller has set a reserve
	    [] if yes: if the reserve is higher than the last bid none is the winner.
	    [] if no: whoever has the higher bid is the winner
		[] alert the winner that they won the auction


IV Browsing and advanced search functionality
    [] let people browse on the items and see the status of the current bidding
    [] sort by different criteria (by type, bidding price etc.)
    [] search the list of items by various criteria.
    [] a user should be able to:
	[] view all the history of bids for any specific auction
    	[] view the list of all auctions a specific buyer or seller has participated in
	[] view the list of "similar" items on auctions in the preceding month (and auction information about them)
    [] let user set an alert for specific items s/he is interested 
	[] get an alert when the item becomes available

V Admin and customer rep functions
      [] Admin (create an admin account ahead of time)
	[] creates accounts for customer representatives
    	[] generates sales reports for:
		[] total earnings
		[] earnings per:
	    		[] item
	    		[] item type
	    		[] end-user
    		[] best-selling items
   		[] best buyers

      [] Customer representative functions:
	[] users browse questions and answers
	[] users search questions by keywords
	[] users post questions to the customer representatives (i.e. customer service)
	[] reps reply to user questions
	[] edits and deletes account information
	[] removes bids 
	[] removes auctions 

