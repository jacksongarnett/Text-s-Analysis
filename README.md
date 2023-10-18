# Text-s-Analysis - Analyzing Messages on your Mac.

A fun project to access the Messages and Contacts databases on MacOS



## Files and Structure


### - chat.db
- Stores the chat database, tables related to chats (text messages).
  
### - AddressBook-v22.abcddb
- Stores the AddressBook database, tables related to contacts.

### - messages_contacts_query.sql
- SQLite3 query to access and export data from database

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

(I referenced this [Stack Exchange thread](https://apple.stackexchange.com/questions/321521/can-i-access-contact-names-in-chat-db)
- Again in finder: Navigate to the Contacts datbase (see above)
- Copy (yes copy!) this file and paste it in your project folder



##Step 2: Build and query data with SQLite.

- In SQLite (I used SQLite3) connect to both the AddressBook and chat datbases.  I aliased the AddressBook database as 'contacts'

---------------------------------------------------------------------------------------------  
  
 SELECT message.ROWID,
    count(message.text) AS number_messages,
    datetime(message.date / 1000000000,'unixepoch','31 years') AS datetime,
    --chat.chat_identifier AS contact_phone_number,
    substr(ZFIRSTNAME,1,2) || ' ' || substr(ZLASTNAME,1,2) AS contact_name,
    CASE 
        WHEN substr(chat.chat_identifier, 1, 4) ='chat'
            THEN 'true'
            ELSE 'false'
        END AS is_group,                        
    chat.display_name AS GC_name,
    message.is_from_me,
    message.associated_message_type,
    CASE
        when ((hex(message.payload_data) like '%74696b746f6b2e636f6d%') AND message.associated_message_type = '0')  then 'true' else 'false' end as tiktok,
    CASE
        when ((message.balloon_bundle_id like '%URL%') AND message.associated_message_type = '0')  then 'true' else 'false' end as weblink        
FROM message
LEFT JOIN chat_message_join 
    on message.ROWID = chat_message_join.message_id
LEFT JOIN chat 
    on chat_message_join.chat_id = chat.ROWID
LEFT JOIN chat.handle
    on message.handle_id = handle.ROWID
LEFT JOIN contacts.ZABCDPHONENUMBER
    on handle.id= '+1' || replace(replace(replace(replace(replace(case 
        WHEN substr(ZABCDPHONENUMBER.ZFULLNUMBER, 1, 2) = '+1' 
            THEN substr(ZABCDPHONENUMBER.ZFULLNUMBER, 3) 
        WHEN substr(ZABCDPHONENUMBER.ZFULLNUMBER, 1, 1) = '1' 
            THEN substr(ZABCDPHONENUMBER.ZFULLNUMBER, 2) 
        else ZABCDPHONENUMBER.ZFULLNUMBER 
        end, ' ', ''), '-', ''), '(', ''), ')', ''), '.', '')
LEFT JOIN contacts.ZABCDRECORD
    on ZABCDPHONENUMBER.ZOWNER = ZABCDRECORD.Z_PK
GROUP BY  message.ROWID
ORDER BY datetime 
  
---------------------------------------------------------------------------------------------


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
