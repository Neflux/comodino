SET FOREIGN_KEY_CHECKS=0;
SET @db = 'ecommerce'; #QUI METTETE IL NOME DEL VOSTRO DATABASE
SET @q = CONCAT('DROP TABLE ',@db,'.cart, ' ,@db,'.category, ' ,@db,'.dispute, ' ,@db,'.disputenotification, ' ,@db,'.disputereply, ' ,@db,'.orderlist, ' ,@db,'.ordertable, ' ,@db,'.product, ' ,@db,'.productphoto, ' ,@db,'.productreview, ' ,@db,'.reviewnotification, ' ,@db,'.reviewreply, ' ,@db,'.shippingaddress, ' ,@db,'.shop, ' ,@db,'.shopinfo, ' ,@db,'.shopphoto, ' ,@db,'.shopproduct, ' ,@db,'.shopreview, ' ,@db,'.user, ' ,@db,'.usershop');
PREPARE stmt FROM @q;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET FOREIGN_KEY_CHECKS=1;