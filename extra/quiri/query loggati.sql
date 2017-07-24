-- CONTROLLO ACCETTAZIONE PRIVACY

SELECT COUNT(*)
FROM User U
WHERE U.UserID = @USERID@ AND
	  U.Privacy = 0

se count = 1 rompere i coglioni, se poi accetta update privacy

UPDATE User U
SET U.Privacy = 1 
WHERE U.UserID = @USERID@

-- FORGOT PW
UPDATE User U
SET U.Password = @NEW_PASSWORD@
WHERE U.UserID = @USERID@

-- PROFILO UTENTE

lista profilo

SELECT *
FROM User U, ShippingAddress SA
WHERE U.UserID = @USERID@ AND
	  SA.UserID = U.UserID

modifica profilo

UPDATE User U
SET U.FirstName = @NEW_FIRSTNAME@,
	U.LastName = @NEW_LASTNAME@,
	U.Email = @NEW_EMAIL@,
	U.Password = @NEW_PASSWORD@
WHERE U.UserID = @USERID@

aggiungi indirizzo di spedizione

INSERT INTO ShippingAddress
VALUES (@USERID@, @FIRSTNAME@, @LASTNAME@, @TELEFONO@, @ADDRESS@, @CITY@, @ZIP@, @STATE@)

rimuovi indirizzo di spedizione

DELETE FROM ShippingAddress SA
WHERE SA.UserID = @USERID@ AND
	  SA.Address = @ADDRESS@ AND
	  SA.Zip = @ZIP@ AND
	  SA.State = @STATE@

update indirizzo di spedizione

UPDATE ShippingAddress SA
SET SA.Address = @NEW_ADDRESS@,
	SA.Zip = @NEW_ZIP@ ... ecc.
WHERE SA.UserID = @USERID@ AND
	  SA.Address = @OLD_ADDRESS@ AND
	  SA.Zip = @OLD_ZIP@ AND
	  SA.State = @OLD_STATE@

-- ORDINI UTENTE

lista non completati

SELECT *
FROM OrderTable OT, OrderList OL, PendingOrders AS (SELECT DISTINCT OT2.OrderID
													FROM OrderTable OT2, OrderList OL2
													WHERE OT2.UserID = @USERID@ AND
														  OT2.OrderID = OL2.OrderID AND
														  OL2.Status = 0)
WHERE OT.OrderID = PendingOrders.OrderID

lista completati

SELECT *
FROM OrderTable OT, OrderList OL, CompletedOrders AS (SELECT DISTINCT OT2.OrderID
														FROM OrderTable OT2, OrderList OL2
														WHERE OT2.UserID = @USERID@ AND
															OT2.OrderID = OL2.OrderID AND
															OL2.Status = 1

													EXCEPT

													SELECT DISTINCT OT3.OrderID
														FROM OrderTable OT3, OrderList OL3
														WHERE OT3.UserID = @USERID@ AND
															OT3.OrderID = OL2.OrderID AND
															OL3.Status = 0)
WHERE OT.OrderID = CompletedOrders.OrderID


lista singolo ordine

SELECT OL.*, OT.*, S.Name, P.Name
FROM OrderList OL, OrderTable OT, Shop S, Product P
WHERE OT.UserID = @USERID@ AND
	  OT.UserID = OL.UserID AND 
	  OT.OrderID = OL.OrderID AND
	  OL.ShopID = S.ShopID AND
	  OL.ProductID = P.ProductIDs

nuova disputa

INSERT INTO Dispute
VALUES (@ORDERID@, @PRODUCTID@, @SHOPID@, @DESCRIPTION@, 0, @TIMESTAMP@)

INSERT INTO DisputeNotification
VALUES (@ORDERID@, @PRODUCTID@, @SHOPID@, 0, 0)

-- CARRELLLO

come user anonimo

-- CHECKOUT

riepilogo

SELECT * 
FROM USER U, ShippingAddress SA
WHERE U.UserID = SA.UserID 

dopo la pagina di fake pagamento, creare nuovo order 

INSERT INTO OrderTable
VALUES (NULL,@DATA@,@USERID@)

per ogni prodotto nel carrello

INSERT INTO OrderList
VALUES (@ORDERID@, @PRODUCTID@, @SHOPID@, @QUANTITY@, @HANDDELIVERY@, 0)

e poi droppare il carrello

DELETE FROM Cart C
WHERE C.UserID = @USERID@

-- REVIEW OGGETTO

SELECT COUNT(*)
FROM ProductReview PR
WHERE PR.UserID = @USERID@ AND
	  PR.ProductID = @PRODUCTID@

se count = 0 può inserire una nuova review

INSERT INTO ProductReview
VALUES (NULL,@DATA@,@RATING@,@DESCRIPTION@,@PRODUCTID@,@USERID@)

inserire nella tabella una entry per negozio che vende il prodotto recensito

INSERT INTO ReviewNotification
VALUES (@REVIEWID@, @SHOPID@, 0)

se count = 1 può eliminare 

DELETE FROM ProductReview PR
WHERE PR.UserID = @USERID@ AND
	  PR.ProductID = @PRODUCTID@

o modificare

UPDATE ProductReview PR
SET PR.Description = @NEW_DESCRIPTION@, PR.Rating = @NEW_RATING@
WHERE PR.UserID = @USERID@ AND
	  PR.ProductID = @PRODUCTID@


-- REVIEW VENDITORE

SELECT COUNT(*)
FROM ShopReview SR
WHERE SR.UserID = @USERID@ AND
      SR.ShopID = @SHOPID@

se count = 0 può inserire una nuova review

INSERT INTO ShopReview
VALUES (@USERID@,@SHOPID@,@DATA@,@RATING@,@DESRIPTION@)

se count = 1 può eliminare 

DELETE FROM ShopReview SR
WHERE SR.UserID = @USERID@ AND
	  Sr.ShopID = @SHOPID@

o modificare

UPDATE ShopReview SR
SET SR.Description = @NEW_DESCRIPTION@, SR.Rating = @NEW_RATING@
WHERE SR.UserID = @USERID@ AND
      SR.ShopID = @SHOPID@



PER IL CHECKOUT:
1) schiaccio bottone checkout
	controllo che ciascuna quantità di prodotto sia minore o uguale della disponibile
	creo ordine con PaymentStatus = 0 e timestamp
	-> stampo riepilogo ordine all utente
2) procedo con il pagamento
	-> carico pagina di pagamento
3A) se l utente paga con successo
	setto PaymentStatus = 1
	-> stampo pagina di conferma
3B)	se l utente chiude il broswer e killa il pagamento
	controllo periodicamente se esistono ordini con PaymentStatus = 0 e lo pongo a
	e timestamp più vecchio di tot secondi. Setto il PaymentStatus = -1 (ordine annullato)
	Per ognuno di quelli accedo alla lista	prodotti dell ordine
	e aggiorno le quantità nella tabella ShopProduct
	
	
diventa nuovo venditore

INSERT INTO Shop S
VALUES (NULL, @NAME@, @DESCRIPTION@, @WEBSITE@, NULL)

INSERT INTO UserShop US
VALUES (@USER_ID@, @SHOP_ID@)

INSERT INTO ShopInfo SI
VALUES (@SHOP_ID@, @NEW_OPENINGHOURS@, @LATITUDE@, @LONGITUDE@, @ADDRESS@, @CITY@, @STATE@, @ZIP@)
