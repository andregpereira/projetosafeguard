/*
O Projeto Safeguard consiste na criação de um sistema integrado para controle dos locais de pesca, a fim de proteger as espécies de peixes ameaçadas de extinção. O sistema pode receber
de órgãos competentes os locais onde pode haver a prática da pesca (como lagos, rios, costa) e catalogar as espécies de peixes que podem estar presentes neste local, facilitando o controle 
de órgãos de proteção ambiental juntando em um só lugar tudo que é necessário para a proteção da fauna local.
*/

-- Script DDL

DROP DATABASE IF EXISTS projeto_safeguard;
CREATE DATABASE IF NOT EXISTS projeto_safeguard;
USE projeto_safeguard;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS peixe;
DROP TABLE IF EXISTS associativa_peixe_local_pesca;
DROP TABLE IF EXISTS local_pesca;
DROP TABLE IF EXISTS orgao;
SET FOREIGN_KEY_CHECKS = 1;
DROP TABLE IF EXISTS relatorio;

CREATE TABLE IF NOT EXISTS peixe (
    id_peixe INTEGER AUTO_INCREMENT NOT NULL,
    nome_cientifico VARCHAR(50) NOT NULL,
    nome_comum VARCHAR(50) DEFAULT '-',
    familia VARCHAR(50) NOT NULL,
    descricao VARCHAR(250) DEFAULT '-',
    tipo_agua VARCHAR(10) NOT NULL, CHECK (tipo_agua IN ('DOCE' , 'SALGADA')),
    classificacao_risco CHAR(2) NOT NULL, CHECK (classificacao_risco IN ('DD' , 'LC', 'NT', 'VU', 'EN', 'CR', 'EW', 'EX')),
    periodo_desova CHAR(3) NOT NULL, CHECK (periodo_desova IN ('SIM' , 'NÃO')),
    CONSTRAINT peixe_pk PRIMARY KEY (id_peixe)
);

CREATE TABLE IF NOT EXISTS orgao (
    id_orgao INTEGER AUTO_INCREMENT NOT NULL,
    razao_social VARCHAR(50) NOT NULL,
    tipo_org VARCHAR(20) NOT NULL,
    CHECK (tipo_org IN ('PRIVADO' , 'PÚBLICO')),
    endereco VARCHAR(50) NOT NULL,
    nro_rua VARCHAR(4) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    telefone VARCHAR(11) DEFAULT '-',
    CONSTRAINT orgao_pk PRIMARY KEY (id_orgao)
);

CREATE TABLE IF NOT EXISTS local_pesca (
    id_local INTEGER AUTO_INCREMENT NOT NULL,
    latitude NUMERIC(17, 15) NOT NULL,
    longitude NUMERIC(18, 15) NOT NULL,
    localizacao VARCHAR(20) NOT NULL, CHECK (localizacao IN ('LAGO', 'RIO', 'COSTA', 'ALTO MAR')),
    tipo_propriedade VARCHAR(10) NOT NULL, CHECK (tipo_propriedade IN ('PARTICULAR', 'PÚBLICA')),
    tipo_pesca_permitida VARCHAR(50) DEFAULT '-',
    id_orgao INTEGER NOT NULL,
    pesca_permitida CHAR(3) NOT NULL, CHECK (pesca_permitida IN ('SIM', 'NÃO')),
    CONSTRAINT local_pesca_pk PRIMARY KEY (id_local),
    CONSTRAINT local_pesca_orgao_fk FOREIGN KEY (id_orgao)
        REFERENCES orgao (id_orgao)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS associativa_peixe_local_pesca (
    id_peixe INTEGER NOT NULL,
    id_local INTEGER NOT NULL,
    CONSTRAINT associativa_peixe_local_pesca_peixe_fk FOREIGN KEY (id_peixe)
        REFERENCES peixe (id_peixe)
        ON DELETE CASCADE,
    CONSTRAINT associativa_peixe_local_pesca_local_pesca_fk FOREIGN KEY (id_local)
        REFERENCES local_pesca (id_local)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS relatorio (
    id_relatorio INTEGER AUTO_INCREMENT NOT NULL,
    id_local INTEGER NOT NULL,
    temperatura_media NUMERIC(4, 2) NOT NULL,
    ph NUMERIC(3, 1) NOT NULL,
    presenca_turbidez CHAR(3) NOT NULL, CHECK (presenca_turbidez IN ('SIM', 'NÃO')),
    presenca_solidos_toxicos CHAR(3) NOT NULL, CHECK (presenca_solidos_toxicos IN ('SIM', 'NÃO')),
    presenca_coliformes_fecais CHAR(3) NOT NULL, CHECK (presenca_coliformes_fecais IN ('SIM', 'NÃO')),
    teor_oxigenio_dissolvido NUMERIC(5, 2) NOT NULL,
    excesso_nitratos CHAR(3) NOT NULL, CHECK (excesso_nitratos IN ('SIM', 'NÃO')),
    excesso_fosfatos CHAR(3) NOT NULL, CHECK (excesso_fosfatos IN ('SIM', 'NÃO')),
    CONSTRAINT relatorio_pk PRIMARY KEY (id_relatorio),
	CONSTRAINT relatorio_local_pesca_fk FOREIGN KEY (id_local)
		REFERENCES local_pesca (id_local)
        ON DELETE CASCADE
);

-- Script DML

INSERT INTO peixe (nome_cientifico, nome_comum, familia, descricao, tipo_agua, classificacao_risco, periodo_desova) values ('Pomatomus saltator', 'Anchova', 'Engraulidae', 
'Peixe de escamas; o corpo é alongado, fusiforme e comprimido. Pode alcançar 1,5m de comprimento total e 20kg', 'SALGADA', 'LC', 'NÃO');
INSERT INTO peixe (nome_cientifico, nome_comum, familia, descricao, tipo_agua, classificacao_risco, periodo_desova) values ('Hypostomus affinis', 'Cascudo', 'Loricariidae',
'O Cascudo é um peixe de fundo, onde vive raspando o substrato com seus inúmeros e delicados dentes, à procura de alimento', 'DOCE', 'LC', 'NÃO');
INSERT INTO peixe (nome_cientifico, nome_comum, familia, tipo_agua, classificacao_risco, periodo_desova) values ('Arapaima gigas', 'Pirarucu', 'Osteoglossidae',
'DOCE', 'DD', 'SIM');
INSERT INTO peixe (nome_cientifico, nome_comum, familia, descricao, tipo_agua, classificacao_risco, periodo_desova) values ('Salminus brasiliensis', 'Dourado', 'Characidae',
'O Dourado habita águas rápidas, corredeiras e cachoeiras, assim como as margens de barrancos, bocas de corixos e galhadas no meio dos rios. Costuma nadar em cardumes', 'DOCE', 'LC', 'NÃO');
INSERT INTO peixe (nome_cientifico, nome_comum, familia, descricao, tipo_agua, classificacao_risco, periodo_desova) values ('Pseudoplatystoma corruscans', 'Pintado', 'Pimelodidae',
'O Pintado é um peixe de couro, com coloração acinzentada e diversas pintas pretas cilíndricas pelo corpo. Já seu ventre tem uma coloração esbranquiçada', 'DOCE', 'LC', 'SIM');
INSERT INTO peixe (nome_cientifico, nome_comum, familia, tipo_agua, classificacao_risco, periodo_desova) values ('Tilapia rendalli', 'Tilápia', 'Cichlidae',
'DOCE', 'LC', 'NÃO');
INSERT INTO peixe (nome_cientifico, nome_comum, familia, tipo_agua, classificacao_risco, periodo_desova) values ('Kolpotocheirodon theloura', 'Lambari', 'Characidae',
'DOCE', 'VU', 'NÃO');
INSERT INTO peixe (nome_cientifico, nome_comum, familia, tipo_agua, classificacao_risco, periodo_desova) values ('Thunnus obesus', 'Patudo', 'Scombridae',
'SALGADA', 'VU', 'NÃO');
INSERT INTO peixe (nome_cientifico, nome_comum, familia, descricao, tipo_agua, classificacao_risco, periodo_desova) values ('Sarda sarda', 'Bonito', 'Scombridae',
'Peixe de escamas; corpo alongado e fusiforme', 'SALGADA', 'DD', 'NÃO');
INSERT INTO peixe (nome_cientifico, nome_comum, familia, tipo_agua, classificacao_risco, periodo_desova) values ('Carcharhinus plumbeus', 'Cação', 'Carcharhinidae',
'SALGADA', 'NT', 'SIM');

INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep, telefone) values ('WWF Brasil', 'PRIVADO', 'Quadra CLS', '114', 'Asa Sul', 'Brasília', '70377540', '6136860632');
INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep) values ('Instituto Costa Brasilis', 'PRIVADO', 'Rua Emiliano Cardoso de Mello', '46', 'Vila Butantã', 'São Paulo', '05360060');
INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep, telefone) values ('Instituto Chico Mendes', 'PÚBLICO', 'Estrada Hisaichi Take Bayashi', '8600', 'Atibaia', 'São Paulo', '12952011', '1144116633');
INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep) values ('Parque Ibirapuera Conservação', 'PÚBLICO', 'Avenida República do Líbano', '448', 'Ibirapuera', 'São Paulo', '04502000');
INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep) values ('Instituto Regeneração Global', 'PRIVADO', 'Rua dos Eletricistas', '140', 'Parque Novo Horizonte', 'São José dos Campos', '12225710');
INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep, telefone) values ('IBAMA', 'PÚBLICO', 'Avenida do Contorno', '8121', 'Lourdes', 'Belo Horizonte', '30110051', '3135556102');
INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep, telefone) values ('SOS Mata Atlântica', 'PÚBLICO', 'Avenida Paulista', '2073', 'Bela Vista', 'São Paulo', '01311300', '1132624088');
INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep, telefone) values ('Conservação Internacional Brasil', 'PRIVADO', 'Avenida Rio Branco', '131', 'Centro', 'Rio de Janeiro', '20040006', '2121736360');
INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep, telefone) values ('FBDS', 'PRIVADO', 'Rua Engenheiro Álvaro Niemeyer', '76', 'São Conrado', 'Rio de Janeiro', '22610180', '2133224520');
INSERT INTO orgao (razao_social, tipo_org, endereco, nro_rua, bairro, cidade, cep, telefone) values ('Instituto de Pesquisas Ecológicas',  'PRIVADO', 'Rodovia Dom Pedro I', '47', 'Nazaré  Paulista', 'São Paulo', '12960000', '1135900041');

INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, tipo_pesca_permitida, id_orgao, pesca_permitida) values (-23.588159472814155, -46.66130352887511, 'LAGO', 'PÚBLICA', 'ESPORTIVA', 4, 'SIM');
INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, tipo_pesca_permitida, id_orgao, pesca_permitida) values (-23.447647794976348, -45.066573207741875, 'COSTA', 'PÚBLICA', 'ESPORTIVA', 2, 'NÃO');
INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, id_orgao, pesca_permitida) values (-21.047852750729543, -50.46973752965941 , 'RIO', 'PÚBLICA', 6, 'NÃO');
INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, id_orgao, pesca_permitida) values (-23.33950112078015, -47.34615000000001, 'LAGO', 'PARTICULAR', 8, 'NÃO');
INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, id_orgao, pesca_permitida) values (-23.82387421484981, -46.67229416931132, 'RIO', 'PARTICULAR', 9, 'SIM');
INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, id_orgao, pesca_permitida) values (-23.646511657691715, -47.16904867724533, 'RIO', 'PARTICULAR', 9, 'SIM');
INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, id_orgao, pesca_permitida) values (-23.769485039314578, -45.72365346488018, 'COSTA', 'PÚBLICA', 2, 'NÃO');
INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, id_orgao, pesca_permitida) values (-23.937615141754215, -46.16360093884461, 'ALTO MAR', 'PÚBLICA', 3, 'SIM');
INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, id_orgao, pesca_permitida) values (-23.442148500733108, -46.62962139812833, 'RIO', 'PARTICULAR', 6, 'NÃO');
INSERT INTO local_pesca (latitude, longitude, localizacao, tipo_propriedade, id_orgao, pesca_permitida) values (-24.05023077508045, -46.259519469433606, 'ALTO MAR', 'PÚBLICA', 6, 'SIM');

INSERT INTO associativa_peixe_local_pesca values (2, 1);
INSERT INTO associativa_peixe_local_pesca values (1, 7);
INSERT INTO associativa_peixe_local_pesca values (3, 3);
INSERT INTO associativa_peixe_local_pesca values (4, 5);
INSERT INTO associativa_peixe_local_pesca values (8, 4);
INSERT INTO associativa_peixe_local_pesca values (9, 3);
INSERT INTO associativa_peixe_local_pesca values (10, 2);
INSERT INTO associativa_peixe_local_pesca values (2, 8);
INSERT INTO associativa_peixe_local_pesca values (5, 8);
INSERT INTO associativa_peixe_local_pesca values (8, 2);

INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (1, 21.9, 7.1, 'NÃO', 'NÃO', 'NÃO', 25.22, 'NÃO', 'NÃO');
INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (5, 23, 8.2, 'NÃO', 'NÃO', 'NÃO', 33.55, 'SIM', 'NÃO');
INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (3, 29, 9, 'SIM', 'SIM', 'SIM', 34.56, 'NÃO', 'SIM');
INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (6, 31.2, 6.5, 'NÃO', 'NÃO', 'NÃO', 39.67, 'NÃO', 'NÃO');
INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (8, 22.2, 9.1, 'NÃO', 'NÃO', 'NÃO', 45.54, 'NÃO', 'NÃO');
INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (10, 31.0, 7.5, 'SIM', 'NÃO', 'NÃO', 24.27, 'NÃO', 'NÃO');
INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (2, 25.6, 8.3, 'SIM', 'SIM', 'SIM', 26.89, 'SIM', 'NÃO');
INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (7, 22, 8.4, 'SIM', 'NÃO', 'NÃO', 27.4, 'NÃO', 'NÃO');
INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (4, 20.7, 7, 'NÃO', 'NÃO', 'NÃO', 69.64, 'SIM', 'NÃO');
INSERT INTO relatorio (id_local, temperatura_media, ph, presenca_turbidez, presenca_solidos_toxicos, presenca_coliformes_fecais, teor_oxigenio_dissolvido, excesso_nitratos, excesso_fosfatos) values (9, 33, 8.5, 'NÃO', 'NÃO', 'NÃO', 55.89, 'NÃO', 'SIM');

-- Script Consultas

-- SELECT * FROM peixe;
-- SELECT * FROM local_pesca;
-- SELECT * FROM orgao;
-- SELECT * FROM relatorio;

-- select nome_comum, familia, classificacao_risco from peixe where periodo_desova like 'SIM' order by id_peixe;

-- select o.razao_social,o.tipo_org, lp.latitude, lp.longitude, lp.tipo_pesca_permitida from orgao o inner join local_pesca lp on (lp.id_orgao = o.id_orgao) where lp.pesca_permitida like 'SIM' order by lp.id_local;