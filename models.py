# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Administrador(models.Model):
    utilizador_idutilizador = models.OneToOneField('Utilizador', models.DO_NOTHING, db_column='Utilizador_idutilizador',
                                                   primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'administrador'


class Anfiteatro(models.Model):
    idespaco = models.IntegerField(primary_key=True)
    edificio = models.CharField(max_length=45, blank=True, null=True)
    andar = models.CharField(max_length=45, blank=True, null=True)
    espaco_idespaco = models.ForeignKey('Espaco', models.DO_NOTHING, db_column='espaco_idespaco')

    class Meta:
        managed = False
        db_table = 'anfiteatro'
        unique_together = (('idespaco', 'espaco_idespaco'),)


class Arlivre(models.Model):
    idespaco = models.IntegerField(primary_key=True)
    descricao = models.CharField(max_length=45, blank=True, null=True)
    espaco_idespaco = models.ForeignKey('Espaco', models.DO_NOTHING, db_column='espaco_idespaco')

    class Meta:
        managed = False
        db_table = 'arlivre'
        unique_together = (('idespaco', 'espaco_idespaco'),)


class Atividade(models.Model):
    idatividade = models.IntegerField(db_column='idAtividade', primary_key=True)  # Field name made lowercase.
    capacidade = models.IntegerField(blank=True, null=True)
    duracao = models.FloatField(blank=True, null=True)
    professor_universitario_utilizador_idutilizador = models.ForeignKey('ProfessorUniversitario', models.DO_NOTHING,
                                                                        db_column='Professor Universitario_Utilizador_idutilizador')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    unidade_organica_iduo = models.ForeignKey('UnidadeOrganica', models.DO_NOTHING,
                                              db_column='unidade Organica_idUO')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    departamento_iddepartamento = models.ForeignKey('Departamento', models.DO_NOTHING,
                                                    db_column='Departamento_idDepartamento')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'atividade'


class AtividadeHasMaterial(models.Model):
    atividade_idatividade = models.OneToOneField(Atividade, models.DO_NOTHING, db_column='Atividade_idAtividade',
                                                 primary_key=True)  # Field name made lowercase.
    material_idmaterial = models.ForeignKey('Material', models.DO_NOTHING,
                                            db_column='Material_idMaterial')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'atividade_has_material'
        unique_together = (('atividade_idatividade', 'material_idmaterial'),)


class AtividadeHasSessao(models.Model):
    atividade_idatividade = models.OneToOneField(Atividade, models.DO_NOTHING, db_column='Atividade_idAtividade',
                                                 primary_key=True)  # Field name made lowercase.
    sessao_idsessao = models.ForeignKey('Sessao', models.DO_NOTHING, db_column='sessao_idsessao')

    class Meta:
        managed = False
        db_table = 'atividade_has_sessao'
        unique_together = (('atividade_idatividade', 'sessao_idsessao'),)


class Campus(models.Model):
    idcampus = models.IntegerField(db_column='idCampus', primary_key=True)  # Field name made lowercase.
    unidade_organica_iduo = models.ForeignKey('UnidadeOrganica', models.DO_NOTHING,
                                              db_column='unidade Organica_idUO')  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'campus'


class Colaborador(models.Model):
    curso = models.CharField(max_length=45, blank=True, null=True)
    preferencia = models.CharField(max_length=45, blank=True, null=True)
    utilizador_idutilizador = models.OneToOneField('Utilizador', models.DO_NOTHING, db_column='Utilizador_idutilizador',
                                                   primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'colaborador'


class ColaboradorHasHorario(models.Model):
    colaborador_utilizador_idutilizador = models.OneToOneField(Colaborador, models.DO_NOTHING,
                                                               db_column='colaborador_Utilizador_idutilizador',
                                                               primary_key=True)  # Field name made lowercase.
    horario_transporte_idtransporte = models.ForeignKey('Horario', models.DO_NOTHING,
                                                        db_column='Horario_transporte_idtransporte',
                                                        related_name='+')  # Field name made lowercase.
    horario_colaborador_utilizador_idutilizador = models.ForeignKey('Horario', models.DO_NOTHING,
                                                                    db_column='Horario_colaborador_Utilizador_idutilizador',
                                                                    related_name='+')  # Field name made lowercase.
    horario_menu_idmenu = models.ForeignKey('Horario', models.DO_NOTHING,
                                            db_column='Horario_Menu_idMenu')  # Field name made lowercase.
    horario_sessao_idsessao = models.ForeignKey('Horario', models.DO_NOTHING, db_column='Horario_sessao_idsessao',
                                                related_name='+')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'colaborador_has_horario'
        unique_together = (('colaborador_utilizador_idutilizador', 'horario_transporte_idtransporte',
                            'horario_colaborador_utilizador_idutilizador', 'horario_menu_idmenu',
                            'horario_sessao_idsessao'),)


class ColaboradorHasUnidadeOrganica(models.Model):
    colaborador_utilizador_idutilizador = models.OneToOneField(Colaborador, models.DO_NOTHING,
                                                               db_column='colaborador_Utilizador_idutilizador',
                                                               primary_key=True)  # Field name made lowercase.
    unidade_organica_iduo = models.ForeignKey('UnidadeOrganica', models.DO_NOTHING,
                                              db_column='unidade Organica_idUO')  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'colaborador_has_unidade organica'
        unique_together = (('colaborador_utilizador_idutilizador', 'unidade_organica_iduo'),)


class Coordenador(models.Model):
    utilizador_idutilizador = models.OneToOneField('Utilizador', models.DO_NOTHING, db_column='Utilizador_idutilizador',
                                                   primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'coordenador'


class CoordenadorHasDepartamento(models.Model):
    coordenador_utilizador_idutilizador = models.OneToOneField(Coordenador, models.DO_NOTHING,
                                                               db_column='Coordenador_Utilizador_idutilizador',
                                                               primary_key=True,
                                                               related_name='+')  # Field name made lowercase.
    departamento_iddepartamento = models.ForeignKey('Departamento', models.DO_NOTHING,
                                                    db_column='Departamento_idDepartamento')  # Field name made lowercase.
    departamento_unidade_organica_iduo = models.ForeignKey('Departamento', models.DO_NOTHING,
                                                           db_column='Departamento_unidade Organica_idUO',
                                                           related_name='+')  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'coordenador_has_departamento'
        unique_together = (
        ('coordenador_utilizador_idutilizador', 'departamento_iddepartamento', 'departamento_unidade_organica_iduo'),)


class Departamento(models.Model):
    iddepartamento = models.AutoField(db_column='idDepartamento', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(max_length=45)
    iduo = models.CharField(db_column='idUO', max_length=45)  # Field name made lowercase.
    unidade_organica_iduo = models.ForeignKey('UnidadeOrganica', models.DO_NOTHING,
                                              db_column='unidade Organica_idUO')  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'departamento'
        unique_together = (('iddepartamento', 'unidade_organica_iduo'),)


class DiaAberto(models.Model):
    ano = models.IntegerField(primary_key=True)
    descricao = models.CharField(max_length=45, blank=True, null=True)
    datainscricao = models.DateField(blank=True, null=True)
    emaildiaaberto = models.CharField(db_column='emailDiaAberto', max_length=45, blank=True,
                                      null=True)  # Field name made lowercase.
    enderecopaginaweb = models.CharField(db_column='enderecoPaginaWeb', max_length=45)  # Field name made lowercase.
    datadiainscricaoatividadesinicio = models.DateField(
        db_column='dataDiainscricaoAtividadesInicio')  # Field name made lowercase.
    datadiaabertoinicio = models.DateField(db_column='dataDiaAbertoInicio')  # Field name made lowercase.
    datainscricaoatividadesfim = models.DateField(db_column='dataInscricaoAtividadesfim')  # Field name made lowercase.
    datadiaabertofim = models.DateField(db_column='dataDiaAbertofim')  # Field name made lowercase.
    datapropostaatividadeinicio = models.DateField(
        db_column='dataPropostaAtividadeInicio')  # Field name made lowercase.
    datapropostaatividadesfim = models.DateField(db_column='dataPropostaAtividadesFim')  # Field name made lowercase.
    dia_abertocol = models.CharField(db_column='Dia Abertocol',
                                     max_length=45)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    utilizador_idutilizador = models.ForeignKey('Utilizador', models.DO_NOTHING,
                                                db_column='Utilizador_idutilizador')  # Field name made lowercase.
    administrador_utilizador_idutilizador = models.ForeignKey(Administrador, models.DO_NOTHING,
                                                              db_column='Administrador_Utilizador_idutilizador')  # Field name made lowercase.
    colaborador_utilizador_idutilizador = models.ForeignKey(Colaborador, models.DO_NOTHING,
                                                            db_column='colaborador_Utilizador_idutilizador')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'dia aberto'


class Escola(models.Model):
    idescola = models.IntegerField(primary_key=True)
    nome = models.CharField(max_length=45)
    local = models.CharField(max_length=45)
    telefone = models.CharField(max_length=45)
    email = models.CharField(max_length=45, blank=True, null=True)
    inscricao_coletiva_idinscricao = models.ForeignKey('InscricaoColetiva', models.DO_NOTHING,
                                                       db_column='inscricao coletiva_idinscricao')  # Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'escola'


class Espaco(models.Model):
    idespaco = models.IntegerField(primary_key=True)
    nome = models.CharField(max_length=45)
    sessao_idsessao = models.ForeignKey('Sessao', models.DO_NOTHING, db_column='sessao_idsessao')

    class Meta:
        managed = False
        db_table = 'espaco'


class Horario(models.Model):
    inicio = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'horario'


class Idioma(models.Model):
    nome = models.CharField(primary_key=True, max_length=24)
    sigla = models.CharField(unique=True, max_length=45)
    administrador_utilizador_idutilizador = models.ForeignKey(Administrador, models.DO_NOTHING,
                                                              db_column='Administrador_Utilizador_idutilizador')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'idioma'


class Inscricao(models.Model):
    idinscricao = models.AutoField(primary_key=True)
    ano = models.TextField(blank=True, null=True)  # This field type is a guess.
    local = models.CharField(max_length=45, blank=True, null=True)
    areacientifica = models.CharField(max_length=45, blank=True, null=True)
    atividade_idatividade = models.ForeignKey(Atividade, models.DO_NOTHING,
                                              db_column='Atividade_idAtividade')  # Field name made lowercase.
    inscricao_individual_idinscricao = models.ForeignKey('InscricaoIndividual', models.DO_NOTHING,
                                                         db_column='inscricao individual_idinscricao')  # Field renamed to remove unsuitable characters.
    inscricao_coletiva_idinscricao = models.ForeignKey('InscricaoColetiva', models.DO_NOTHING,
                                                       db_column='inscricao coletiva_idinscricao')  # Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'inscricao'
        unique_together = (('idinscricao', 'inscricao_individual_idinscricao', 'inscricao_coletiva_idinscricao'),)


class InscricaoColetiva(models.Model):
    idinscricao = models.IntegerField(primary_key=True)
    nresponsaveis = models.IntegerField(blank=True, null=True)
    turma = models.CharField(max_length=1, blank=True, null=True)
    participante_utilizador_idutilizador = models.ForeignKey('Participante', models.DO_NOTHING,
                                                             db_column='Participante_Utilizador_idutilizador')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'inscricao coletiva'


class InscricaoIndividual(models.Model):
    idinscricao = models.IntegerField(primary_key=True)
    nracompanhades = models.IntegerField()
    participante_utilizador_idutilizador = models.ForeignKey('Participante', models.DO_NOTHING,
                                                             db_column='Participante_Utilizador_idutilizador')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'inscricao individual'


class InscricaoHasPrato(models.Model):
    inscricao_idinscricao = models.OneToOneField(Inscricao, models.DO_NOTHING, db_column='inscricao_idinscricao',
                                                 primary_key=True)
    prato_idprato = models.ForeignKey('Prato', models.DO_NOTHING,
                                      db_column='Prato_idPrato')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'inscricao_has_prato'
        unique_together = (('inscricao_idinscricao', 'prato_idprato'),)


class Material(models.Model):
    idmaterial = models.IntegerField(db_column='idMaterial', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'material'


class Menu(models.Model):
    idmenu = models.IntegerField(db_column='idMenu', primary_key=True)  # Field name made lowercase.
    precoaluno = models.FloatField(db_column='precoAluno')  # Field name made lowercase.
    precoprofessor = models.FloatField(db_column='PrecoProfessor')  # Field name made lowercase.
    tipo = models.CharField(max_length=45)
    menu = models.CharField(max_length=45, blank=True, null=True)
    administrador_utilizador_idutilizador = models.ForeignKey(Administrador, models.DO_NOTHING,
                                                              db_column='Administrador_Utilizador_idutilizador')  # Field name made lowercase.
    campus_idcampus = models.ForeignKey(Campus, models.DO_NOTHING,
                                        db_column='Campus_idCampus')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'menu'


class MenuHasHorario(models.Model):
    menu_idmenu = models.OneToOneField(Menu, models.DO_NOTHING, db_column='Menu_idMenu',
                                       primary_key=True)  # Field name made lowercase.
    horario_transporte_idtransporte = models.ForeignKey(Horario, models.DO_NOTHING,
                                                        db_column='Horario_transporte_idtransporte',
                                                        related_name='+')  # Field name made lowercase.
    horario_colaborador_utilizador_idutilizador = models.ForeignKey(Horario, models.DO_NOTHING,
                                                                    db_column='Horario_colaborador_Utilizador_idutilizador')  # Field name made lowercase.
    horario_menu_idmenu = models.ForeignKey(Horario, models.DO_NOTHING, db_column='Horario_Menu_idMenu',
                                            related_name='+')  # Field name made lowercase.
    horario_sessao_idsessao = models.ForeignKey(Horario, models.DO_NOTHING, db_column='Horario_sessao_idsessao',
                                                related_name='+')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'menu_has_horario'
        unique_together = (('menu_idmenu', 'horario_transporte_idtransporte',
                            'horario_colaborador_utilizador_idutilizador', 'horario_menu_idmenu',
                            'horario_sessao_idsessao'),)


class Notificacao(models.Model):
    id = models.IntegerField(primary_key=True)
    descricao = models.CharField(max_length=45, blank=True, null=True)
    criadoem = models.CharField(max_length=45, blank=True, null=True)
    iduser = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'notificacao'


class Participante(models.Model):
    utilizador_idutilizador = models.OneToOneField('Utilizador', models.DO_NOTHING, db_column='Utilizador_idutilizador',
                                                   primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'participante'


class Prato(models.Model):
    idprato = models.IntegerField(db_column='idPrato', primary_key=True)  # Field name made lowercase.
    nralomocosdisponiveis = models.IntegerField()
    prato = models.CharField(max_length=45)
    menu_idmenu = models.ForeignKey(Menu, models.DO_NOTHING, db_column='Menu_idMenu', blank=True,
                                    null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'prato'


class ProfessorUniversitario(models.Model):
    utilizador_idutilizador = models.OneToOneField('Utilizador', models.DO_NOTHING, db_column='Utilizador_idutilizador',
                                                   primary_key=True)  # Field name made lowercase.
    unidade_organica_iduo = models.ForeignKey('UnidadeOrganica', models.DO_NOTHING,
                                              db_column='unidade Organica_idUO')  # Field name made lowercase. Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'professor universitario'


class Sala(models.Model):
    idespaco = models.IntegerField(primary_key=True)
    edificio = models.CharField(max_length=45, blank=True, null=True)
    andar = models.CharField(max_length=45, blank=True, null=True)
    gabinete = models.CharField(max_length=45, blank=True, null=True)
    espaco_idespaco = models.ForeignKey(Espaco, models.DO_NOTHING, db_column='espaco_idespaco')

    class Meta:
        managed = False
        db_table = 'sala'
        unique_together = (('idespaco', 'espaco_idespaco'),)


class Sessao(models.Model):
    idsessao = models.IntegerField(primary_key=True)
    horario = models.DateTimeField()
    nrinscritos = models.IntegerField()
    vagas = models.IntegerField()
    atividade_idatividade = models.ForeignKey(Atividade, models.DO_NOTHING, db_column='Atividade_idAtividade',
                                              related_name='+')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'sessao'


class Tarefa(models.Model):
    idtarefa = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=45)
    concluida = models.IntegerField()
    coordenador_utilizador_idutilizador = models.ForeignKey(Coordenador, models.DO_NOTHING,
                                                            db_column='Coordenador_Utilizador_idutilizador')  # Field name made lowercase.
    colaborador_utilizador_idutilizador = models.ForeignKey(Colaborador, models.DO_NOTHING,
                                                            db_column='colaborador_Utilizador_idutilizador')  # Field name made lowercase.
    atividade_idatividade = models.ForeignKey(Atividade, models.DO_NOTHING,
                                              db_column='Atividade_idAtividade')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tarefa'


class Transporte(models.Model):
    idtransporte = models.AutoField(primary_key=True)
    horariochegada = models.DateTimeField(unique=True, blank=True, null=True)
    capacidade = models.IntegerField()
    identificacao = models.CharField(max_length=45)
    administrador_utilizador_idutilizador1 = models.ForeignKey(Administrador, models.DO_NOTHING,
                                                               db_column='Administrador_Utilizador_idutilizador1',
                                                               blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'transporte'


class TransportePessoal(models.Model):
    transporte_idtransporte = models.OneToOneField(Transporte, models.DO_NOTHING, db_column='transporte_idtransporte',
                                                   primary_key=True)

    class Meta:
        managed = False
        db_table = 'transporte pessoal'


class TransporteUniversitario(models.Model):
    capacidade = models.IntegerField()
    transporte_idtransporte = models.OneToOneField(Transporte, models.DO_NOTHING, db_column='transporte_idtransporte',
                                                   primary_key=True)

    class Meta:
        managed = False
        db_table = 'transporte universitario'


class TransporteHasInscricao(models.Model):
    transporte_idtransporte = models.OneToOneField(Transporte, models.DO_NOTHING, db_column='transporte_idtransporte',
                                                   primary_key=True)
    inscricao_idinscricao = models.ForeignKey(Inscricao, models.DO_NOTHING, db_column='inscricao_idinscricao')

    class Meta:
        managed = False
        db_table = 'transporte_has_inscricao'
        unique_together = (('transporte_idtransporte', 'inscricao_idinscricao'),)


class UnidadeOrganica(models.Model):
    iduo = models.IntegerField(db_column='idUO', primary_key=True)  # Field name made lowercase.
    sigla = models.CharField(max_length=5)

    class Meta:
        managed = False
        db_table = 'unidade organica'


class Utilizador(models.Model):
    idutilizador = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=45)
    email = models.CharField(unique=True, max_length=45, blank=True, null=True)
    telefone = models.CharField(unique=True, max_length=45, blank=True, null=True)
    password = models.CharField(max_length=45, blank=True, null=True)
    username = models.CharField(db_column='userName', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'utilizador'


class UtilizadorHasNotificacao(models.Model):
    utilizador_idutilizador = models.OneToOneField(Utilizador, models.DO_NOTHING, db_column='Utilizador_idutilizador',
                                                   primary_key=True)  # Field name made lowercase.
    notificacao = models.ForeignKey(Notificacao, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'utilizador_has_notificacao'
        unique_together = (('utilizador_idutilizador', 'notificacao'),)
