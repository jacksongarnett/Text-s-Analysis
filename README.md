# Text-s-Analysis - Analyzing Messages on your Mac.

A fun project to access the Messages and Contacts databases on MacOS



## Files and Structure


### - chat.db
- Stores the chat database, tables related to chats (text messages).
  
### - AddressBook-v22.abcddb
- Stores the AddressBook database, tables related to contacts.

### - messages_contacts.csv
- Query results that contains each message stored on your Mac, includes iMessages, SMS messages, etc, and contacts associated with those messages.



# Analyzing Messages on your Mac.

## Overview

Dive into your messaging world with Text(s) Analysis! Discover  insights into your texting habits, from total texts sent to the percentage of TikToks shared. Let's turn your Messages and Contacts databases into a visual masterpiece!


##Step 1: Copy Messages and Contacts databases.
###To prevent any chance of altering or borking live databases, copy the Messages and Contacts database into a new folder that you can use as the base of your project. Note: Your file path may be slightly different than mine. 
(tip) you may need to show hidden files in Finder:   Command + Shift + . (period) 

- In Finder: Navigate to the Messages datbase Macintosh HD > Users > Jax (your username) > Library > Messages > chat.db
- Copy (COPY! don't cut) this file and paste it in your project folder

(I referenced this Stack Exchange thread: https://apple.stackexchange.com/questions/321521/can-i-access-contact-names-in-chat-db)
- Again in finder: Navigate to the Contacts datbase (see above)
- Copy (yes copy!) this file and paste it in your project folder



##Step 2: Build and query data with SQLite.

- In SQLite (I used SQLite3) connect to both the AddressBook and chat datbases.  I aliased the AddressBook database as 'contacts'
- 



##Step 3: Connect data to Tableau and build the dashboard.




#Step 3: Write the Tutorial
Unlocking Insights: Analyzing Messages on your Mac."
Under "Overview," rephrase the description to make it engaging. For example:
"Dive into your messaging world with Text(s) Analysis! Discover fascinating insights into your texting habits, from total texts sent to the percentage of TikToks shared. Let's turn your Messages and Contacts databases into a visual masterpiece!"


For "Tutorial Overview," break down the steps. Use a format like this:
Step 1: Copy Messages and Contacts databases.
Step 2: Build and query data with SQLite.
Step 3: Connect data to Tableau and build the dashboard.
Optional: Download the pre-built dashboard from Tableau Public.


Prerequisites
- Mac with iCloud Messages.
- SQLite 3 installed.
- Tableau Public downloaded.


Additional Tips
tips, license 


Links and Formatting
