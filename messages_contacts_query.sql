 SELECT message.ROWID,
    count(message.text) AS number_messages,
    datetime(message.date / 1000000000,'unixepoch','31 years') AS datetime, -- Converts unix time to datetime
    substr(ZFIRSTNAME,1,2) || ' ' || substr(ZLASTNAME,1,2) AS contact_name,
    CASE  -- Determines when a message is from/to a group chat
        WHEN substr(chat.chat_identifier, 1, 4) ='chat'
            THEN 'true'
            ELSE 'false'
        END AS is_group,                        
    chat.display_name AS GC_name,
    message.is_from_me,
    message.associated_message_type,
    CASE -- Using a hex decoding, determines if link sent contains "tiktok.com"
        when ((hex(message.payload_data) like '%74696b746f6b2e636f6d%') AND message.associated_message_type = '0')  then 'true' else 'false' end as tiktok,
    CASE -- If a message payload is a url, and not picked up by TikTok case, mark as weblink
        when ((message.balloon_bundle_id like '%URL%') AND message.associated_message_type = '0')  then 'true' else 'false' end as weblink        
FROM message
LEFT JOIN chat_message_join 
    on message.ROWID = chat_message_join.message_id
LEFT JOIN chat 
    on chat_message_join.chat_id = chat.ROWID
LEFT JOIN chat.handle
    on message.handle_id = handle.ROWID
LEFT JOIN contacts.ZABCDPHONENUMBER -- Hideous replace statements reformats phone number to remove non-numeric, adds back "+1" US country code for matching
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
