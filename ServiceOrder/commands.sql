DELETE FROM `Order`;

DELETE FROM `Service`;

DELETE FROM `User` -- sharding:0
;

DELETE FROM `User` -- sharding:1
;

INSERT INTO `User`
(id, login, password, first_name, last_name, email)
VALUES(1, 'Qwerty', 'Qwerty', 'Qwerty', 'Qwerty', 'Qwerty@mail.ru') -- sharding:0
;

INSERT INTO `User`
(id, login, password, first_name, last_name, email)
VALUES(2, '_12345', '_12345', '_12345', '_12345', '_12345@gmail.com') -- sharding:1
;

INSERT INTO `User`
(id, login, password, first_name, last_name, email)
VALUES(3, 'flower', 'flower', 'flower', 'flower', 'flower@mail.ru') -- sharding:0
;

INSERT INTO `User`
(id, login, password, first_name, last_name, email)
VALUES(4, 'me', 'me', 'me', 'me', 'me@gmail.com') -- sharding:1
;

INSERT INTO `User`
(id, login, password, first_name, last_name, email)
VALUES(5, 'he', 'he', 'he', 'he', 'he@mail.ru') -- sharding:1
;

INSERT INTO `Service`
(id, service_name, service_category, service_content, creator_id, create_date)
VALUES(1, 'doll', 'toy', 'Barbie_doll', 3, NOW())
;

INSERT INTO `Service`
(id, service_name, service_category, service_content, creator_id, create_date)
VALUES(2, 'boll', 'toy', 'kolobok', 1, NOW())
;

INSERT INTO `Service`
(id, service_name, service_category, service_content, creator_id, create_date)
VALUES(3, 'dress', 'cloth', 'for_those_who_love_themselves', 5, NOW())
;

INSERT INTO `Service`
(id, service_name, service_category, service_content, creator_id, create_date)
VALUES(4, 'flover', 'flover', 'beautiful', 4, NOW())
;

INSERT INTO `Service`
(id, service_name, service_category, service_content, creator_id, create_date)
VALUES(5, 'knife', 'kitchenware', 'very_sharp_one', 2, NOW())
;

INSERT INTO `Order`
(user_id, service_id)
VALUES(1, 1)
;

INSERT INTO `Order`
(user_id, service_id)
VALUES(2, 3)
;

INSERT INTO `Order`
(user_id, service_id)
VALUES(3, 5)
;

INSERT INTO `Order`
(user_id, service_id)
VALUES(4, 4)
;

INSERT INTO `Order`
(user_id, service_id)
VALUES(5, 2)
;





INSERT INTO P2P
(sender_id, receiver_id, `text`, create_date, is_read)
VALUES(1, 2, 'Hello! How are you?', NOW(), 0);

INSERT INTO P2P
(sender_id, receiver_id, `text`, create_date, is_read)
VALUES(1, 2, 'Hello! How are you?', NOW(), 0);
	  
INSERT INTO P2P
(sender_id, receiver_id, `text`, create_date, is_read)
VALUES(5, 3, 'I want to sleep...', NOW(), 0);
	  
INSERT INTO P2P
(sender_id, receiver_id, `text`, create_date, is_read)
VALUES(3, 4, 'I hate Linux', NOW(), 1);
	  
INSERT INTO P2P
(sender_id, receiver_id, `text`, create_date, is_read)
VALUES(4, 3, 'Why?', NOW(), 1);
	  
INSERT INTO P2P
(sender_id, receiver_id, `text`, create_date, is_read)
VALUES(3, 4, 'Because Linux is not friendly to user', NOW(), 0);
	   

	   
INSERT INTO `Group`
(name, author_id, create_date, able_write)
VALUES('ChipsLovers', 1, NOW(), TRUE);
      
INSERT INTO `Group`
(name, author_id, create_date, able_write)
VALUES('kengaROO', 5, NOW(), TRUE);
  
      
INSERT INTO GroupUser
(group_id, user_id, is_moder, is_admin)
VALUES((select id from `Group` where name = 'ChipsLovers'), 
       2, TRUE, 0);
      
INSERT INTO GroupUser
(group_id, user_id, is_moder, is_admin)
VALUES((select id from `Group` where name = 'ChipsLovers'), 
       3, 0, 0);
      
INSERT INTO GroupUser
(group_id, user_id, is_moder, is_admin)
VALUES((select id from `Group` where name = 'ChipsLovers'), 
       4, 0, 0);
            
INSERT INTO GroupUser
(group_id, user_id, is_moder, is_admin)
VALUES((select id from `Group` where name = 'kengaROO'), 
       3, 0, 0);
      
INSERT INTO GroupUser
(group_id, user_id, is_moder, is_admin)
VALUES((select id from `Group` where name = 'kengaROO'), 
       4, 0, 0); 
      

INSERT INTO GroupMessage
(group_id, sender_id, `text`, create_date)
VALUES((select id from `Group` where name = 'ChipsLovers'), 
       1, 'I LOVE chip and LOVE sleeping, but as you can see, I have already eaten chips...', NOW());
 
INSERT INTO GroupMessage
(group_id, sender_id, `text`, create_date)
VALUES((select id from `Group` where name = 'ChipsLovers'), 
       2, 'Then eat more chips', NOW()); 
      
INSERT INTO GroupMessage
(group_id, sender_id, `text`, create_date)
VALUES((select id from `Group` where name = 'ChipsLovers'), 
       (select id from `User` where login = 'Jul'), 
       'I cannot or I became fat...', NOW()); 

INSERT INTO GroupMessage
(group_id, sender_id, `text`, create_date)
VALUES((select id from `Group` where name = 'ChipsLovers'), 
       3, 'So sad', NOW()); 
      
INSERT INTO GroupMessage
(group_id, sender_id, `text`, create_date)
VALUES((select id from `Group` where name = 'kengaROO'), 
       4, 'Hi everyone! What is the name of this animal?', NOW()); 
      
INSERT INTO GroupMessage
(group_id, sender_id, `text`, create_date)
VALUES((select id from `Group` where name = 'kengaROO'), 
       5, 'kangaroo', NOW()); 

INSERT INTO GroupMessage
(group_id, sender_id, `text`, create_date)
VALUES((select id from `Group` where name = 'kengaROO'), 
       4, 'Really? Did you know that in the indian languagee kangaroo means...?', NOW()); 