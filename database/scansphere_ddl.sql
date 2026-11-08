CREATE TABLE gestores (
    id_gestor    NUMBER(10) NOT NULL,
    nm_gestor    VARCHAR2(100) NOT NULL,
    email_gestor VARCHAR2(150) NOT NULL
);

ALTER TABLE gestores ADD CONSTRAINT gestores_pk PRIMARY KEY ( id_gestor );

CREATE TABLE usuarios (
    id_usuario     NUMBER(10) NOT NULL,
    id_gestor      NUMBER(10) NOT NULL,
    nm_usuario     VARCHAR2(100) NOT NULL,
    email_usuario  VARCHAR2(150) NOT NULL,
    status_usuario CHAR(1) NOT NULL
);

ALTER TABLE usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY ( id_usuario );

CREATE TABLE relatorios (
    id_relatorio NUMBER(10) NOT NULL,
    id_usuario   NUMBER(10) NOT NULL,
    dt_relatorio DATE NOT NULL
);

ALTER TABLE relatorios ADD CONSTRAINT relatorios_pk PRIMARY KEY ( id_relatorio );

CREATE TABLE interacoes (
    id_interacoes           NUMBER(10) NOT NULL,
    id_usuario              NUMBER(10) NOT NULL,
    pergunta_usuario        CLOB NOT NULL,
    resposta_ia             CLOB NOT NULL,
    habilidade_identificada VARCHAR2(100) NOT NULL,
    dt_iteracao             DATE NOT NULL
);

ALTER TABLE interacoes ADD CONSTRAINT interacoes_pk PRIMARY KEY ( id_interacoes );

CREATE TABLE pontuacoes (
    id_pontuacoes NUMBER(10) NOT NULL,
    id_usuario    NUMBER(10) NOT NULL,
    qtde_pontos   NUMBER(10),
    dt_ponto      DATE,
    motivo        VARCHAR2(100)
);

ALTER TABLE pontuacoes ADD CONSTRAINT pontuacoes_pk PRIMARY KEY ( id_pontuacoes );

CREATE TABLE recomendacoes (
    id_recomendacoes         NUMBER(10) NOT NULL,
    id_interacoes            NUMBER(10) NOT NULL,
    skill_sugerida_recomanda VARCHAR2(100) NOT NULL,
    status_recomenda         NUMBER(10) NOT NULL,
    data_criacao_recomenda   DATE NOT NULL
);

ALTER TABLE recomendacoes ADD CONSTRAINT recomendacoes_pk PRIMARY KEY ( id_recomendacoes );

CREATE TABLE cursos (
    id_cursos          NUMBER(10) NOT NULL,
    id_recomendacoes   NUMBER(10) NOT NULL,
    titulo_curso       VARCHAR2(100) NOT NULL,
    url_alura          VARCHAR2(500) NOT NULL,
    id_categoria_curso NUMBER(10) NOT NULL,
    duracao_curso      FLOAT NOT NULL
);

ALTER TABLE cursos ADD CONSTRAINT cursos_pk PRIMARY KEY ( id_cursos );

ALTER TABLE usuarios
    ADD CONSTRAINT fk_gestor_usuario FOREIGN KEY ( id_gestor )
        REFERENCES gestores ( id_gestor );

ALTER TABLE relatorios
    ADD CONSTRAINT fk_usuario_relatorio FOREIGN KEY ( id_usuario )
        REFERENCES usuarios ( id_usuario );

ALTER TABLE interacoes
    ADD CONSTRAINT fk_usuario_interacoes FOREIGN KEY ( id_usuario )
        REFERENCES usuarios ( id_usuario );

ALTER TABLE pontuacoes
    ADD CONSTRAINT fk_usuario_pontuacao FOREIGN KEY ( id_usuario )
        REFERENCES usuarios ( id_usuario );

ALTER TABLE recomendacoes
    ADD CONSTRAINT fk_interacoes_recomendacoes FOREIGN KEY ( id_interacoes )
        REFERENCES interacoes ( id_interacoes );

ALTER TABLE cursos
    ADD CONSTRAINT fk_recomendacoes_cursos FOREIGN KEY ( id_recomendacoes )
        REFERENCES recomendacoes ( id_recomendacoes );
