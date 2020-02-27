CREATE TABLE IF NOT EXISTS `mydb`.`Dia Aberto` (
  `ano` INT NOT NULL,
  `descriçao` VARCHAR(45) NULL,
  `datainscriçao` DATE NULL,
  `emailDiaAberto` VARCHAR(45) NULL,
  `endereçoPaginaWeb` VARCHAR(45) NOT NULL,
  `dataDiainscriçaoAtividadesInicio` DATE NOT NULL,
  `dataDiaAbertoInicio` DATE NOT NULL,
  `dataInscriçaoAtividadesfim` DATE NOT NULL,
  `dataDiaAbertofim` DATE NOT NULL,
  `dataPropostaAtividadeInicio` DATE NOT NULL,
  `dataPropostaAtividadesFim` DATE NOT NULL,
  `Dia Abertocol` VARCHAR(45) NOT NULL,
  `Utilizador_idutilizador` INT NOT NULL,
  PRIMARY KEY (`ano`),
  INDEX `fk_Dia Aberto_Utilizador1_idx` (`Utilizador_idutilizador` ASC) VISIBLE,
  CONSTRAINT `fk_Dia Aberto_Utilizador1`
    FOREIGN KEY (`Utilizador_idutilizador`)
    REFERENCES `mydb`.`Utilizador` (`idutilizador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
