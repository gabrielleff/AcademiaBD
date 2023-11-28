-- Criação das Tabelas
CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Data_Nascimento DATE,
    Email VARCHAR(100),
    Telefone VARCHAR(15)
);

CREATE TABLE Membros (
    ID_Membro INT PRIMARY KEY,
    ID_Usuario INT,
    Data_Inscricao DATE,
    Tipo_Membro VARCHAR(50),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE Treinos (
    ID_Treino INT PRIMARY KEY,
    Nome_Treino VARCHAR(50),
    Descricao TEXT,
    Duracao INT,
    Dificuldade VARCHAR(20)
);

CREATE TABLE Registros_Treino (
    ID_Registro INT PRIMARY KEY,
    ID_Membro INT,
    ID_Treino INT,
    Data_Registro DATE,
    Calorias_Queimadas INT,
    Avaliacao INT,
    FOREIGN KEY (ID_Membro) REFERENCES Membros(ID_Membro),
    FOREIGN KEY (ID_Treino) REFERENCES Treinos(ID_Treino)
);

CREATE TABLE Equipamentos (
    ID_Equipamento INT PRIMARY KEY,
    Nome_Equipamento VARCHAR(50),
    Descricao TEXT
);

CREATE TABLE Reservas_Equipamento (
    ID_Reserva INT PRIMARY KEY,
    ID_Membro INT,
    ID_Equipamento INT,
    Data_Reserva DATE,
    Hora_Inicio TIME,
    Hora_Fim TIME,
    FOREIGN KEY (ID_Membro) REFERENCES Membros(ID_Membro),
    FOREIGN KEY (ID_Equipamento) REFERENCES Equipamentos(ID_Equipamento)
);

CREATE TABLE Aulas_Grupo (
    ID_Aula INT PRIMARY KEY,
    Nome_Aula VARCHAR(50),
    Instrutor VARCHAR(50),
    Capacidade_Maxima INT
);

CREATE TABLE Participacoes_Aula (
    ID_Participacao INT PRIMARY KEY,
    ID_Membro INT,
    ID_Aula INT,
    Data_Participacao DATE,
    FOREIGN KEY (ID_Membro) REFERENCES Membros(ID_Membro),
    FOREIGN KEY (ID_Aula) REFERENCES Aulas_Grupo(ID_Aula)
);


-- Inserção de dados na tabela Usuarios
INSERT INTO Usuarios (ID_Usuario, Nome, Sobrenome, Data_Nascimento, Email, Telefone)
VALUES 
    (1, 'João', 'Silva', '1990-04-19', 'joao@email.com', '123456789'),
    (2, 'Maria', 'Santos', '1989-11-17', 'mariasantos@email.com', '123455029'),
    (3, 'José', 'Soares', '1998-06-15', 'josesoares@email.com', '123454739'),
    (4, 'Joana', 'Pascoal', '1969-05-12', 'joanapascoal@email.com', '1234577738');

-- Inserção de dados na tabela Membros
INSERT INTO Membros (ID_Membro, ID_Usuario, Data_Inscricao, Tipo_Membro)
VALUES 
    (1, 1, '2022-04-02', 'Pro'),
    (2, 2, '2023-03-03', 'Premium'),
    (3, 3, '2018-01-01', 'Pro'),
    (4, 4, '2022-09-07', 'Premium');

-- Inserção de dados na tabela Treinos
INSERT INTO Treinos (ID_Treino, Nome_Treino, Descricao, Duracao, Dificuldade)
VALUES 
    (1, 'Treino Funcional', 'Treino funcional para queima de gordura', 30, 'Difícil'),
    (2, 'Treino Cardio', 'Treino de cardio para queima de gordura', 60, 'Intermediário'),
    (4, 'Treino Musculação', 'Treino musculação para hipertrofia', 60, 'Difícil'),
    (6, 'Treino Hiit', 'Treino hiit para queima de gordura', 20, 'Intermediário');

-- Inserção de dados na tabela Registros_Treino
INSERT INTO Registros_Treino (ID_Registro, ID_Membro, ID_Treino, Data_Registro, Calorias_Queimadas, Avaliacao)
VALUES 
    (19, 1, 1, '2022-04-15', 300, 4),
    (13, 2, 2, '2023-03-13', 310, 5),
    (14, 3, 4, '2018-01-09', 220, 3),
    (16, 4, 6, '2022-09-15', 300, 5);

-- Inserção de dados na tabela Equipamentos
INSERT INTO Equipamentos (ID_Equipamento, Nome_Equipamento, Descricao)
VALUES 
    (1, 'Esteira', 'Equipamento para exercícios aeróbicos'),
    (5, 'Bike', 'Equipamento para exercícios aeróbicos'),
    (7, 'Leg180', 'Equipamento para exercícios de inferiores'),
    (19, 'Polia', 'Equipamento para exercícios de superiores');

-- Inserção de dados na tabela Reservas_Equipamento
INSERT INTO Reservas_Equipamento (ID_Reserva, ID_Membro, ID_Equipamento, Data_Reserva, Hora_Inicio, Hora_Fim)
VALUES 
    (1, 1, 1, '2022-04-15', '10:00:00', '11:00:00'),
    (8, 2, 5, '2023-03-13', '15:00:00', '15:30:00'),
    (7, 3, 7, '2018-01-09', '16:00:00', '17:00:00'),
    (6, 4, 19, '2022-09-15', '11:00:00', '11:20:00');

-- Inserção de dados na tabela Aulas_Grupo
INSERT INTO Aulas_Grupo (ID_Aula, Nome_Aula, Instrutor, Capacidade_Maxima)
VALUES 
    (1, 'Aula de Zumba', 'Ana Maria', 20),
    (3, 'Aula de Yoga', 'Marcos', 20),
    (5, 'Aula de Bike', 'Julia', 20),
    (17, 'Aula de Cardio', 'Paulo', 20);

-- Inserção de dados na tabela Participacoes_Aula
INSERT INTO Participacoes_Aula (ID_Participacao, ID_Membro, ID_Aula, Data_Participacao)
VALUES 
    (10, 1, 1, '2022-04-10'),
    (5, 2, 3, '2023-03-16'),
    (15, 3, 5, '2018-01-11'),
    (35, 5, 17, '2022-09-10');
