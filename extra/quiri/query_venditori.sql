-- IL MIO NEGOZIO

riepilogo negozio

SELECT *
FROM Shop S
WHERE S.ShopID = @SHOPID@

riepilogo negozio fisico

SELECT *
FROM ShopInfo SI
WHERE SI.ShopID = @SHOPID@

modifica negozio

UPDATE Shop S
SET S.Name = @NEW_NAME@,
	S.Description = @NEW_DESCRIPTION@
	S.Website = @NEW_WEBSITE@
WHERE S.ShopID = @SHOPID@

modifica negozio fisico

UPDATE ShopInfo SI
SET S.OpeningHours = @NEW_OPENINGHOURS@,
	S.Latitude = @NEW_LATITUDE@,
	S.Longitude = @NEW_LONGITUDE@,
	S.Address = @NEW_ADDRESS@,
	S.City = @NEW_CITY@,
	S.State = @NEW_STATE@,
	S.ZIP = @NEW_ZIP@
WHERE SI.ShopID = @SHOPID@

agginigi foto negozio 

INSERT INTO ShopPhoto SP
VALUES (@LINK@, @SHOP_ID@)

aggiungi prodotto

SELECT COUNT(*)
FROM Product P
WHERE P.Name = @PRODUCT_NAME@

se count = 0 inseriamo il prodotto

INSERT INTO Product P
VALUES (NULL, @PRODUCT_NAME@, @PRODUCT_DESCRIPTION@, NULL, @CATEGORY_NAME@)

controllo che il prodotto non fosse già venduto dal negozio
@PRODUCT_ID@ lo ottengo con un SELECT se il prodotto esisteva gia, altrimenti ottengo il valore dell ultimo autoincrement

se il venditore vendeva già il prodotto
UPDATE ShopProduct SP
SET SP.Quantity = @QUANTITY@
WHERE SP.ShopID = @SHOP_ID@ AND
	  SP.ProductID = @PRODUCTID@

se il prodotto non è mai stato venduto dal venditore

INSERT INTO ShopProduct SP
VALUES (@SHOP_ID@, @PRODUCT_ID@, @PRICE@, @DISCOUNT@, @QUANTITY@)

aggiungi foto prodotto

INSERT INTO ProductPhoto PP
VALUES (@LINK@, @PRODUCT_ID@)

modifica prodotto

UPDATE ShopProduct SP
SET SP.Price = @NEW_PRICE@, 
	SP.Discount = @NEW_DISCOUNT@
	SP.Quantity = @NEW_QUANTITY@
WHERE SP.ShopID = @SHOP_ID@ AND
	  SP.ProductID = @NEW_PRODUCTID@

rimozione prodotto. Se il prodotto non è più in listino va a -1

UPDATE ShopProduct SP
SET SP.Quantity = -1
WHERE SP.ProductID = @PRODUCT_ID@ AND
	  SP.ShopID = @SHOP_ID@

controllo se ho altri prodotti uguali nel ShopProduct

SELECT COUNT(*)
FROM ShopProduct SP
WHERE SP.ProductID = @PRODUCT_ID@

se count = 0 è l ultimo prodotto

DELETE FROM ProductPhoto PP
WHERE PP.ProductID = @PRODUCT_ID@

DELETE FROM Product P
WHERE P.ProductID = @PRODUCT_ID@

risposta alla recensione

INSERT INTO ReviewReply RR
VALUES (@REVIEW_ID@, @REPLY@)

leggi notifica review

UPDATE ReviewNotification RN
SET RN.ShopStatus = 1
WHERE RN.ReviewID = @REVIEW_ID@

leggi notifica disputa

UPDATE DisputeNotification DN
SET DN.ShopStatus = 1
WHERE DN.OrderID = @ORDER_ID@ AND
	  DN.ProductID = @PRODUCT_ID AND
	  DN.ShopID = @SHOP_ID@


