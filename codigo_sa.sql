USE estacionamento_sa;

CREATE TABLE cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(45) NOT NULL,
    cpf_cliente BIGINT(11),
    telefone_cliente BIGINT(11),
    email_cliente VARCHAR(45),
    dt_nascimento DATE
);

CREATE TABLE locador (
    id_locador INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_locador VARCHAR(45) NOT NULL,
    cpf_cnpj_locador  BIGINT(14),
    telefone_locador BIGINT(11),
    email_locador VARCHAR(45)
);

CREATE TABLE veiculo (
    id_veiculo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(8) NOT NULL,
    cor VARCHAR(45),
    marca VARCHAR(45),
    modelo VARCHAR(45),
    cliente_id INT,
    categoria_id INT,
    Foreign Key (cliente_id) REFERENCES cliente (id_cliente),
    Foreign Key (categoria_id) REFERENCES categoria_vaga(id_categoria)
);

CREATE TABLE categoria_vaga (
    id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_categoria ENUM('moto', 'carro', 'caminhão', 'van'),
    descricao_vaga TEXT(100)
);

CREATE TABLE pagamento (
    id_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status_pagamento ENUM('pago', 'em débito', 'atrasado'),
    valor DECIMAL(10,2),
    forma_pagamento ENUM('dinheiro', 'pix', 'cartão')
);

CREATE TABLE estacionamento (
    id_estacionamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_estacionamento VARCHAR(45),
    capacidade INT,
    dt_entrada DATE,
    dt_saida DATE,
    hr_entrada TIME,
    hr_saida TIME,
    locador_id INT,
    veiculo_id INT,
    pagamento_id INT,
    Foreign Key (locador_id) REFERENCES locador(id_locador),
    Foreign Key (veiculo_id) REFERENCES veiculo(id_veiculo),
    Foreign Key (pagamento_id) REFERENCES pagamento (id_pagamento)
);

INSERT INTO categoria_vaga
(nome_categoria, descricao_vaga) 
VALUES
('moto', 'vaga para motos'),
('carro', 'vaga para carros'),
('caminhão', 'vaga para caminhões e ônibus'),
('van', 'vaga para vans e camionetes')

INSERT INTO cliente
(nome_cliente, cpf_cliente, dt_nascimento, telefone_cliente, email_cliente) 
VALUES
('pedrinho matador', '3539864091', '1954-03-12', '35986431242', 'pedrinhofilho@hotmail.com'),