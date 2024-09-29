
USE bd_plataforma;

CREATE TABLE Professor (
  id_prof INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(90) NOT NULL,
  email VARCHAR(90) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  dat_nasc DATETIME NOT NULL,
  especialidade VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_prof)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE Respostas (
  id_resp INT NOT NULL AUTO_INCREMENT,
  gabarito VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_resp)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE Alunos (
  id_aluno INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(90) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  email VARCHAR(90) NOT NULL,
  dat_nasc DATETIME NOT NULL,
  PRIMARY KEY (id_aluno)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE Cursos (
  id_cursos INT NOT NULL AUTO_INCREMENT,
  nome_materia VARCHAR(45) NOT NULL,
  id_prof INT NOT NULL,
  PRIMARY KEY (id_cursos),
  FOREIGN KEY (id_prof) REFERENCES Professor (id_prof)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE Administrador (
  id_adm INT NOT NULL AUTO_INCREMENT,
  email_adm VARCHAR(90) NOT NULL,
  nome_adm VARCHAR(90) NOT NULL,
  senha_adm VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_adm)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE Atividades (
  id_ativ INT NOT NULL AUTO_INCREMENT,
  id_cursos INT NOT NULL,
  aluno_id INT NOT NULL,
  id_respostas INT NOT NULL,
  titulo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_ativ),
  FOREIGN KEY (id_respostas) REFERENCES Respostas (id_resp),  
  FOREIGN KEY (aluno_id) REFERENCES Alunos (id_aluno),
  FOREIGN KEY (id_cursos) REFERENCES Cursos (id_cursos)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE Simulados (
  id_simulados INT NOT NULL AUTO_INCREMENT,
  id_respostas INT NOT NULL,
  questoes TEXT NOT NULL,
  PRIMARY KEY (id_simulados),
  FOREIGN KEY (id_respostas) REFERENCES Respostas (id_resp)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE aplicacao (
  id_aplicacao INT NOT NULL AUTO_INCREMENT,
  data_aplic DATETIME NOT NULL,
  local_aplic VARCHAR(45) NOT NULL,
  instituicao VARCHAR(45) NOT NULL,
  id_aluno INT NOT NULL,
  id_simulados INT NOT NULL,
  PRIMARY KEY (id_aplicacao),
  FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno),
  FOREIGN KEY (id_simulados) REFERENCES Simulados (id_simulados)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE Analise_Desempenho (
  id_desempenho INT NOT NULL AUTO_INCREMENT,
  id_aluno INT NOT NULL,
  id_curso INT NOT NULL,
  nota INT NULL,
  id_aplicacao INT NOT NULL,
  PRIMARY KEY (id_desempenho),
  FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno),
  FOREIGN KEY (id_curso) REFERENCES Cursos (id_cursos),
  FOREIGN KEY (id_aplicacao) REFERENCES aplicacao (id_aplicacao)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE Vídeo_Aulas (
  id_aulas INT NOT NULL AUTO_INCREMENT,
  título VARCHAR(90) NOT NULL,
  duração TIME NOT NULL,
  id_cursos INT NOT NULL,
  url VARCHAR(45) NOT NULL,
  id_adm INT NULL,
  PRIMARY KEY (id_aulas),
  FOREIGN KEY (id_cursos) REFERENCES Cursos (id_cursos),
  FOREIGN KEY (id_adm) REFERENCES Administrador (id_adm)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;

CREATE TABLE Comentarios (
  id_comentarios INT NOT NULL AUTO_INCREMENT,
  id_aluno INT NOT NULL,
  texto VARCHAR(999) NOT NULL,
  id_ativ INT NULL,
  id_aula INT NULL,
  id_prof INT NOT NULL,
  PRIMARY KEY (id_comentarios),
  FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno),
  FOREIGN KEY (id_ativ) REFERENCES Atividades (id_ativ),
  FOREIGN KEY (id_aula) REFERENCES Vídeo_Aulas (id_aulas),
  FOREIGN KEY (id_prof) REFERENCES Professor (id_prof)
) DEFAULT CHARSET = utf8 COLLATE = utf8_general_ci;