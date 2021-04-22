
# Online Auction System (eBay clone)

- Contributors: <a href = 'https://github.com/kuhuhalder'> Kuhu Halder</a>, <a href = 'https://github.com/flr19' >Farah Lubaba Rouf</a>, <a href = 'https://github.com/princerawal'> Prince Rawal</a>, <a href = 'https://github.com/jigisham'>Jigisha Mavani</a>
- Class: CS 336 Principles of Information and Data Management
- Professor: Antonio Miranda-Garcia
- Semester: Spring 2021
- Course Site: <a href = 'https://www.cs.rutgers.edu/academics/undergraduate/course-synopses/course-details/01-198-336-principles-of-information-and-data-management'> Link </a>
- Project URL: 

## Table of Contents

<li><a href="#description">Description</a></li>
<li><a href="#built-with">Built with (Technologies, Languages, and Frameworks Used)</a></li>
<li><a href="#features-implemented">Features Implemented</a></li>
<li><a href="#setup">Setup</a></li>
<li><a href="#project-directory-contents">Project Directory Contents</a></li>
<li><a href="#run">Run</a></li>

## Description

In this project, we designed and implemented a relational database system to support the operations of an online auction system. We used HTML for the user interface, MySQL for the database server, and Java, Javascript, and JDBC for connectivity between the user interface and database server.


## Built With 

### Technologies, Languages, and Frameworks Used

- Java Servlet Pages
- Apache Tomcat
- AWS Relational Database 
- MYSQL Server and Workbench
- JDBC
- Eclipse
- HTML and Java

## Features Implemented

#### End-users (buyers and sellers)
1. They are able to create and delete accounts, and login and logout.
2. An end-user can search the list of items on auction according to various criteria based on the fields describing an item. 
3. Potential buyers are able to set alerts for items they are interested in buying. 
4. A user is able to view the history of bids for any specific auction, the list of all auctions a specific buyer or seller has participated in, the list of "similar" items on auction in the preceding month (and auction information about them).

#### Customer representatives 
1. Customer reps are available to end-users for answering questions, and modifying any information, as long as the customer rep decides this is reasonable. 
2. This includes resetting passwords and removing bids. So your system need not support any specific rules for removing bids.
3. They can therefore be able to perform such actions, as well as removing illegal auctions.

#### One administrative staff member 
1. One admin whose account will have been created ahead of time, is be able to create accounts for customer representatives.
2. This person is also be able to generate summary sales reports, including: total earnings; earnings per { item, item type, end-user}; best- selling {items, end-users}.

## Setup

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/kuhuhalder/336-Auction-System-Project.git
   ```
2. Install Eclipse Java EE IDE
3. Install Apache Tomcat 
4. Configure the settings for Runtime Environment

## Project Directory Contents

## Run

1. Right-click on the project and click on Run As - Run on Server
