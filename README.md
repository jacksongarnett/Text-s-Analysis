# Text(s) Analysis - Analyzing Messages on your Mac.

A fun project to access the Messages and Contacts databases on MacOS



## Files and Structure


### - messages_contacts_query.sql
- SQLite3 query to access and export data from database.

### - chat.db (not included)
- Stores the chat database, tables related to chats (text messages).
  
### - AddressBook-v22.abcddb (not included)
- Stores the AddressBook database, tables related to contacts.

### - messages_contacts.csv (not included)
- Query results that contains each message stored on your Mac, includes iMessages, SMS messages, etc, and contacts associated with those messages.



# Analyzing Messages on your Mac.

## Overview

Dive into your messaging world with Text(s) Analysis! Discover insights into your texting habits, from total texts sent to the percentage of TikToks shared. Let's turn your Messages and Contacts databases into a visual masterpiece!


## Step 1: Copy Messages and Contacts databases.
To prevent any chance of altering or borking live databases, copy the Messages and Contacts databases into a new folder that you can use as the base of your project. Note: Your file path may be different than mine. 
(tip) you may need to show hidden files in Finder:   Command + Shift + . (period) 

- In Finder: Navigate to the Messages datbase Macintosh HD > Users > Jax (your username) > Library > Messages > chat.db
- Copy (COPY! don't cut) this file and paste it in your project folder

(I referenced this [Stack Exchange thread](https://apple.stackexchange.com/questions/321521/can-i-access-contact-names-in-chat-db))
- Again in finder: Navigate to the Contacts datbase (see above)
- Copy (yes copy!) this file and paste it in your project folder



## Step 2: Build and query data with SQLite.

- In SQLite (I used SQLite3) connect to both the AddressBook and chat datbases.  I aliased the AddressBook database as 'contacts'



## Step 3: Connect data to Tableau and build the dashboard.

- Connecte the resulting messages_contacts.csv to Tableau and start building!  If you don't have a license of Tableau Desktop available, you can download the free-to-use Tableau Public application.  This version of Tableau supports only a few types of files and dashboards can only be published to Tableau Public, not any version of Tableau Server or cloud. [Download Tableau Public](https://public.tableau.com/app/discover)



## Prerequisites
- Mac using iCloud Messages.
- SQLite 3 installed.
- Tableau Public downloaded.


## Future enhancements
- Using Google Sheets as a way to automate dashboard updating (supported by Tableau Public)
- Automator Script to copy databases 
- Automator Script to run SQL query off copied databases
- Automator Script to publish resulting data to Google Sheets
