--DDL (Linguagem de definição de dados)
-- CREATE
-- DROP
-- ALTER
CREATE SCHEMA clinica;

SET search_path TO clinica;

-- Criar tabelas sem chave estrangeira antes das outras
CREATE TABLE clinica.medico (
	id_medico INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	nome TEXT NOT NULL,
	crm TEXT NOT NULL,
	especialidade TEXT NOT NULL
);

CREATE TABLE clinica.paciente(
	id_paciente INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	cpf TEXT UNIQUE,
	nome TEXT NOT NULL,
	idade INT NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE clinica.clinica(
	id_clinica INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	nome TEXT NOT NULL,
	endereco TEXT,
	descricao TEXT NOT NULL
);

CREATE TABLE clinica.consulta(
	id_consulta INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	data_consulta TIMESTAMPTZ,
	id_medico INT NOT NULL,
	id_clinica INT NOT NULL,
	id_paciente INT NOT NULL,
	valor NUMERIC (10,4) NOT NULL,
	FOREIGN KEY (id_medico) REFERENCES clinica.medico (id_medico),
	FOREIGN KEY (id_clinica) REFERENCES clinica.clinica (id_clinica),
	FOREIGN KEY (id_paciente) REFERENCES clinica.paciente (id_paciente)
);
--Comandos para editar campo nome que está incorreto
ALTER TABLE clinica.clinica
ALTER COLUMN nome TYPE TEXT;


-- Comandos para apagar tabelas, se necessário
DROP TABLE clinica.clinica;
DROP TABLE clinica.medico;
DROP TABLE clinica.paciente;
DROP TABLE clinica.clinica;
