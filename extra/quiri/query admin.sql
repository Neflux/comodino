leggi notifica disputa

UPDATE DisputeNotification DN
SET DN.AdminStatus = 1
WHERE DN.OrderID = @ORDER_ID@ AND
	  DN.ProductID = @PRODUCT_ID AND
	  DN.ShopID = @SHOP_ID@

risposta alla disputa

INSERT INTO DisputeReply DR
VALUES (@ORDER_ID@, @PRODUCT_ID@, @SHOP_ID@, @REPLY@)



rimuovere un venditore (non si puo fare)

DELETE FROM ShopInfo SI
WHERE SI.ShopID = @SHOP_ID@

DELETE FROM UserShop US
WHERE US.ShopID = @SHOP_ID@

DELETE FROM Shop S
WHERE S.ShopID = @SHOP_ID@

