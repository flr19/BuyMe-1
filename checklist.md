## I. Create accounts of users; login, log out.
- [X] Create accounts of users - login, logout

## II. Auctions (Manual) 
- [X] seller creates auctions and posts items for sale
	- [X] set all the characteristics of the item
	- [X] set closing date and time
	- [X] set a hidden minimum price (reserve)
- [X] a buyer should be able to bid
	- [X] let the buyer set a new bid
	- [X] alert other buyers of the item that a higher bid has been placed 
- [X] define the winner of the auction
	- [X] when the closing time has come, check if the seller has set a reserve
	    - [X] if yes: if the reserve is higher than the last bid none is the winner.
	    - [X] if no: whoever has the higher bid is the winner
	- [X] alert the winner that they won the auction

## III Auctions (Automatic)
- [X] a buyer should be able to set an automatic bidding
    - [X] set a secret upper limit
	  - [X] set a bid increment (put in the database a higher bid automatically for the user in       
       case someone bids higher)
    - [X] alert buyers in case someone bids more than their upper limit 
    - [X] define the winner of the auction
- [X] when the closing time has come, check if the seller has set a reserve
	- [X] if yes: if the reserve is higher than the last bid none is the winner.
	- [X] if no: whoever has the higher bid is the winner
- [X] alert the winner that they won the auction


## IV Browsing and advanced search functionality
- [X] let people browse on the items and see the status of the current bidding
- [X] sort by different criteria (by type, bidding price, etc.)
- [X] search the list of items by various criteria.
- [X] a user should be able to:
	- [X] view all the history of bids for any specific auction
	- [X] view the list of all auctions a specific buyer or seller has participated in
	- [X] view the list of "similar" items on auctions in the preceding month (and auction information about them)
- [X] let user set an alert for specific items s/he is interested 
	- [X] get an alert when the item becomes available


## V Admin and customer rep functions
- [X] Admin (create an admin account ahead of time)
- [X] Creates accounts for customer representatives
- [X] Generates sales reports 
 	- [X] total earnings
		- [X] earnings per:
			- [X] item 
	    		- [X] item type (analog, digital, touchscreen)
	    		- [X] end-user (seller)
    		- [X] best-selling items
   		- [X] best buyers

- [X] Customer representative functions:
	- [X] users browse questions and answers
	- [X] users search questions by keywords
	- [X] users post questions to the customer representatives (i.e. customer service)
	- [X] reps reply to user questions
	- [X] edits and deletes account information
	- [X] removes bids 
	- [X] removes auctions 

