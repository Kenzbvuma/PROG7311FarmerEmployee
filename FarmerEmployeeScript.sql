CREATE TABLE UserRoles (
    Id INT PRIMARY KEY,
    Name VARCHAR(50) UNIQUE NOT NULL
);

DROP TABLE UserRoles;

CREATE TABLE Users (
    Id INT PRIMARY KEY,
    UserRoleId INT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(100) NOT NULL,
    CreatedAt DATETIME NOT NULL,
    FOREIGN KEY (UserRoleId) REFERENCES UserRoles(Id)
);

DROP TABLE Users;

CREATE TABLE Farmers (
    Id INT PRIMARY KEY,
    UserId INT,
    Name VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20),
    Address TEXT NOT NULL,
    RegistrationDate DATETIME NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);

DROP TABLE Farmers;

CREATE TABLE Products (
    Id INT PRIMARY KEY,
    FarmerId INT,
    Name VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    ProductionDate DATE NOT NULL,
    FOREIGN KEY (FarmerId) REFERENCES Farmers(Id)
);

DROP TABLE PRODUCTS;

INSERT INTO UserRoles (Id, Name) VALUES (1, 'Farmer');
INSERT INTO UserRoles (Id, Name) VALUES (2, 'Employee');

INSERT INTO Users (Id, UserRoleId, Username, Email, PasswordHash, CreatedAt) VALUES 
(1, 1, 'farmer1', 'farmer1@example.com', 'password1', '2022-01-01 10:00:00'),
(2, 2, 'employee1', 'employee1@example.com', 'password2', '2022-01-01 10:00:00');

INSERT INTO Farmers (Id, UserId, Name, PhoneNumber, Address, RegistrationDate) VALUES 
(1, 1, 'John Doe', '123-456-7890', '123 Main St, Anytown USA', '2022-01-01 10:00:00');

INSERT INTO Products (Id, FarmerId, Name, Category, ProductionDate) VALUES 
(1, 1, 'Apples', 'Fruit', '2022-01-01'),
(2, 1, 'Oranges', 'Fruit', '2022-01-02');