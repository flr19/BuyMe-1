Group 10 BuyMe Auction System Project
CS 336 Rutgers University Spring 2021

Collaborators: Kuhu Halder (kh761), Farah Lubaba Rouf (flr19), Prince Rawal (prr45), Jigisha Mavani (jgm151)

Project URL: http://ec2-18-222-204-142.us-east-2.compute.amazonaws.com:8080/CS336-Project/

Demo Video: https://drive.google.com/file/d/1VfYlj5IET7wDV-Qyrfw-ls3VVkWwWUuX/view?usp=sharing

AWS RDS: cs336db.cnp0zklnvjct.us-east-2.rds.amazonaws.com:3306/auctionsystem
Username: admin
Password: cs336prince

Credentials:

Customer Rep
username: kuhu27 password: halder
username: farah01 password: lubaba
username: jigisha19 password: mavani

Admin
user: prince18 password: 1234

Please put your local DB password in Constants.java in src/com.336.pkg

All the features implemented are listed in the checklist.md file

Contributions:
Equal contribution among all team members

Assumptions:
- For our earnings per end-user, if the seller did not make any earnings, it doesn't show up.
- We do not distinguish between buyer and seller even though we ask for their choice in the create account page. Users can bid on auctions they haven't created and create auction on items they have created.
- We gave the buyers the authority over the bid increments which should be greater than the seller's bid increment. For users who have opted for auto-bidding, their last bid amount stops at the upper limit. 

