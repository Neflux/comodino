set-- LOGIN

convertire @PASSWORD@ in md5 prima

SELECT COUNT(*) 
FROM User U
WHERE U.Email = @EMAIL@ AND U.password = @PASSWORD@;

se il count = 1 ok login , mettere userid nei cookie sennò errore

-- SIGNUP

controllo se email non esiste già

SELECT COUNT(*) 
FROM User U
WHERE U.Email = @EMAIL@;

se count = 0 allora registro

INSERT INTO User
VALUES (NUlL, @FIRSTNAME@, @LASTNAME@, @EMAIL@, @PASSWORD@, 1, 0, 0); tipo (0=admin, 1=user, 2=venditore), privacy, email conferma

genero e mando il link di conferma, una volta confermato aggiorno il valore

UPDATE User U
SET U.EmailConfirmation = 1 
WHERE U.UserID = @USERID@

-- RICERCA

ricerca per oggetto

SELECT P.ProductID, P.Name, P.CategoryName, P.Rating, SP.Price, SP.Discount, SP.Quantity, S.Name
FROM Product P, ShopProduct SP, Shop S, ShopInfo SI
WHERE P.Name = @NOME@ AND
	  P.ProductID = SP.ProductID AND
	  SP.ShopID = S.ShopID AND
	  SP.Quantity <> -1

ricerca per categoria

SELECT P.ProductID, P.Name, P.CategoryName, P.Rating, SP.Price, SP.Discount, SP.Quantity, S.Name
FROM Product P, ShopProduct SP, Shop S, ShopInfo SI
WHERE P.ProductID = SP.ProductID AND
	  SP.ShopID = S.ShopID AND
	  SP.Quantity <> -1 AND
	  P.CategoryName = @CATEGORIA@

ricerca venditore

SELECT P.ProductID, P.Name, P.CategoryName, P.Rating, SP.Price, SP.Discount, SP.Quantity, S.Name
FROM Product P, ShopProduct SP, Shop S, ShopInfo SI
WHERE P.ProductID = SP.ProductID AND
	  SP.ShopID = S.ShopID  AND
	  SP.Quantity <> -1 AND
	  S.Name = @NOME_VENDITORE@

filtro zona geografica - citta (checkbox)

... AND SI.ShopID = S.ShopID AND
		SI.City = @CITTA@

filtro zona geografica - stato (checkbox)

... AND SI.ShopID = S.ShopID AND
		SI.State = @STATO@

filtro prezzo >=  (checkbox)

... AND SP.Price >= @PREZZO@

filtro prezzo <= (checkbox)

... AND SP.Price <= @PREZZO@

filtro review >=  (checkbox)

... AND P.Rating >= @STELLE@

filtro review <=  (checkbox)

... AND P.Rating <= @STELLE@

-- GESTIONE CARRELLO

aggiungi a carrello (userid sarà casuale se si è anonimi)

INSERT INTO Cart
VALUES (@USERID_SESSIONE@, @ProductID@, @ShopID@, @Quantity@, @DataGenerata@)

togliere dal carrello

DELETE FROM Cart C
WHERE C.UserID = @USERID_SESSIONE@ AND
	  C.ProductID = @ProductID@ AND
	  C.ShopID = @ShopID@

stampa carrello

SELECT * 
FROM Cart C
WHERE C.UserID = @USERID_SESSIONE@