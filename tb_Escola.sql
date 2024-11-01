/*- Criar o banco db_Escola;*/
CREATE DATABASE db_Escola;
USE db_Escola;

/*- Criar as tabelas tb_aluno, tb_professor e a tb_aula;
- Cada uma com 6 colunas;
- Cada uma com 10 registros;*/
CREATE TABLE tb_aluno(
	pk_id_aluno int auto_increment primary key,
    nome_aluno varchar(100) not null,
    data_nasc_aluno date,
    cpf_aluno char(11),
    endereco_aluno varchar(100),
    responsavel_aluno varchar(100)
);

INSERT INTO tb_aluno (nome_aluno, data_nasc_aluno, cpf_aluno, endereco_aluno, responsavel_aluno) VALUES
('Maria de Souza', '2008-10-01', '52874563214', 'Rua Rosario de Lima, 785', 'Rosaria de Fátima das Dores'),
('Lucas Pereira', '2008-03-15', '12345678901', 'Rua das Flores, 123', 'Mariana Pereira'),
('Ana Souza', '2009-07-22', '23456789012', 'Av. Central, 456', 'José Souza'),
('Pedro Oliveira', '2010-11-30', '34567890123', 'Rua do Sol, 789', 'Marta Oliveira'),
('Mariana Santos', '2008-01-05', '45678901234', 'Rua das Palmeiras, 321', 'Carlos Santos'),
('Gabriela Martins', '2009-05-18', '56789012345', 'Av. das Américas, 654', 'Fernanda Martins'),
('João Lima', '2011-09-10', '67890123456', 'Rua Nova, 987', 'Paulo Lima'),
('Beatriz Ferreira', '2008-02-20', '78901234567', 'Rua da Paz, 159', 'Aline Ferreira'),
('Renato Carvalho', '2009-12-12', '89012345678', 'Av. Brasil, 753', 'Rafael Carvalho'),
('Larissa Gomes', '2010-04-25', '90123456789', 'Rua das Acácias, 852', 'Rita Gomes');

CREATE TABLE tb_professor(
	pk_id_professor int auto_increment primary key,
    nome_professor varchar(100) not null,
    data_nasc_professor date,
    cpf_professor char(11),
    endereco_professor varchar(100),
    re_professor char(7)
);

INSERT INTO tb_professor (nome_professor, data_nasc_professor, cpf_professor, endereco_professor, re_professor) VALUES
('Carlos da Silva', '1985-02-14', '12345678901', 'Rua das Flores, 12', 'RE12345'),
('Ana Pereira', '1990-06-21', '23456789012', 'Avenida Paulista, 456', 'RE23456'),
('Marcos Souza', '1978-11-05', '34567890123', 'Rua São Bento, 789', 'RE34567'),
('Beatriz Costa', '1982-03-19', '45678901234', 'Rua XV de Novembro', 'RE45678'),
('Fernanda Oliveira', '1989-08-30', '56789012345', 'Av. Brasil, 202', 'RE56789'),
('José Almeida', '1975-01-12', '67890123456', 'Rua Amazonas, 303', 'RE67890'),
('Patrícia Gomes', '1984-05-27', '78901234567', 'Rua Bahia, 404', 'RE78901'),
('Renato Fernandes', '1992-09-15', '89012345678', 'Rua das Laranjeiras', 'RE89012'),
('Larissa Martins', '1988-12-24', '90123456789', 'Rua dos Pinheiros, 500', 'RE90123'),
('Andréia Rocha', '1980-07-07', '01234567890', 'Av. Getúlio Vargas, 707', 'RE01234');

CREATE TABLE tb_aula(
	pk_id_aula int auto_increment primary key,
    disciplina_aula varchar(50),
    data_aula date,
    horario_inicio_aula time,
    horario_fim_aula time,
    sala_aula varchar(20)
);

INSERT INTO tb_aula (disciplina_aula, data_aula, horario_inicio_aula, horario_fim_aula, sala_aula) VALUES
('Matemática', '2024-11-01', '08:00:00', '09:30:00', 'Sala 10'),
('História', '2024-11-01', '10:00:00', '11:30:00', 'Sala 9'),
('Geografia', '2024-11-01', '13:00:00', '14:30:00', 'Sala 8'),
('Química', '2024-11-02', '08:00:00', '09:30:00', 'Sala 6'),
('Física', '2024-11-02', '10:00:00', '11:30:00', 'Sala 5'),
('Biologia', '2024-11-02', '13:00:00', '14:30:00', 'Sala 2'),
('Inglês', '2024-11-03', '08:00:00', '09:30:00', 'Sala 15'),
('Português', '2024-11-03', '10:00:00', '11:30:00', 'Sala 2'),
('Educação Física', '2024-11-03', '13:00:00', '14:30:00', 'Quadra'),
('Artes', '2024-11-04', '08:00:00', '09:30:00', 'Sala 4');

ALTER TABLE tb_aula
ADD COLUMN fk_id_professor INT,
ADD CONSTRAINT fk_professor_aula FOREIGN KEY (fk_id_professor) REFERENCES tb_professor(pk_id_professor);
 
/*1- inserir o campo estado civil e o campo nome da mãe;*/
ALTER TABLE tb_professor
ADD COLUMN estado_civil_professor varchar(20),
ADD COLUMN nome_mae_professor varchar(100);

/*2- mudar o tamanho do campo cpf;*/
ALTER TABLE tb_professor
MODIFY COLUMN cpf_professor varchar(14);

/*3- inserir + 3 registros;*/
INSERT INTO tb_professor (nome_professor, data_nasc_professor, cpf_professor, endereco_professor, re_professor, estado_civil_professor, nome_mae_professor) VALUES
('Rafael dos Santos', '1980-04-15', '123.456.789-01', 'Rua das Margaridas, 23', 'RE12346', 'Casado', 'Maria dos Santos'),
('Camila Fernandes', '1985-09-30', '234.567.890-12', 'Avenida Brasil, 456', 'RE23457', 'Solteira', 'Ana Fernandes'),
('Bruno Almeida', '1978-12-20', '345.678.901-23', 'Rua Central, 789', 'RE34568', 'Divorciado', 'Carla Almeida');

/*4- deletar a coluna cidade;*/
ALTER TABLE tb_professor 
ADD COLUMN cidade_professor varchar(20);

ALTER TABLE tb_professor
DROP COLUMN cidade_professor;

/*5- alterar o valor da disciplina 5 últimos registros;*/
ALTER TABLE tb_professor 
ADD COLUMN disciplina_professor varchar(20);

UPDATE tb_professor
SET disciplina_professor = 'Biologia'
WHERE pk_id_professor IN (9,10,11,12,13);

/*6- deletar os registros 7, 10 e 12;*/
DELETE FROM tb_professor
WHERE pk_id_professor IN (7,10,12);

/*7- inserir o campo e-mail na tabela e colocar a frase "solicitação em andamento" nesse campo, em todos os registros;*/
ALTER TABLE tb_professor
ADD COLUMN email_professor varchar(50);

UPDATE tb_professor
SET email_professor = 'solicitação em andamento';

/*8- Trocar o tipo do campo estado civil para char(10);*/
ALTER TABLE tb_professor
MODIFY COLUMN estado_civil_professor char(10);

/*9- Inserir o campo formacao_prof varchar(50);*/
ALTER TABLE tb_professor
ADD COLUMN formacao_professor varchar(50);

select * from tb_aluno;
select * from tb_professor;
select * from tb_aula;

/*10- Não esquecer start transaction, Rollback e o commit.*/
START TRANSACTION;
DELETE FROM tb_professor;
ROLLBACK; 
COMMIT;


