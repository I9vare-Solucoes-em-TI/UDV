unit Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

  procedure CriarCadastrosGerais(vpTabela, vpCaption : String; vpTexto, vpSistema : Boolean; FormModal : Boolean = false);
  function ValidarPermissao(vpRotina : String) : String;

  {Cadastros}
  procedure CadConfig;
  procedure CadUsuarioGrupo(FormModal : Boolean = false);
  procedure CadUsuario(FormModal : Boolean = false);
  procedure CadConfigRelatorio;
  procedure CadGrupoRelatorio;
  procedure CadAuditoria;
  procedure CadBackup(FormModal : Boolean = false);
  procedure CadRestaurar(FormModal : Boolean = false);
  procedure CadCaixaFinanceiro(FormModal : Boolean = false);
  procedure CadBalanceteGrupo(FormModal : Boolean = false);
  procedure CadCentroCustoForm(FormModal : Boolean = false);
  procedure CadGrupoContabil(FormModal : Boolean = false);
  procedure CadastroPlanoContas(FormModal : Boolean = false);
  procedure CadPrevisao;
  procedure CadPessoaFuncao(FormModal : Boolean = false);
  procedure CadPessoa(FormModal : Boolean = false);
  procedure CadLivroCaixa;
  procedure CadAgendamento;
  procedure CadFinanceiro;
  procedure CadSaldoDetalhado;
  procedure CadDesktop;
  procedure CadTransferencia(FormModal : Boolean = false);
  procedure CadMarcacaoTipo(FormModal : Boolean = false);
  procedure CadGerenciaBoletoERemessa;
  procedure CadContaBancaria(FormModal : Boolean = false);
  procedure CadCedente(FormModal : Boolean = False);
  procedure CadConfigEmail(FormModal : Boolean = False);
  procedure CadOrcamento(FormModal : Boolean = False);
  procedure CadReservaCadastro(FormModal : Boolean = false);
  procedure CadTipoModalidade(FormModal : Boolean = false);
  procedure CadConciliacaoBancaria;
  procedure CadEmailPadrao(FormModal: Boolean = False);

implementation

uses CadastroBasicoGeral, Rotinas, Config, Usuario,
     ConfigRelatorios, GrupoRelatorios, Controles, Auditoria,
  CadBalanceteGrupo, CadCentroCusto, CadGrupoContabil,
  CadPlanoContas, Previsao, CadPessoaFuncao, Pessoa,
  LivroCaixa, Agendamento, CadastroRapidoTransferencia, Desktop, SaldoDetalhado,
  CaixaFinanceiro, MarcacaoTipo, GerenciaBoletoERemessa, CadContaBancaria, CadCedente, CadEnvioEmailFinanceiro,
  CadastroRapidoOrcamento, CadReservaCadastro, CadModalidade,
  ConciliacaoBancaria, CadEmailTextoPadraoFin;  // CaixaFinanceiro;

{Monta o cadastro conforme os dados passados pelos parâmetros. Este procedimento
só deve ser usado para os cadastro que possuem até 4 campos sendo esse :
Chave, Descrição, Texto e Situação}
procedure CriarCadastrosGerais(vpTabela, vpCaption : String; vpTexto, vpSistema : Boolean; FormModal : Boolean = false);
begin
  with Application do
  begin
    if frmCadastroBasicoGeral <> nil then
       frmCadastroBasicoGeral.ExecuteFecharExecute(nil);
    vgDadosCadastroGeral.Tabela  := vpTabela;
    vgDadosCadastroGeral.Chave   := copy(vpTabela, 3, length(vpTabela)) + '_ID';
    vgDadosCadastroGeral.Texto   := vpTexto;
    vgDadosCadastroGeral.Caption := vpCaption;
    vgDadosCadastroGeral.Sistema := vpSistema;
    ExibirFormulario(TfrmCadastroBasicoGeral, frmCadastroBasicoGeral, FormModal);
  end;
end;

procedure CadEmailPadrao(FormModal: Boolean = False);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_EMAIL_PADRAO');
  ExibirFormulario(TfrmCademailTextoPadraoFin, frmCademailTextoPadraoFin, FormModal);
end;

function ValidarPermissao(vpRotina : String) : String;
begin
  Result := dtmControles.CodPermissao(vpRotina);;
  if Result = '000000' then
  begin
    Application.MessageBox('Usuário não tem permissão de acessar esta rotina!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
end;


{******************************Montar Cadastros********************************}

{Montar cadastro de Configuração do sistema}
procedure CadConfig;
begin
  vgPermissaoRotina := ValidarPermissao('CAD_CONFIGSIS');
  ExibirFormulario(TfrmConfig, frmConfig);
end;

{Montar cadastro de Grupo de Usuário}
procedure CadUsuarioGrupo(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_GRUPOUSUARIO');
  CriarCadastrosGerais('G_USUARIO_GRUPO', 'Grupo de Usuários' , False, False, FormModal);
end;

{Montar cadastro de Usuário}
procedure CadUsuario(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_USUARIO');
  ExibirFormulario(TfrmUsuario, frmUsuario, FormModal);
end;

{Montar config. relatórios}
procedure CadConfigRelatorio;
begin
  ExibirFormulario(TfrmConfigRelatorios, frmConfigRelatorios);
end;

{Montar grupo relatórios}
procedure CadGrupoRelatorio;
begin
  ExibirFormulario(TfrmGrupoRelatorio, frmGrupoRelatorio);
end;

procedure CadAuditoria;
begin
  vgPermissaoRotina := ValidarPermissao('CAD_AUDITORIA');
  ExibirFormulario(TfrmAuditoria, frmAuditoria);
end;

procedure CadBackup(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_BACKUP');
//  ExibirFormulario(TfrmBackupRestaura, frmBackupRestaura, FormModal);
end;

procedure CadRestaurar(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_RESTAURAR');
//  ExibirFormulario(TfrmBackupRestaura, frmBackupRestaura, FormModal);
end;

procedure CadCaixaFinanceiro(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_CAIXA_FINANCEIRO');
  ExibirFormulario(TfrmCaixaFinanceiro, frmCaixaFinanceiro, FormModal);
end;

procedure CadBalanceteGrupo(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_BALANCETE_GRUPO');
  ExibirFormulario(TfrmCadGrupoBalancete, frmCadGrupoBalancete, FormModal);
end;

procedure CadCentroCustoForm(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_CENTRO_CUSTOS');
  ExibirFormulario(TfrmCadCentroCusto, frmCadCentroCusto, FormModal);
end;

procedure CadGrupoContabil(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_GRUPO_CONTABIL');
  ExibirFormulario(TfrmCadGrupoContabil, frmCadGrupoContabil, FormModal);
end;

procedure CadastroPlanoContas(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_PLANO_CONTA');
  ExibirFormulario(TfrmCadPlanoContas, frmCadPlanoContas, FormModal);
end;

procedure CadPrevisao;
begin
  vgPermissaoRotina := ValidarPermissao('CAD_PREVISAO');
  ExibirFormulario(TfrmPrevisao, frmPrevisao);
end;

procedure CadPessoaFuncao(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_PESSOA_FUNCAO');
  ExibirFormulario(TfrmCadPessoaFuncao, frmCadPessoaFuncao, FormModal);
end;

procedure CadPessoa(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_PESSOA');
  ExibirFormulario(TfrmCadPessoa, frmCadPessoa, FormModal);
end;

procedure CadLivroCaixa;
begin
  vgPermissaoRotina := ValidarPermissao('CAD_LIVRO_CAIXA');
  ExibirFormulario(TfrmLivroCaixa, frmLivroCaixa);
end;

procedure CadAgendamento;
begin
  vgPermissaoRotina := ValidarPermissao('CAD_AGENDAMENTO');
  ExibirFormulario(TfrmAgendamento, frmAgendamento);
end;

procedure CadFinanceiro;
begin
  vgPermissaoRotina := ValidarPermissao('CAD_FINANCEIRO');
  vgTipoForm := '3';
  ExibirFormulario(TfrmPrevisao, frmPrevisao);
end;

procedure CadTransferencia(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_TRANSFERENCIA');
  ExibirFormulario(TfrmCadastroRapidoTransferencia, frmCadastroRapidoTransferencia, FormModal);
end;

procedure CadSaldoDetalhado;
begin
  vgPermissaoRotina := ValidarPermissao('CAD_SALDO_DETALHADO');
  ExibirFormulario(TfrmSaldoDetalhado, frmSaldoDetalhado);
end;

procedure CadDesktop;
begin
  ExibirFormulario(TfrmDesktop, frmDesktop);
end;

procedure CadMarcacaoTipo(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_MARCACAO_TIPO');
  ExibirFormulario(TfrmMarcacaoTipo, frmMarcacaoTipo, FormModal);
end;

procedure CadGerenciaBoletoERemessa;
begin
  vgPermissaoRotina := ValidarPermissao('CAD_GERENCIA_BOLETO_REMESSA');
  ExibirFormulario(TfrmGerenciaBoletoRemessa, frmGerenciaBoletoRemessa);
end;

procedure CadContaBancaria(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_CONTA_BANCARIA');
  ExibirFormulario(TfrmCadContaBancaria, frmCadContaBancaria, FormModal);
end;

procedure CadCedente(FormModal : Boolean = False);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_CEDENTE');
  ExibirFormulario(TfrmCadCedente, frmCadCedente, FormModal);
end;

procedure CadConfigEmail(FormModal : Boolean = False);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_CONFIG_EMAIL');
  ExibirFormulario(TfrmCadEnvioEmailFinanceiro, frmCadEnvioEmailFinanceiro, FormModal);
end;

procedure CadOrcamento(FormModal : Boolean = False);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_ORCAMENTO');
  ExibirFormulario(TfrmCadastroRapidoOrcamento, frmCadastroRapidoOrcamento, FormModal);
end;

procedure CadReservaCadastro(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_RESERVA_CADASTRO');
  ExibirFormulario(TfrmCadReservaCadastro, frmCadReservaCadastro, FormModal);
end;

procedure CadTipoModalidade(FormModal : Boolean = false);
begin
  vgPermissaoRotina := ValidarPermissao('CAD_TIPO_MODALIDADE');
  ExibirFormulario(TfrmCadModalidade, frmCadModalidade, FormModal);
end;

procedure CadConciliacaoBancaria;
begin
  vgPermissaoRotina := ValidarPermissao('CAD_CONCILIACAO_BANCARIA');
  ExibirFormulario(TfrmConciliacaoBancaria, frmConciliacaoBancaria);
end;


end.

