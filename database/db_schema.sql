-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema les
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema les
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `les` DEFAULT CHARACTER SET utf8 ;
USE `les` ;

-- -----------------------------------------------------
-- Table `les`.`Utilizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Utilizador` (
  `idutilizador` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `userName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idutilizador`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Administrador` (
  `Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  CONSTRAINT `fk_Administrador_Utilizador1`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`Utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`colaborador` (
  `curso` VARCHAR(45) NULL,
  `preferencia` VARCHAR(45) NULL,
  `Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  CONSTRAINT `fk_colaborador_Utilizador1`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`Utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Dia Aberto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Dia Aberto` (
  `ano` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `datainscricao` DATE NULL,
  `emailDiaAberto` VARCHAR(45) NULL,
  `enderecoPaginaWeb` VARCHAR(45) NOT NULL,
  `dataDiainscricaoAtividadesInicio` DATE NOT NULL,
  `dataDiaAbertoInicio` DATE NOT NULL,
  `dataInscricaoAtividadesfim` DATE NOT NULL,
  `dataDiaAbertofim` DATE NOT NULL,
  `dataPropostaAtividadeInicio` DATE NOT NULL,
  `dataPropostaAtividadesFim` DATE NOT NULL,
  `Dia Abertocol` VARCHAR(45) NOT NULL,
  `Utilizador_idutilizador` INT NOT NULL,
  `Administrador_Utilizador_idutilizador` INT NOT NULL,
  `colaborador_Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`ano`),
  INDEX `fk_Dia Aberto_Utilizador1_idx` (`Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_Dia Aberto_Administrador1_idx` (`Administrador_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_Dia Aberto_colaborador1_idx` (`colaborador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_Dia Aberto_Utilizador1`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`Utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dia Aberto_Administrador1`
    FOREIGN KEY (`Administrador_Utilizador_idutilizador`)
    REFERENCES `les`.`Administrador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dia Aberto_colaborador1`
    FOREIGN KEY (`colaborador_Utilizador_idutilizador`)
    REFERENCES `les`.`colaborador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`notificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`notificacao` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `criadoem` VARCHAR(45) NULL,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`transporte` (
  `idtransporte` INT NOT NULL AUTO_INCREMENT,
  `horariochegada` DATETIME(6) NULL,
  `capacidade` INT NOT NULL,
  `identificacao` VARCHAR(45) NOT NULL,
  `Administrador_Utilizador_idutilizador1` INT NULL,
  PRIMARY KEY (`idtransporte`),
  UNIQUE INDEX `horariochegada_UNIQUE` (`horariochegada` ASC) VISIBLE,
  INDEX `fk_transporte_Administrador1_idx` (`Administrador_Utilizador_idutilizador1` ASC) VISIBLE,
  CONSTRAINT `fk_transporte_Administrador1`
    FOREIGN KEY (`Administrador_Utilizador_idutilizador1`)
    REFERENCES `les`.`Administrador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Coordenador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Coordenador` (
  `Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  CONSTRAINT `fk_Coordenador_Utilizador1`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`Utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`unidade Organica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`unidade Organica` (
  `idUO` INT NOT NULL,
  `sigla` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`idUO`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Professor Universitario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Professor Universitario` (
  `Utilizador_idutilizador` INT NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  INDEX `fk_Professor Universitario_unidade Organica1_idx` (`unidade Organica_idUO` ASC) VISIBLE,
  CONSTRAINT `fk_Professor Universitario_Utilizador1`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`Utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professor Universitario_unidade Organica1`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade Organica` (`idUO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idUO` VARCHAR(45) NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  PRIMARY KEY (`idDepartamento`, `unidade Organica_idUO`),
  INDEX `fk_Departamento_unidade Organica1_idx` (`unidade Organica_idUO` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_unidade Organica1`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade Organica` (`idUO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Atividade` (
  `idAtividade` INT NOT NULL,
  `capacidade` INT NULL,
  `duracao` FLOAT NULL,
  `Professor Universitario_Utilizador_idutilizador` INT NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idAtividade`),
  INDEX `fk_Atividade_Professor Universitario1_idx` (`Professor Universitario_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_Atividade_unidade Organica1_idx` (`unidade Organica_idUO` ASC) VISIBLE,
  INDEX `fk_Atividade_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Atividade_Professor Universitario1`
    FOREIGN KEY (`Professor Universitario_Utilizador_idutilizador`)
    REFERENCES `les`.`Professor Universitario` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atividade_unidade Organica1`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade Organica` (`idUO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atividade_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `les`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`tarefa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`tarefa` (
  `idtarefa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `concluida` TINYINT NOT NULL,
  `Coordenador_Utilizador_idutilizador` INT NOT NULL,
  `colaborador_Utilizador_idutilizador` INT NOT NULL,
  `Atividade_idAtividade` INT NOT NULL,
  PRIMARY KEY (`idtarefa`),
  INDEX `fk_tarefa_Coordenador1_idx` (`Coordenador_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_tarefa_colaborador1_idx` (`colaborador_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_tarefa_Atividade1_idx` (`Atividade_idAtividade` ASC) VISIBLE,
  CONSTRAINT `fk_tarefa_Coordenador1`
    FOREIGN KEY (`Coordenador_Utilizador_idutilizador`)
    REFERENCES `les`.`Coordenador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarefa_colaborador1`
    FOREIGN KEY (`colaborador_Utilizador_idutilizador`)
    REFERENCES `les`.`colaborador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarefa_Atividade1`
    FOREIGN KEY (`Atividade_idAtividade`)
    REFERENCES `les`.`Atividade` (`idAtividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Participante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Participante` (
  `Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  CONSTRAINT `fk_Participante_Utilizador1`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`Utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`inscricao individual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`inscricao individual` (
  `idinscricao` INT NOT NULL,
  `nracompanhades` INT ZEROFILL NOT NULL,
  `Participante_Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`idinscricao`),
  INDEX `fk_inscricao individual_Participante1_idx` (`Participante_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_inscricao individual_Participante1`
    FOREIGN KEY (`Participante_Utilizador_idutilizador`)
    REFERENCES `les`.`Participante` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`inscricao coletiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`inscricao coletiva` (
  `idinscricao` INT NOT NULL,
  `nresponsaveis` INT NULL,
  `turma` CHAR NULL,
  `Participante_Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`idinscricao`),
  INDEX `fk_inscricao coletiva_Participante1_idx` (`Participante_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_inscricao coletiva_Participante1`
    FOREIGN KEY (`Participante_Utilizador_idutilizador`)
    REFERENCES `les`.`Participante` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`inscricao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`inscricao` (
  `idinscricao` INT NOT NULL AUTO_INCREMENT,
  `ano` YEAR NULL,
  `local` VARCHAR(45) NULL,
  `areacientifica` VARCHAR(45) NULL,
  `Atividade_idAtividade` INT NOT NULL,
  `inscricao individual_idinscricao` INT NOT NULL,
  `inscricao coletiva_idinscricao` INT NOT NULL,
  PRIMARY KEY (`idinscricao`, `inscricao individual_idinscricao`, `inscricao coletiva_idinscricao`),
  INDEX `fk_inscricao_Atividade1_idx` (`Atividade_idAtividade` ASC) VISIBLE,
  INDEX `fk_inscricao_inscricao individual1_idx` (`inscricao individual_idinscricao` ASC) VISIBLE,
  INDEX `fk_inscricao_inscricao coletiva1_idx` (`inscricao coletiva_idinscricao` ASC) VISIBLE,
  CONSTRAINT `fk_inscricao_Atividade1`
    FOREIGN KEY (`Atividade_idAtividade`)
    REFERENCES `les`.`Atividade` (`idAtividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscricao_inscricao individual1`
    FOREIGN KEY (`inscricao individual_idinscricao`)
    REFERENCES `les`.`inscricao individual` (`idinscricao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscricao_inscricao coletiva1`
    FOREIGN KEY (`inscricao coletiva_idinscricao`)
    REFERENCES `les`.`inscricao coletiva` (`idinscricao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`escola` (
  `idescola` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `inscricao coletiva_idinscricao` INT NOT NULL,
  PRIMARY KEY (`idescola`),
  INDEX `fk_escola_inscricao coletiva1_idx` (`inscricao coletiva_idinscricao` ASC) VISIBLE,
  CONSTRAINT `fk_escola_inscricao coletiva1`
    FOREIGN KEY (`inscricao coletiva_idinscricao`)
    REFERENCES `les`.`inscricao coletiva` (`idinscricao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Campus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Campus` (
  `idCampus` INT NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  PRIMARY KEY (`idCampus`),
  INDEX `fk_Campus_unidade Organica1_idx` (`unidade Organica_idUO` ASC) VISIBLE,
  CONSTRAINT `fk_Campus_unidade Organica1`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade Organica` (`idUO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Menu` (
  `idMenu` INT NOT NULL,
  `precoAluno` FLOAT NOT NULL,
  `PrecoProfessor` FLOAT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `menu` VARCHAR(45) NULL,
  `Administrador_Utilizador_idutilizador` INT NOT NULL,
  `Campus_idCampus` INT NOT NULL,
  PRIMARY KEY (`idMenu`),
  INDEX `fk_Menu_Administrador1_idx` (`Administrador_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_Menu_Campus1_idx` (`Campus_idCampus` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Administrador1`
    FOREIGN KEY (`Administrador_Utilizador_idutilizador`)
    REFERENCES `les`.`Administrador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_Campus1`
    FOREIGN KEY (`Campus_idCampus`)
    REFERENCES `les`.`Campus` (`idCampus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`sessao` (
  `idsessao` INT NOT NULL,
  `horario` DATETIME(6) NOT NULL,
  `nrinscritos` INT NOT NULL,
  `vagas` INT NOT NULL,
  `Atividade_idAtividade` INT NOT NULL,
  PRIMARY KEY (`idsessao`),
  INDEX `fk_sessao_Atividade1_idx` (`Atividade_idAtividade` ASC) VISIBLE,
  CONSTRAINT `fk_sessao_Atividade1`
    FOREIGN KEY (`Atividade_idAtividade`)
    REFERENCES `les`.`Atividade` (`idAtividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`espaco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`espaco` (
  `idespaco` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sessao_idsessao` INT NOT NULL,
  PRIMARY KEY (`idespaco`),
  INDEX `fk_espaco_sessao1_idx` (`sessao_idsessao` ASC) VISIBLE,
  CONSTRAINT `fk_espaco_sessao1`
    FOREIGN KEY (`sessao_idsessao`)
    REFERENCES `les`.`sessao` (`idsessao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`sala` (
  `idespaco` INT NOT NULL,
  `edificio` VARCHAR(45) NULL,
  `andar` VARCHAR(45) NULL,
  `gabinete` VARCHAR(45) NULL,
  `espaco_idespaco` INT NOT NULL,
  PRIMARY KEY (`idespaco`, `espaco_idespaco`),
  INDEX `fk_sala_espaco1_idx` (`espaco_idespaco` ASC) VISIBLE,
  CONSTRAINT `fk_sala_espaco1`
    FOREIGN KEY (`espaco_idespaco`)
    REFERENCES `les`.`espaco` (`idespaco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`arlivre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`arlivre` (
  `idespaco` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `espaco_idespaco` INT NOT NULL,
  PRIMARY KEY (`idespaco`, `espaco_idespaco`),
  INDEX `fk_arlivre_espaco1_idx` (`espaco_idespaco` ASC) VISIBLE,
  CONSTRAINT `fk_arlivre_espaco1`
    FOREIGN KEY (`espaco_idespaco`)
    REFERENCES `les`.`espaco` (`idespaco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`anfiteatro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`anfiteatro` (
  `idespaco` INT NOT NULL,
  `edificio` VARCHAR(45) NULL,
  `andar` VARCHAR(45) NULL,
  `espaco_idespaco` INT NOT NULL,
  PRIMARY KEY (`idespaco`, `espaco_idespaco`),
  INDEX `fk_anfiteatro_espaco1_idx` (`espaco_idespaco` ASC) VISIBLE,
  CONSTRAINT `fk_anfiteatro_espaco1`
    FOREIGN KEY (`espaco_idespaco`)
    REFERENCES `les`.`espaco` (`idespaco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Prato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Prato` (
  `idPrato` INT NOT NULL,
  `nralomocosdisponiveis` INT NOT NULL,
  `prato` VARCHAR(45) NOT NULL,
  `Menu_idMenu` INT NULL,
  PRIMARY KEY (`idPrato`),
  INDEX `fk_Prato_Menu1_idx` (`Menu_idMenu` ASC) VISIBLE,
  CONSTRAINT `fk_Prato_Menu1`
    FOREIGN KEY (`Menu_idMenu`)
    REFERENCES `les`.`Menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`idioma` (
  `nome` VARCHAR(24) NOT NULL,
  `sigla` VARCHAR(45) NOT NULL,
  `Administrador_Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE INDEX `sigla_UNIQUE` (`sigla` ASC) VISIBLE,
  INDEX `fk_idioma_Administrador1_idx` (`Administrador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_idioma_Administrador1`
    FOREIGN KEY (`Administrador_Utilizador_idutilizador`)
    REFERENCES `les`.`Administrador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`transporte Universitario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`transporte Universitario` (
  `capacidade` INT NOT NULL,
  `transporte_idtransporte` INT NOT NULL,
  PRIMARY KEY (`transporte_idtransporte`),
  CONSTRAINT `fk_transporte Universitario_transporte1`
    FOREIGN KEY (`transporte_idtransporte`)
    REFERENCES `les`.`transporte` (`idtransporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Transporte Pessoal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Transporte Pessoal` (
  `transporte_idtransporte` INT NOT NULL,
  PRIMARY KEY (`transporte_idtransporte`),
  CONSTRAINT `fk_Transporte Pessoal_transporte1`
    FOREIGN KEY (`transporte_idtransporte`)
    REFERENCES `les`.`transporte` (`idtransporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Atividade_has_sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Atividade_has_sessao` (
  `Atividade_idAtividade` INT NOT NULL,
  `sessao_idsessao` INT NOT NULL,
  PRIMARY KEY (`Atividade_idAtividade`, `sessao_idsessao`),
  INDEX `fk_Atividade_has_sessao_sessao1_idx` (`sessao_idsessao` ASC) VISIBLE,
  INDEX `fk_Atividade_has_sessao_Atividade1_idx` (`Atividade_idAtividade` ASC) VISIBLE,
  CONSTRAINT `fk_Atividade_has_sessao_Atividade1`
    FOREIGN KEY (`Atividade_idAtividade`)
    REFERENCES `les`.`Atividade` (`idAtividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atividade_has_sessao_sessao1`
    FOREIGN KEY (`sessao_idsessao`)
    REFERENCES `les`.`sessao` (`idsessao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Material` (
  `idMaterial` INT NOT NULL,
  PRIMARY KEY (`idMaterial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Utilizador_has_notificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Utilizador_has_notificacao` (
  `Utilizador_idutilizador` INT NOT NULL,
  `notificacao_id` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`, `notificacao_id`),
  INDEX `fk_Utilizador_has_notificacao_notificacao1_idx` (`notificacao_id` ASC) VISIBLE,
  INDEX `fk_Utilizador_has_notificacao_Utilizador1_idx` (`Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_Utilizador_has_notificacao_Utilizador1`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`Utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilizador_has_notificacao_notificacao1`
    FOREIGN KEY (`notificacao_id`)
    REFERENCES `les`.`notificacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Atividade_has_Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Atividade_has_Material` (
  `Atividade_idAtividade` INT NOT NULL,
  `Material_idMaterial` INT NOT NULL,
  PRIMARY KEY (`Atividade_idAtividade`, `Material_idMaterial`),
  INDEX `fk_Atividade_has_Material_Material1_idx` (`Material_idMaterial` ASC) VISIBLE,
  INDEX `fk_Atividade_has_Material_Atividade1_idx` (`Atividade_idAtividade` ASC) VISIBLE,
  CONSTRAINT `fk_Atividade_has_Material_Atividade1`
    FOREIGN KEY (`Atividade_idAtividade`)
    REFERENCES `les`.`Atividade` (`idAtividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atividade_has_Material_Material1`
    FOREIGN KEY (`Material_idMaterial`)
    REFERENCES `les`.`Material` (`idMaterial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Horario` (
  `transporte_idtransporte` INT NOT NULL,
  `colaborador_Utilizador_idutilizador` INT NOT NULL,
  `Menu_idMenu` INT NOT NULL,
  `inicio` DATETIME(6) NULL,
  `fim` DATETIME(6) NULL,
  `Horariocol` VARCHAR(45) NULL,
  `sessao_idsessao` INT NOT NULL,
  INDEX `fk_transporte_has_colaborador_colaborador1_idx` (`colaborador_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_transporte_has_colaborador_transporte1_idx` (`transporte_idtransporte` ASC) VISIBLE,
  INDEX `fk_transporte_has_colaborador_Menu1_idx` (`Menu_idMenu` ASC) VISIBLE,
  PRIMARY KEY (`transporte_idtransporte`, `colaborador_Utilizador_idutilizador`, `Menu_idMenu`, `sessao_idsessao`),
  INDEX `fk_Horario_sessao1_idx` (`sessao_idsessao` ASC) VISIBLE,
  CONSTRAINT `fk_transporte_has_colaborador_transporte1`
    FOREIGN KEY (`transporte_idtransporte`)
    REFERENCES `les`.`transporte` (`idtransporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transporte_has_colaborador_colaborador1`
    FOREIGN KEY (`colaborador_Utilizador_idutilizador`)
    REFERENCES `les`.`colaborador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transporte_has_colaborador_Menu1`
    FOREIGN KEY (`Menu_idMenu`)
    REFERENCES `les`.`Menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Horario_sessao1`
    FOREIGN KEY (`sessao_idsessao`)
    REFERENCES `les`.`sessao` (`idsessao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`colaborador_has_Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`colaborador_has_Horario` (
  `colaborador_Utilizador_idutilizador` INT NOT NULL,
  `Horario_transporte_idtransporte` INT NOT NULL,
  `Horario_colaborador_Utilizador_idutilizador` INT NOT NULL,
  `Horario_Menu_idMenu` INT NOT NULL,
  `Horario_sessao_idsessao` INT NOT NULL,
  PRIMARY KEY (`colaborador_Utilizador_idutilizador`, `Horario_transporte_idtransporte`, `Horario_colaborador_Utilizador_idutilizador`, `Horario_Menu_idMenu`, `Horario_sessao_idsessao`),
  INDEX `fk_colaborador_has_Horario_Horario1_idx` (`Horario_transporte_idtransporte` ASC, `Horario_colaborador_Utilizador_idutilizador` ASC, `Horario_Menu_idMenu` ASC, `Horario_sessao_idsessao` ASC) VISIBLE,
  INDEX `fk_colaborador_has_Horario_colaborador1_idx` (`colaborador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_colaborador_has_Horario_colaborador1`
    FOREIGN KEY (`colaborador_Utilizador_idutilizador`)
    REFERENCES `les`.`colaborador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_colaborador_has_Horario_Horario1`
    FOREIGN KEY (`Horario_transporte_idtransporte` , `Horario_colaborador_Utilizador_idutilizador` , `Horario_Menu_idMenu` , `Horario_sessao_idsessao`)
    REFERENCES `les`.`Horario` (`transporte_idtransporte` , `colaborador_Utilizador_idutilizador` , `Menu_idMenu` , `sessao_idsessao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Menu_has_Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Menu_has_Horario` (
  `Menu_idMenu` INT NOT NULL,
  `Horario_transporte_idtransporte` INT NOT NULL,
  `Horario_colaborador_Utilizador_idutilizador` INT NOT NULL,
  `Horario_Menu_idMenu` INT NOT NULL,
  `Horario_sessao_idsessao` INT NOT NULL,
  PRIMARY KEY (`Menu_idMenu`, `Horario_transporte_idtransporte`, `Horario_colaborador_Utilizador_idutilizador`, `Horario_Menu_idMenu`, `Horario_sessao_idsessao`),
  INDEX `fk_Menu_has_Horario_Horario1_idx` (`Horario_transporte_idtransporte` ASC, `Horario_colaborador_Utilizador_idutilizador` ASC, `Horario_Menu_idMenu` ASC, `Horario_sessao_idsessao` ASC) VISIBLE,
  INDEX `fk_Menu_has_Horario_Menu1_idx` (`Menu_idMenu` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_has_Horario_Menu1`
    FOREIGN KEY (`Menu_idMenu`)
    REFERENCES `les`.`Menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_has_Horario_Horario1`
    FOREIGN KEY (`Horario_transporte_idtransporte` , `Horario_colaborador_Utilizador_idutilizador` , `Horario_Menu_idMenu` , `Horario_sessao_idsessao`)
    REFERENCES `les`.`Horario` (`transporte_idtransporte` , `colaborador_Utilizador_idutilizador` , `Menu_idMenu` , `sessao_idsessao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`inscricao_has_Prato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`inscricao_has_Prato` (
  `inscricao_idinscricao` INT NOT NULL,
  `Prato_idPrato` INT NOT NULL,
  PRIMARY KEY (`inscricao_idinscricao`, `Prato_idPrato`),
  INDEX `fk_inscricao_has_Prato_Prato1_idx` (`Prato_idPrato` ASC) VISIBLE,
  INDEX `fk_inscricao_has_Prato_inscricao1_idx` (`inscricao_idinscricao` ASC) VISIBLE,
  CONSTRAINT `fk_inscricao_has_Prato_inscricao1`
    FOREIGN KEY (`inscricao_idinscricao`)
    REFERENCES `les`.`inscricao` (`idinscricao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inscricao_has_Prato_Prato1`
    FOREIGN KEY (`Prato_idPrato`)
    REFERENCES `les`.`Prato` (`idPrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`transporte_has_inscricao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`transporte_has_inscricao` (
  `transporte_idtransporte` INT NOT NULL,
  `inscricao_idinscricao` INT NOT NULL,
  PRIMARY KEY (`transporte_idtransporte`, `inscricao_idinscricao`),
  INDEX `fk_transporte_has_inscricao_inscricao1_idx` (`inscricao_idinscricao` ASC) VISIBLE,
  INDEX `fk_transporte_has_inscricao_transporte1_idx` (`transporte_idtransporte` ASC) VISIBLE,
  CONSTRAINT `fk_transporte_has_inscricao_transporte1`
    FOREIGN KEY (`transporte_idtransporte`)
    REFERENCES `les`.`transporte` (`idtransporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transporte_has_inscricao_inscricao1`
    FOREIGN KEY (`inscricao_idinscricao`)
    REFERENCES `les`.`inscricao` (`idinscricao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`colaborador_has_unidade Organica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`colaborador_has_unidade Organica` (
  `colaborador_Utilizador_idutilizador` INT NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  PRIMARY KEY (`colaborador_Utilizador_idutilizador`, `unidade Organica_idUO`),
  INDEX `fk_colaborador_has_unidade Organica_unidade Organica1_idx` (`unidade Organica_idUO` ASC) VISIBLE,
  INDEX `fk_colaborador_has_unidade Organica_colaborador1_idx` (`colaborador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_colaborador_has_unidade Organica_colaborador1`
    FOREIGN KEY (`colaborador_Utilizador_idutilizador`)
    REFERENCES `les`.`colaborador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_colaborador_has_unidade Organica_unidade Organica1`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade Organica` (`idUO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `les`.`Coordenador_has_Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`Coordenador_has_Departamento` (
  `Coordenador_Utilizador_idutilizador` INT NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `Departamento_unidade Organica_idUO` INT NOT NULL,
  PRIMARY KEY (`Coordenador_Utilizador_idutilizador`, `Departamento_idDepartamento`, `Departamento_unidade Organica_idUO`),
  INDEX `fk_Coordenador_has_Departamento_Departamento1_idx` (`Departamento_idDepartamento` ASC, `Departamento_unidade Organica_idUO` ASC) VISIBLE,
  INDEX `fk_Coordenador_has_Departamento_Coordenador1_idx` (`Coordenador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_Coordenador_has_Departamento_Coordenador1`
    FOREIGN KEY (`Coordenador_Utilizador_idutilizador`)
    REFERENCES `les`.`Coordenador` (`Utilizador_idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coordenador_has_Departamento_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento` , `Departamento_unidade Organica_idUO`)
    REFERENCES `les`.`Departamento` (`idDepartamento` , `unidade Organica_idUO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;