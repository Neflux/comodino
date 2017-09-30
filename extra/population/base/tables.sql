CREATE TABLE User
(
  UserID INT NOT NULL AUTO_INCREMENT,
  FirstName VARCHAR(100) NOT NULL,
  LastName VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Password VARCHAR(100) NOT NULL,
  Type INT NOT NULL,
  Privacy INT NOT NULL,
  EmailConfirm VARCHAR(100) NOT NULL,
  PRIMARY KEY (UserID)
);

CREATE TABLE Category
(
  CategoryName VARCHAR(100) NOT NULL,
  PRIMARY KEY (CategoryName)
);

CREATE TABLE Shop
(
  ShopID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Description VARCHAR(100) NOT NULL,
  Website VARCHAR(100) NOT NULL,
  Rating FLOAT NOT NULL,
  PRIMARY KEY (ShopID)
);

CREATE TABLE ShopInfo
(
  Latitude FLOAT NOT NULL,
  Longitude FLOAT NOT NULL,
  Address VARCHAR(100) NOT NULL,
  City VARCHAR(100) NOT NULL,
  State VARCHAR(100) NOT NULL,
  ZIP VARCHAR(10) NOT NULL,
  OpeningHours VARCHAR(250) NOT NULL,
  ShopID INT NOT NULL,
  PRIMARY KEY (ShopID),
  FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE ShopPhoto
(
  PhotoID INT NOT NULL AUTO_INCREMENT,
  Image MEDIUMBLOB NOT NULL,
  ShopID INT NOT NULL,
  PRIMARY KEY (PhotoID),
  FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE ShopReview
(
  Title VARCHAR(100) NOT NULL,
  CreationDate DATE NOT NULL,
  Rating FLOAT NOT NULL,
  Description VARCHAR(500) NOT NULL,
  ShopID INT NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (ShopID, UserID),
  FOREIGN KEY (ShopID) REFERENCES Shop(ShopID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE ShippingAddress
(
  AddressID       INT AUTO_INCREMENT
    PRIMARY KEY,
  UserID          INT             NOT NULL,
  Address         VARCHAR(100)    NOT NULL,
  FirstName       VARCHAR(100)    NOT NULL,
  LastName        VARCHAR(100)    NOT NULL,
  City            VARCHAR(100)    NOT NULL,
  ZIP             VARCHAR(10)     NOT NULL,
  State           VARCHAR(100)    NOT NULL,
  TelephoneNumber VARCHAR(20)     NOT NULL,
  Active          INT DEFAULT '1' NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User (UserID)
);

CREATE TABLE OrderList
(
  OrderID INT NOT NULL AUTO_INCREMENT,
  Date TIMESTAMP NOT NULL,
  PaymentStatus INT NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE UserShop
(
  UserID INT NOT NULL,
  ShopID INT NOT NULL,
  PRIMARY KEY (UserID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (ShopID) REFERENCES Shop(ShopID),
  UNIQUE (ShopID)
);

CREATE TABLE Product
(
  ProductID INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Description VARCHAR(500) NOT NULL,
  Rating FLOAT NOT NULL,
  CategoryName VARCHAR(100) NOT NULL,
  PRIMARY KEY (ProductID),
  FOREIGN KEY (CategoryName) REFERENCES Category(CategoryName),
  UNIQUE (Name)
);

CREATE TABLE ShopProduct
(
  Price FLOAT NOT NULL,
  Quantity FLOAT NOT NULL,
  Discount FLOAT NOT NULL,
  ProductID INT NOT NULL,
  ShopID INT NOT NULL,
  PRIMARY KEY (ProductID, ShopID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE ProductReview
(
  ReviewID INT NOT NULL AUTO_INCREMENT,
  Title VARCHAR(100) NOT NULL,
  CreationDate DATE NOT NULL,
  Rating FLOAT NOT NULL,
  Description VARCHAR(500) NOT NULL,
  ProductID INT NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (ReviewID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE ProductPhoto
(
  PhotoID INT NOT NULL AUTO_INCREMENT,
  Image MEDIUMBLOB NOT NULL,
  ProductID INT NOT NULL,
  PRIMARY KEY (PhotoID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ReviewReply
(
  Description VARCHAR(500) NOT NULL,
  ReviewID INT NOT NULL,
  PRIMARY KEY (ReviewID),
  FOREIGN KEY (ReviewID) REFERENCES ProductReview(ReviewID)
);

CREATE TABLE OrderProd
(
  OrderID    INT   NOT NULL,
  Status     INT   NOT NULL,
  ProductID  INT   NOT NULL,
  ShopID     INT   NOT NULL,
  Quantity   INT   NOT NULL,
  FinalPrice FLOAT NULL,
  AddressID  INT   NULL,
  PRIMARY KEY (OrderID, ProductID, ShopID),
  FOREIGN KEY (OrderID) REFERENCES OrderList (OrderID),
  FOREIGN KEY (ProductID, ShopID) REFERENCES ShopProduct (ProductID, ShopID),
  FOREIGN KEY (AddressID) REFERENCES ShippingAddress (AddressID)
);

CREATE TABLE Dispute
(
  Title VARCHAR(100) NOT NULL,
  Status INT NOT NULL,
  Description VARCHAR(500) NOT NULL,
  CreationDate DATE NOT NULL,
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  ShopID INT NOT NULL,
  PRIMARY KEY (OrderID, ProductID, ShopID),
  FOREIGN KEY (OrderID, ProductID, ShopID) REFERENCES OrderProd(OrderID, ProductID, ShopID)
);

CREATE TABLE DisputeReply
(
  Description VARCHAR(500) NOT NULL,
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  ShopID INT NOT NULL,
  PRIMARY KEY (OrderID, ProductID, ShopID),
  FOREIGN KEY (OrderID, ProductID, ShopID) REFERENCES Dispute(OrderID, ProductID, ShopID)
);

CREATE TABLE DisputeNotification
(
  AdminStatus INT NOT NULL,
  ShopStatus INT NOT NULL,
  OrderID INT NOT NULL,
  ProductID INT NOT NULL,
  ShopID INT NOT NULL,
  PRIMARY KEY (OrderID, ProductID, ShopID),
  FOREIGN KEY (OrderID, ProductID, ShopID) REFERENCES Dispute(OrderID, ProductID, ShopID)
);

CREATE TABLE ReviewNotification
(
  ShopStatus INT NOT NULL,
  ReviewID INT NOT NULL,
  ShopID INT NOT NULL,
  PRIMARY KEY (ReviewID, ShopID),
  FOREIGN KEY (ReviewID) REFERENCES ProductReview(ReviewID),
  FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE Cart
(
  Quantity INT NOT NULL,
  AddDate TIMESTAMP NOT NULL,
  UserID INT NOT NULL,
  ProductID INT NOT NULL,
  ShopID INT NOT NULL,
  PRIMARY KEY (UserID, ProductID, ShopID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (ProductID, ShopID) REFERENCES ShopProduct(ProductID, ShopID)
);