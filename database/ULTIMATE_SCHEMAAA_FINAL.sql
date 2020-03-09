-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABlES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema les
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema les
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `les` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `les` ;

-- -----------------------------------------------------
-- Table `les`.`utilizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`utilizador` (
  `idutilizador` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idutilizador`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`administrador` (
  `Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  CONSTRAINT `fk_Administrador_Utilizador`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`utilizador` (`idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`espaco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`espaco` (
  `idespaco` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idespaco`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`anfiteatro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`anfiteatro` (
  `edificio` VARCHAR(45) NOT NULL,
  `andar` VARCHAR(45) NOT NULL,
  `espaco_idespaco` INT NOT NULL,
  PRIMARY KEY (`espaco_idespaco`),
  INDEX `fk_anfiteatro_espaco_id` (`espaco_idespaco` ASC) VISIBLE,
  CONSTRAINT `fk_anfiteatro_espaco`
    FOREIGN KEY (`espaco_idespaco`)
    REFERENCES `les`.`espaco` (`idespaco`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`arlivre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`arlivre` (
  `descricao` VARCHAR(45) NOT NULL,
  `espaco_idespaco` INT NOT NULL,
  PRIMARY KEY (`espaco_idespaco`),
  INDEX `fk_arlivre_espaco_id` (`espaco_idespaco` ASC) VISIBLE,
  CONSTRAINT `fk_arlivre_espaco`
    FOREIGN KEY (`espaco_idespaco`)
    REFERENCES `les`.`espaco` (`idespaco`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`campus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`campus` (
  `idCampus` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCampus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`unidade organica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`unidade organica` (
  `idUO` INT NOT NULL,
  `sigla` VARCHAR(5) NOT NULL,
  `Campus_idCampus` INT NOT NULL,
  PRIMARY KEY (`idUO`),
  INDEX `fk_unidade Organica_Campus_id` (`Campus_idCampus` ASC) VISIBLE,
  CONSTRAINT `fk_unidade Organica_Campus`
    FOREIGN KEY (`Campus_idCampus`)
    REFERENCES `les`.`campus` (`idCampus`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idUO` VARCHAR(45) NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamento_unidade Organica_id` (`unidade Organica_idUO` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_unidade Organica`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade organica` (`idUO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`professor universitario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`professor universitario` (
  `Utilizador_idutilizador` INT NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  INDEX `fk_Professor Universitario_unidade Organica_id` (`unidade Organica_idUO` ASC) VISIBLE,
  CONSTRAINT `fk_Professor Universitario_unidade Organica`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade organica` (`idUO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Professor Universitario_Utilizador`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`utilizador` (`idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`atividade` (
  `idAtividade` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `capacidade` INT NOT NULL,
  `duracao` FLOAT NOT NULL,
  `descricao` VARCHAR(250) NOT NULL,
  `Professor Universitario_Utilizador_idutilizador` INT NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `espaco_idespaco` INT NOT NULL,
  PRIMARY KEY (`idAtividade`),
  INDEX `fk_Atividade_Professor Universitario_id` (`Professor Universitario_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_Atividade_unidade Organica_id` (`unidade Organica_idUO` ASC) VISIBLE,
  INDEX `fk_Atividade_Departamento_id` (`Departamento_idDepartamento` ASC) VISIBLE,
  INDEX `fk_atividade_espaco1_idx` (`espaco_idespaco` ASC) VISIBLE,
  CONSTRAINT `fk_Atividade_Departamento`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `les`.`departamento` (`idDepartamento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_atividade_espaco`
    FOREIGN KEY (`espaco_idespaco`)
    REFERENCES `les`.`espaco` (`idespaco`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Atividade_Professor Universitario`
    FOREIGN KEY (`Professor Universitario_Utilizador_idutilizador`)
    REFERENCES `les`.`professor universitario` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Atividade_unidade Organica`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade organica` (`idUO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`material` (
  `idMaterial` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMaterial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`atividade_has_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`atividade_has_material` (
  `Atividade_idAtividade` INT NOT NULL,
  `Material_idMaterial` INT NOT NULL,
  PRIMARY KEY (`Atividade_idAtividade`, `Material_idMaterial`),
  INDEX `fk_Atividade_has_Material_Material_id` (`Material_idMaterial` ASC) VISIBLE,
  INDEX `fk_Atividade_has_Material_Atividade_id` (`Atividade_idAtividade` ASC) VISIBLE,
  CONSTRAINT `fk_Atividade_has_Material_Atividade`
    FOREIGN KEY (`Atividade_idAtividade`)
    REFERENCES `les`.`atividade` (`idAtividade`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Atividade_has_Material_Material`
    FOREIGN KEY (`Material_idMaterial`)
    REFERENCES `les`.`material` (`idMaterial`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`dia aberto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`dia aberto` (
  `ano` YEAR(4) NOT NULL,
  `descricao` VARCHAR(120) NULL DEFAULT NULL,
  `datainscricao` DATE NOT NULL,
  `emailDiaAberto` VARCHAR(120) NOT NULL,
  `enderecoPaginaWeb` VARCHAR(60) NOT NULL,
  `dataDiainscricaoAtividadesInicio` DATE NOT NULL,
  `dataDiaAbertoInicio` DATE NOT NULL,
  `dataInscricaoAtividadesfim` DATE NOT NULL,
  `dataDiaAbertofim` DATE NOT NULL,
  `dataPropostaAtividadeInicio` DATE NOT NULL,
  `dataPropostaAtividadesFim` DATE NOT NULL,
  `Utilizador_idutilizador` INT NOT NULL,
  `Administrador_Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`ano`),
  INDEX `fk_Dia Aberto_Utilizador_id` (`Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_Dia Aberto_Administrador_id` (`Administrador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_Dia Aberto_Administrador`
    FOREIGN KEY (`Administrador_Utilizador_idutilizador`)
    REFERENCES `les`.`administrador` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Dia Aberto_Utilizador`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`utilizador` (`idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`colaborador` (
  `curso` VARCHAR(45) NOT NULL,
  `preferencia` VARCHAR(45) NULL DEFAULT NULL,
  `Utilizador_idutilizador` INT NOT NULL,
  `Dia Aberto_ano` YEAR(4) NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  INDEX `fk_colaborador_Dia Aberto_id` (`Dia Aberto_ano` ASC) VISIBLE,
  CONSTRAINT `fk_colaborador_Dia Aberto`
    FOREIGN KEY (`Dia Aberto_ano`)
    REFERENCES `les`.`dia aberto` (`ano`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_colaborador_Utilizador`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`utilizador` (`idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`horario` (
  `horainicio` DATETIME(6) NOT NULL,
  PRIMARY KEY (`horainicio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`colaborador_has_horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`colaborador_has_horario` (
  `colaborador_Utilizador_idutilizador` INT NOT NULL,
  `Horario_horainicio` DATETIME(6) NOT NULL,
  PRIMARY KEY (`colaborador_Utilizador_idutilizador`, `Horario_horainicio`),
  INDEX `fk_colaborador_has_Horario_colaborador_id` (`colaborador_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_colaborador_has_Horario_Horario_id` (`Horario_horainicio` ASC) VISIBLE,
  CONSTRAINT `fk_colaborador_has_Horario_colaborador`
    FOREIGN KEY (`colaborador_Utilizador_idutilizador`)
    REFERENCES `les`.`colaborador` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_colaborador_has_Horario_Horario`
    FOREIGN KEY (`Horario_horainicio`)
    REFERENCES `les`.`horario` (`horainicio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`colaborador_has_unidade organica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`colaborador_has_unidade organica` (
  `colaborador_Utilizador_idutilizador` INT NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  PRIMARY KEY (`colaborador_Utilizador_idutilizador`, `unidade Organica_idUO`),
  INDEX `fk_colaborador_has_unidade Organica_unidade Organica_id` (`unidade Organica_idUO` ASC) VISIBLE,
  INDEX `fk_colaborador_has_unidade Organica_colaborador_id` (`colaborador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_colaborador_has_unidade Organica_colaborador`
    FOREIGN KEY (`colaborador_Utilizador_idutilizador`)
    REFERENCES `les`.`colaborador` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_colaborador_has_unidade Organica_unidade Organica`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade organica` (`idUO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`coordenador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`coordenador` (
  `Utilizador_idutilizador` INT NOT NULL,
  `unidade Organica_idUO` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  INDEX `fk_Coordenador_unidade Organica_id` (`unidade Organica_idUO` ASC) VISIBLE,
  CONSTRAINT `fk_Coordenador_unidade Organica`
    FOREIGN KEY (`unidade Organica_idUO`)
    REFERENCES `les`.`unidade organica` (`idUO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Coordenador_Utilizador`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`utilizador` (`idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`coordenador_has_departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`coordenador_has_departamento` (
  `Coordenador_Utilizador_idutilizador` INT NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`Coordenador_Utilizador_idutilizador`, `Departamento_idDepartamento`),
  INDEX `fk_Coordenador_has_Departamento_Departamento_id` (`Departamento_idDepartamento` ASC) VISIBLE,
  INDEX `fk_Coordenador_has_Departamento_Coordenador_id` (`Coordenador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_Coordenador_has_Departamento_Coordenador`
    FOREIGN KEY (`Coordenador_Utilizador_idutilizador`)
    REFERENCES `les`.`coordenador` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Coordenador_has_Departamento_Departamento`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `les`.`departamento` (`idDepartamento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`escola` (
  `idescola` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idescola`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`idioma` (
  `nome` VARCHAR(24) NOT NULL,
  `sigla` VARCHAR(45) NOT NULL,
  `Administrador_Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE INDEX `sigla_UNIQUE` (`sigla` ASC) VISIBLE,
  INDEX `fk_idioma_Administrador_id` (`Administrador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_idioma_Administrador`
    FOREIGN KEY (`Administrador_Utilizador_idutilizador`)
    REFERENCES `les`.`administrador` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`inscricao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`inscricao` (
  `idinscricao` INT NOT NULL AUTO_INCREMENT,
  `ano` YEAR NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `areacientifica` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idinscricao`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`participante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`participante` (
  `Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`),
  CONSTRAINT `fk_Participante_Utilizador`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`utilizador` (`idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`inscricao coletiva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`inscricao coletiva` (
  `nresponsaveis` INT NOT NULL,
  `turma` CHAR(1) NOT NULL,
  `Participante_Utilizador_idutilizador` INT NOT NULL,
  `escola_idescola` INT NOT NULL,
  `inscricao_idinscricao` INT NOT NULL,
  PRIMARY KEY (`inscricao_idinscricao`),
  INDEX `fk_inscricao coletiva_Participante_id` (`Participante_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_inscricao coletiva_escola_id` (`escola_idescola` ASC) VISIBLE,
  INDEX `fk_inscricao coletiva_inscricao_id` (`inscricao_idinscricao` ASC) VISIBLE,
  CONSTRAINT `fk_inscricao coletiva_escola`
    FOREIGN KEY (`escola_idescola`)
    REFERENCES `les`.`escola` (`idescola`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inscricao coletiva_inscricao`
    FOREIGN KEY (`inscricao_idinscricao`)
    REFERENCES `les`.`inscricao` (`idinscricao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inscricao coletiva_Participante`
    FOREIGN KEY (`Participante_Utilizador_idutilizador`)
    REFERENCES `les`.`participante` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`inscricao individual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`inscricao individual` (
  `nracompanhades` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `Participante_Utilizador_idutilizador` INT NOT NULL,
  `inscricao_idinscricao` INT NOT NULL,
  PRIMARY KEY (`inscricao_idinscricao`),
  INDEX `fk_inscricao individual_Participante_id` (`Participante_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_inscricao individual_inscricao_id` (`inscricao_idinscricao` ASC) VISIBLE,
  CONSTRAINT `fk_inscricao individual_inscricao`
    FOREIGN KEY (`inscricao_idinscricao`)
    REFERENCES `les`.`inscricao` (`idinscricao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inscricao individual_Participante`
    FOREIGN KEY (`Participante_Utilizador_idutilizador`)
    REFERENCES `les`.`participante` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`menu` (
  `idMenu` INT NOT NULL AUTO_INCREMENT,
  `precoAluno` FLOAT NOT NULL,
  `PrecoProfessor` FLOAT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `menu` VARCHAR(45) NOT NULL,
  `Administrador_Utilizador_idutilizador` INT NOT NULL,
  `Campus_idCampus` INT NOT NULL,
  `Horario_idhorario` DATETIME(6) NOT NULL,
  PRIMARY KEY (`idMenu`),
  INDEX `fk_Menu_Administrador_id` (`Administrador_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_Menu_Campus_id` (`Campus_idCampus` ASC) VISIBLE,
  INDEX `fk_Menu_Horario_id` (`Horario_idhorario` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Administrador`
    FOREIGN KEY (`Administrador_Utilizador_idutilizador`)
    REFERENCES `les`.`administrador` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Menu_Campus`
    FOREIGN KEY (`Campus_idCampus`)
    REFERENCES `les`.`campus` (`idCampus`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Menu_Horario`
    FOREIGN KEY (`Horario_idhorario`)
    REFERENCES `les`.`horario` (`horainicio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`prato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`prato` (
  `idPrato` INT NOT NULL AUTO_INCREMENT,
  `nralomocosdisponiveis` INT NOT NULL,
  `descricao` VARCHAR(125) NOT NULL,
  `Menu_idMenu` INT NOT NULL,
  PRIMARY KEY (`idPrato`),
  INDEX `fk_Prato_Menu_id` (`Menu_idMenu` ASC) VISIBLE,
  CONSTRAINT `fk_Prato_Menu`
    FOREIGN KEY (`Menu_idMenu`)
    REFERENCES `les`.`menu` (`idMenu`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`inscricao_has_prato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`inscricao_has_prato` (
  `inscricao_idinscricao` INT NOT NULL,
  `Prato_idPrato` INT NOT NULL,
  PRIMARY KEY (`inscricao_idinscricao`, `Prato_idPrato`),
  INDEX `fk_inscricao_has_Prato_Prato_id` (`Prato_idPrato` ASC) VISIBLE,
  INDEX `fk_inscricao_has_Prato_inscricao_id` (`inscricao_idinscricao` ASC) VISIBLE,
  CONSTRAINT `fk_inscricao_has_Prato_inscricao`
    FOREIGN KEY (`inscricao_idinscricao`)
    REFERENCES `les`.`inscricao` (`idinscricao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inscricao_has_Prato_Prato`
    FOREIGN KEY (`Prato_idPrato`)
    REFERENCES `les`.`prato` (`idPrato`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`sessao` (
  `idsessao` INT NOT NULL AUTO_INCREMENT,
  `nrinscritos` INT NOT NULL,
  `vagas` INT NOT NULL,
  `Atividade_idAtividade` INT NOT NULL,
  `Horario_horainicio` DATETIME(6) NOT NULL,
  PRIMARY KEY (`idsessao`),
  INDEX `fk_sessao_Atividade_id` (`Atividade_idAtividade` ASC) VISIBLE,
  INDEX `fk_sessao_Horario_id` (`Horario_horainicio` ASC) VISIBLE,
  CONSTRAINT `fk_sessao_Atividade`
    FOREIGN KEY (`Atividade_idAtividade`)
    REFERENCES `les`.`atividade` (`idAtividade`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sessao_Horario`
    FOREIGN KEY (`Horario_horainicio`)
    REFERENCES `les`.`horario` (`horainicio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`inscricao_has_sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`inscricao_has_sessao` (
  `inscricao_idinscricao` INT NOT NULL,
  `sessao_idsessao` INT NOT NULL,
  PRIMARY KEY (`inscricao_idinscricao`, `sessao_idsessao`),
  INDEX `fk_inscricao_has_sessao_sessao_id` (`sessao_idsessao` ASC) VISIBLE,
  INDEX `fk_inscricao_has_sessao_inscricao_id` (`inscricao_idinscricao` ASC) VISIBLE,
  CONSTRAINT `fk_inscricao_has_sessao_inscricao`
    FOREIGN KEY (`inscricao_idinscricao`)
    REFERENCES `les`.`inscricao` (`idinscricao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inscricao_has_sessao_sessao`
    FOREIGN KEY (`sessao_idsessao`)
    REFERENCES `les`.`sessao` (`idsessao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`notificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`notificacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `criadoem` DATETIME(6) NOT NULL,
  `idutilizadorenvia` INT NOT NULL,
  `utilizadorrecebe` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`sala` (
  `edificio` VARCHAR(45) NOT NULL,
  `andar` VARCHAR(45) NOT NULL,
  `gabinete` VARCHAR(45) NULL DEFAULT NULL,
  `espaco_idespaco` INT NOT NULL,
  PRIMARY KEY (`espaco_idespaco`),
  INDEX `fk_sala_espaco_id` (`espaco_idespaco` ASC) VISIBLE,
  CONSTRAINT `fk_sala_espaco`
    FOREIGN KEY (`espaco_idespaco`)
    REFERENCES `les`.`espaco` (`idespaco`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
  `Horario_horainicio` DATETIME(6) NOT NULL,
  PRIMARY KEY (`idtarefa`),
  INDEX `fk_tarefa_Coordenador_id` (`Coordenador_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_tarefa_colaborador_id` (`colaborador_Utilizador_idutilizador` ASC) VISIBLE,
  INDEX `fk_tarefa_Atividade_id` (`Atividade_idAtividade` ASC) VISIBLE,
  INDEX `fk_tarefa_Horario_id` (`Horario_horainicio` ASC) VISIBLE,
  CONSTRAINT `fk_tarefa_Atividade`
    FOREIGN KEY (`Atividade_idAtividade`)
    REFERENCES `les`.`atividade` (`idAtividade`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tarefa_colaborador`
    FOREIGN KEY (`colaborador_Utilizador_idutilizador`)
    REFERENCES `les`.`colaborador` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tarefa_Coordenador`
    FOREIGN KEY (`Coordenador_Utilizador_idutilizador`)
    REFERENCES `les`.`coordenador` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tarefa_Horario`
    FOREIGN KEY (`Horario_horainicio`)
    REFERENCES `les`.`horario` (`horainicio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`transporte` (
  `idtransporte` INT NOT NULL AUTO_INCREMENT,
  `capacidade` INT NOT NULL,
  `Administrador_Utilizador_idutilizador` INT NOT NULL,
  `identificacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtransporte`),
  INDEX `fk_transporte_Administrador_idx` (`Administrador_Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_transporte_Administrador`
    FOREIGN KEY (`Administrador_Utilizador_idutilizador`)
    REFERENCES `les`.`administrador` (`Utilizador_idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`transporte universitario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`transporte universitario` (
  `capacidade` INT NOT NULL,
  `transporte_idtransporte` INT NOT NULL,
  PRIMARY KEY (`transporte_idtransporte`),
  CONSTRAINT `fk_transporte Universitario_transporte`
    FOREIGN KEY (`transporte_idtransporte`)
    REFERENCES `les`.`transporte` (`idtransporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`transporte_has_horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`transporte_has_horario` (
  `transporte_idtransporte` INT NOT NULL,
  `Horario_horainicio` DATETIME(6) NOT NULL,
  PRIMARY KEY (`transporte_idtransporte`, `Horario_horainicio`),
  INDEX `fk_transporte_has_Horario_Horario_id` (`Horario_horainicio` ASC) VISIBLE,
  INDEX `fk_transporte_has_Horario_transporte_id` (`transporte_idtransporte` ASC) VISIBLE,
  CONSTRAINT `fk_transporte_has_Horario_Horario`
    FOREIGN KEY (`Horario_horainicio`)
    REFERENCES `les`.`horario` (`horainicio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_transporte_has_Horario_transporte`
    FOREIGN KEY (`transporte_idtransporte`)
    REFERENCES `les`.`transporte` (`idtransporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`transporte_has_inscricao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`transporte_has_inscricao` (
  `transporte_idtransporte` INT NOT NULL,
  `inscricao_idinscricao` INT NOT NULL,
  PRIMARY KEY (`transporte_idtransporte`, `inscricao_idinscricao`),
  INDEX `fk_transporte_has_inscricao_inscricao_id` (`inscricao_idinscricao` ASC) VISIBLE,
  INDEX `fk_transporte_has_inscricao_transporte_id` (`transporte_idtransporte` ASC) VISIBLE,
  CONSTRAINT `fk_transporte_has_inscricao_inscricao`
    FOREIGN KEY (`inscricao_idinscricao`)
    REFERENCES `les`.`inscricao` (`idinscricao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_transporte_has_inscricao_transporte`
    FOREIGN KEY (`transporte_idtransporte`)
    REFERENCES `les`.`transporte` (`idtransporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`transporte_pessoal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`transporte_pessoal` (
  `transporte_idtransporte` INT NOT NULL,
  PRIMARY KEY (`transporte_idtransporte`),
  CONSTRAINT `fk_Transporte Pessoal_transporte`
    FOREIGN KEY (`transporte_idtransporte`)
    REFERENCES `les`.`transporte` (`idtransporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `les`.`utilizador_has_notificacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `les`.`utilizador_has_notificacao` (
  `Utilizador_idutilizador` INT NOT NULL,
  `notificacao_id` INT NOT NULL,
  PRIMARY KEY (`Utilizador_idutilizador`, `notificacao_id`),
  INDEX `fk_Utilizador_has_notificacao_notificacao_id` (`notificacao_id` ASC) VISIBLE,
  INDEX `fk_Utilizador_has_notificacao_Utilizador_id` (`Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_Utilizador_has_notificacao_notificacao`
    FOREIGN KEY (`notificacao_id`)
    REFERENCES `les`.`notificacao` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Utilizador_has_notificacao_Utilizador`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `les`.`utilizador` (`idutilizador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
