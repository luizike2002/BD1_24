/*
	Escreva um script SQL que alimente as tabelas do seu BD do Simpósio.
	Crie ao menos um simpósio, dois mini-cursos, três palestras, 5 artigos, com autores e participantes
	Não esqueça da comissão avaliadora e das avaliações. Realize o processo de preenchimento de alguns dados
	em todas as tabelas do seu SCHEMA.
*/

-- ADIÇÃO DO SIMPÓSIO
INSERT INTO `SIMPOSIO` (NOME_UNIVERSIDADE, DATA_COMECO, DATA_FIM)
	VALUES ('UNOESC', '2024-05-02', '2024-05-09');
    
-- ADIÇÃO USUÁRIOS
INSERT INTO `USUARIO` (NOME_USUARIO, GENERO_USUARIO)
	VALUES ('Geovani Wartha', 'Masculino');
INSERT INTO `USUARIO` (NOME_USUARIO, GENERO_USUARIO)
	VALUES ('Luiz Henrique Grazziotin de Oliveira', 'Masculino');
INSERT INTO `USUARIO` (NOME_USUARIO, GENERO_USUARIO)
	VALUES ('Camilly Volk', 'Feminino');
INSERT INTO `USUARIO` (NOME_USUARIO, GENERO_USUARIO)
	VALUES ('Ana Luiza Moroso Dallago', 'Feminino');
INSERT INTO `USUARIO` (NOME_USUARIO, GENERO_USUARIO)
	VALUES ('Gabriel Araldi', 'Masculino');
INSERT INTO `USUARIO` (NOME_USUARIO, GENERO_USUARIO)
	VALUES ('Niara Soares Onzi', 'Masculino');
INSERT INTO `USUARIO` (NOME_USUARIO, GENERO_USUARIO)
	VALUES ('Raulmarley Geremia', 'Masculino');

-- ADIÇÃO DE ORGANIZADORES
INSERT INTO `ORGANIZADOR` (ID_SIMPOSIO, ID_MATRICULA)
	VALUES ('1', '3');
    
-- ADIÇÃO DE TEMAS DE ARTIGO
INSERT INTO `TEMA_ARTIGO` (NOME_TEMA_ARTIGO)
	VALUES ('Tecnologia');
INSERT INTO `TEMA_ARTIGO` (NOME_TEMA_ARTIGO)
	VALUES ('Inteligência Artificia');
INSERT INTO `TEMA_ARTIGO` (NOME_TEMA_ARTIGO)
	VALUES ('Finanças');
    
-- ADIÇÃO DE ARTIGOS
INSERT INTO `ARTIGO` (ID_TEMA_ARTIGO, NOME_ARTIGO)
	VALUES ('1', 'O uso de Bancos de Dados em 2024');
INSERT INTO `ARTIGO` (ID_TEMA_ARTIGO, NOME_ARTIGO)
	VALUES ('2', 'Tecnologia no dia-a-dia');
INSERT INTO `ARTIGO` (ID_TEMA_ARTIGO, NOME_ARTIGO)
	VALUES ('2', 'IA's - como adaptar seu trabalho');
INSERT INTO `ARTIGO` (ID_TEMA_ARTIGO, NOME_ARTIGO)
	VALUES ('3', 'Gerenciamento de lucros da empresa');
INSERT INTO `ARTIGO` (ID_TEMA_ARTIGO, NOME_ARTIGO)
	VALUES ('1', 'Programação orientada à objetos');
    
-- ADIÇÃO DOS AUTORES DOS ARTIGOS
INSERT INTO `AUTOR` (ID_ARTIGO, ID_MATRICULA)
	VALUES ('1', '1');
INSERT INTO `AUTOR` (ID_ARTIGO, ID_MATRICULA)
	VALUES ('2', '2');
INSERT INTO `AUTOR` (ID_ARTIGO, ID_MATRICULA)
	VALUES ('5', '3');
INSERT INTO `AUTOR` (ID_ARTIGO, ID_MATRICULA)
	VALUES ('3', '4');
INSERT INTO `AUTOR` (ID_ARTIGO, ID_MATRICULA)
	VALUES ('4', '4');

-- CRIAÇÃO DAS COMISSÕES
INSERT INTO `COMISSAO` (ID_COMISSAO, ID_TEMA_ARTIGO)
	VALUES ('1', '1');
INSERT INTO `COMISSAO` (ID_COMISSAO, ID_TEMA_ARTIGO)
	VALUES ('12', '2');
INSERT INTO `COMISSAO` (ID_COMISSAO, ID_TEMA_ARTIGO)
	VALUES ('17', '3');
    
-- ADIÇÃO DOS MEMBROS DA COMISSÃO
INSERT INTO `MEMBRO_COMISSAO` (ID_COMISSAO, ID_MATRICULA)
	VALUES ('1', '5'); -- responsável pela comissão tecnologia
INSERT INTO `MEMBRO_COMISSAO` (ID_COMISSAO, ID_MATRICULA)
	VALUES ('12', '6'); -- responsável pela comissão agricultura
INSERT INTO `MEMBRO_COMISSAO` (ID_COMISSAO, ID_MATRICULA)
	VALUES ('17', '7'); -- responsável pela comissão economia
    
-- INSERÇÃO DOS PARECER DOS ARTIGOS
INSERT INTO `PARECER_ARTIGO` (ID_ARTIGO, ID_MATRICULA, PARECER)
	VALUES ('1', '5', true); -- ARTIGO 1 APROVADO
INSERT INTO `PARECER_ARTIGO` (ID_ARTIGO, ID_MATRICULA, PARECER)
	VALUES ('2', '6', true); -- ARTIGO 2 APROVADO
INSERT INTO `PARECER_ARTIGO` (ID_ARTIGO, ID_MATRICULA, PARECER)
	VALUES ('3', '6', false); -- ARTIGO 3 REPROVADO
INSERT INTO `PARECER_ARTIGO` (ID_ARTIGO, ID_MATRICULA, PARECER)
	VALUES ('4', '7', false); -- ARTIGO 4 REPROVADO
INSERT INTO `PARECER_ARTIGO` (ID_ARTIGO, ID_MATRICULA, PARECER)
	VALUES ('5', '5', true); -- ARTIGO 5 APROVADO

-- INSERÇÃO TIPO EVENTO
INSERT INTO `TIPO_EVENTO` (NOME_TIPO_EVENTO)
	VALUES ('Minicurso'); -- ID 1
INSERT INTO `TIPO_EVENTO` (NOME_TIPO_EVENTO)
	VALUES ('Palestra'); -- ID 2

-- INSERÇÃO EVENTO
INSERT INTO `EVENTO` (TEMA_EVENTO, DATA_EVENTO, LOCAL_EVENTO, ID_TIPO_EVENTO, ID_SIMPOSIO)
	VALUES ('Introdução à Banco de Dados', '2024-05-02', 'Auditório 01', '1', '1');
INSERT INTO `EVENTO` (TEMA_EVENTO, DATA_EVENTO, LOCAL_EVENTO, ID_TIPO_EVENTO, ID_SIMPOSIO)
	VALUES ('Introdução à Programação', '2024-05-03', 'Auditório 02', '1', '1');
INSERT INTO `EVENTO` (TEMA_EVENTO, DATA_EVENTO, LOCAL_EVENTO, ID_TIPO_EVENTO, ID_SIMPOSIO)
	VALUES ('SIDEHU', '2024-05-04', 'Auditório 01', '2', '1');
INSERT INTO `EVENTO` (TEMA_EVENTO, DATA_EVENTO, LOCAL_EVENTO, ID_TIPO_EVENTO, ID_SIMPOSIO)
	VALUES ('Debate sobre Tecnologia', '2024-05-06', 'Auditório 03', '2', '1');
INSERT INTO `EVENTO` (TEMA_EVENTO, DATA_EVENTO, LOCAL_EVENTO, ID_TIPO_EVENTO, ID_SIMPOSIO)
	VALUES ('O Mercado de Trabalho', '2024-05-07', 'Auditório 03', '2', '1');

-- INSERÇÃO DE APRESENTADORES
INSERT INTO `APRESENTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('3', '2');
INSERT INTO `APRESENTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('2', '3');
INSERT INTO `APRESENTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('1', '4');
INSERT INTO `APRESENTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('4', '1');
INSERT INTO `APRESENTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('5', '2');

-- INSERÇÃO DE ESPECTADORES
INSERT INTO `ESPECTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('1', '5');
INSERT INTO `ESPECTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('2', '6');
INSERT INTO `ESPECTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('3', '7');
INSERT INTO `ESPECTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('4', '2');
INSERT INTO `ESPECTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('5', '1');
INSERT INTO `ESPECTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('5', '3');
INSERT INTO `ESPECTADOR` (ID_EVENTO, ID_MATRICULA)
	VALUES ('5', '4');

