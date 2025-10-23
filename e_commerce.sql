-- ecommerce_support.sql
-- Create tables
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT,
    Email TEXT
);

CREATE TABLE Tickets (
    TicketID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    IssueType TEXT, -- e.g., 'Delivery', 'Payment', 'Technical'
    Status TEXT, -- 'Open', 'In Progress', 'Closed'
    CreatedDate DATE,
    ClosedDate DATE,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Agents (
    AgentID INTEGER PRIMARY KEY,
    Name TEXT,
    Email TEXT
);

CREATE TABLE TicketAssignments (
    AssignmentID INTEGER PRIMARY KEY,
    TicketID INTEGER,
    AgentID INTEGER,
    AssignedDate DATE,
    FOREIGN KEY(TicketID) REFERENCES Tickets(TicketID),
    FOREIGN KEY(AgentID) REFERENCES Agents(AgentID)
);

-- Indexes for efficiency
CREATE INDEX idx_tickets_customer ON Tickets(CustomerID);
CREATE INDEX idx_tickets_status ON Tickets(Status);
CREATE INDEX idx_assignments_agent ON TicketAssignments(AgentID);

-- Mock data
INSERT INTO Customers VALUES
(1, 'Alice', 'alice@email.com'),
(2, 'Bob', 'bob@email.com');

INSERT INTO Agents VALUES
(1, 'Eve', 'eve@company.com'),
(2, 'Charlie', 'charlie@company.com');

INSERT INTO Tickets VALUES
(1, 1, 'Delivery', 'Open', '2025-10-20', NULL),
(2, 2, 'Payment', 'Closed', '2025-10-18', '2025-10-19');

INSERT INTO TicketAssignments VALUES
(1, 1, 1, '2025-10-20'),
(2, 2, 2, '2025-10-18');

-- Example queries
-- 1. Find all open tickets
SELECT * FROM Tickets WHERE Status='Open';

-- 2. Find all tickets assigned to a specific agent
SELECT * FROM TicketAssignments WHERE AgentID=1;

-- 3. Get all tickets for a customer
SELECT * FROM Tickets WHERE CustomerID=1;
