program I9vareTesouraria;

uses
  Forms,
  Windows,
  MidasLib,
  IniFiles,
  SysUtils,
  CadBasico in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\CadBasico.pas' {frmCadBasico},
  FrameEditorSimples in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\FrameEditorSimples.pas' {fmeEditorSimples: TFrame},
  VisualizaRelatorios in 'Source_Geral_Exclusivo\VisualizaRelatorios.pas' {frmVisualizaRelatorios},
  CadAuxiliar in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\CadAuxiliar.pas' {frmCadAuxiliar},
  Versao in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Versao.pas',
  AnimationThread in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\AnimationThread.pas',
  Atalhos in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Atalhos.pas' {frmAtalho},
  CadastroBasicoGeral in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\CadastroBasicoGeral.pas' {frmCadastroBasicoGeral},
  Config in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Config.pas' {frmConfig},
  ConfigRelatorios in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\ConfigRelatorios.pas' {frmConfigRelatorios},
  ControleVariaveis in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\ControleVariaveis.pas',
  DicionarioGramatical in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\DicionarioGramatical.pas' {frmDicionarioGramatical},
  EditorTexto in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\EditorTexto.pas' {frmEditorTexto},
  GrupoRelatorios in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\GrupoRelatorios.pas' {frmGrupoRelatorio},
  Login in 'Source_Tesouraria\Login.pas' {frmLogin},
  LoginAlteracao in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\LoginAlteracao.pas' {frmLoginAlteracao},
  MarcacaoAutomatica in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\MarcacaoAutomatica.pas' {frmMarcacaoAutomatica},
  MarcacaoTipo in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\MarcacaoTipo.pas' {frmMarcacaoTipo},
  MostrarImagem in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\MostrarImagem.pas' {frmMostrarImagem},
  PalavraGramatical in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\PalavraGramatical.pas' {frmPalavraGramatical},
  PermissaoGrupo in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\PermissaoGrupo.pas' {frmPermissaogrupo},
  PermissaoUsuario in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\PermissaoUsuario.pas' {frmPermissaousuario},
  PesquisaGeral in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\PesquisaGeral.pas' {frmPesquisa},
  PessoaPreCadastro in '..\..\Tri7_DBExpress\Projeto_Principal\Financeiro\trunk\Source_JuridicoFinanceiro\PessoaPreCadastro.pas' {frmPessoaPreCadastro},
  Relatorio in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Relatorio.pas' {frmRelatorio},
  Rotinas in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Rotinas.pas',
  TBPRN in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\TBPRN.pas',
  TextoModelo in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\TextoModelo.pas' {frmTextoModelo},
  TipoVinculoGramatical in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\TipoVinculoGramatical.pas' {frmTipoVinculoGramatical},
  ValoresDiversos in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\ValoresDiversos.pas' {frmValoresDiversos},
  CapturarBiometria in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\CapturarBiometria.pas' {frmCapturarBiometria},
  RotinasFingkey in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\RotinasFingkey.pas',
  CapturarBiometriaVerifica in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\CapturarBiometriaVerifica.pas' {frmCapturarBiometriaVerifica},
  MarcacaoTipoAtualizar in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\MarcacaoTipoAtualizar.pas' {frmMarcacaoTipoAtualizar},
  Atualizacao in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Atualizacao.pas' {frmAtualizacao},
  PessoaIgual in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\PessoaIgual.pas' {frmPessoaIgual},
  Controles in 'Source_Geral_Exclusivo\Controles.pas' {dtmControles: TDataModule},
  Cadastro in 'Source_Tesouraria\Cadastro.pas',
  Principal in 'Source_Tesouraria\Principal.pas' {frmPrincipal},
  CadCedente in 'Source_Tesouraria\CadCedente.pas' {frmCadCedente},
  CadBalanceteGrupo in 'Source_Tesouraria\CadBalanceteGrupo.pas' {frmCadGrupoBalancete},
  CadPlanoContas in 'Source_Tesouraria\CadPlanoContas.pas' {frmCadPlanoContas},
  MostrarCedente in 'Source_Tesouraria\MostrarCedente.pas' {frmAlterarCedente},
  PessoaUDV in 'Source_Tesouraria\PessoaUDV.pas' {frmCadPessoaUDV},
  FrameAssinaturaDigital in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\FrameAssinaturaDigital.pas' {fmeAssinaturaDigital: TFrame},
  PessoaPesquisa in 'Source_Tesouraria\PessoaPesquisa.pas' {frmPessoaPesquisa},
  Splash in 'Source_Tesouraria\Splash.pas' {frmSplash},
  CadGrupoFamiliar in 'Source_Tesouraria\CadGrupoFamiliar.pas' {frmCadGrupoFamiliar},
  CadCentroCusto in 'Source_Tesouraria\CadCentroCusto.pas' {frmCadCentroCusto},
  LancamentoAdiantado in 'Source_Tesouraria\LancamentoAdiantado.pas' {frmLancamentoAdiantado},
  GerenciadorCompromisso in 'Source_Tesouraria\GerenciadorCompromisso.pas' {frmGerenciadorCompromisso},
  FrameCompromisso in 'Source_Tesouraria\FrameCompromisso.pas' {fmeCompromisso: TFrame},
  Sincronizar in 'Source_Tesouraria\Sincronizar.pas' {frmSincronizar},
  CadReservaCadastro in 'Source_Tesouraria\CadReservaCadastro.pas' {frmCadReservaCadastro},
  SelecionarBoletoEnviar in 'Source_Tesouraria\SelecionarBoletoEnviar.pas' {frmSelecionarBoletoEnviar},
  GerenciadorRecebimento in 'Source_Tesouraria\GerenciadorRecebimento.pas' {frmGerenciadorRecebimento},
  CodigoBarras in 'Source_Boleta\CodigoBarras.pas',
  FuncAux in 'Source_Boleta\FuncAux.pas',
  CadEnvioEmail in 'Source_Tesouraria\CadEnvioEmail.pas' {frmCadEnvioEmail},
  SelecionarAssociado in 'Source_Tesouraria\SelecionarAssociado.pas' {frmSelecionarAssociado},
  VisualizaBoleto in 'Source_Tesouraria\VisualizaBoleto.pas' {frmVisualizaBoleto},
  NaoAssociado in 'Source_Tesouraria\NaoAssociado.pas' {frmNaoAssociado},
  ConfirmacaoRecibo in 'Source_Tesouraria\ConfirmacaoRecibo.pas' {frmConfirmacaoRecibo},
  GerenciadorSaidas in 'Source_Tesouraria\GerenciadorSaidas.pas' {frmGerenciadorSaidas},
  ControleBalancete in 'Source_Tesouraria\ControleBalancete.pas' {frmControleBalancete},
  TituloRelatorio in 'Source_Tesouraria\TituloRelatorio.pas' {frmTituloRelatorio},
  ReajustarValorCompromisso in 'Source_Tesouraria\ReajustarValorCompromisso.pas',
  ProgramacaoAjuste in 'Source_Tesouraria\ProgramacaoAjuste.pas',
  InputForm in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\InputForm.pas' {frmInputForm},
  Lookup in 'Source_Geral_Exclusivo\Lookup.pas' {dtmLookup: TDataModule},
  Pesquisa in 'Source_Geral_Exclusivo\Pesquisa.pas',
  ValidarPermissaoUsuario in 'Source_Geral_Exclusivo\ValidarPermissaoUsuario.pas' {frmValidarPermissaoUsuario},
  WPTAddict in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\WPTAddict.pas',
  Sobre in 'Source_Tesouraria\Sobre.pas' {frmSobre},
  Movimentacao in 'Source_Tesouraria\Movimentacao.pas' {frmMovimentacao},
  BackupRestaura in 'Source_Tesouraria\BackupRestaura.pas' {frmBackupRestaura},
  Usuario in 'Source_Tesouraria\Usuario.pas' {frmUsuario},
  UsuarioSistema in 'Source_Tesouraria\UsuarioSistema.pas' {frmUsuarioSistema},
  CharPrinter in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\CharPrinter.pas',
  AtualizacaoSistema in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\AtualizacaoSistema.pas',
  Conexao in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Conexao.pas',
  LookupBoleto in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\LookupBoleto.pas' {dtmLookupBoleto: TDataModule},
  LookupFinanceiro in 'Source_Financeiro\LookupFinanceiro.pas' {dtmLookupFinanceiro: TDataModule},
  TelaBranco in 'Source_Financeiro\TelaBranco.pas' {frmTelaBranco},
  Lookup_Contabil in 'Source_Financeiro\Lookup_Contabil.pas' {dtmLookupContabil: TDataModule},
  Lookup_Servico in 'Source_Financeiro\Lookup_Servico.pas' {dtmLookupServico: TDataModule},
  CadastroAuxSimplificado in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\CadastroAuxSimplificado.pas' {frmCadastroAuxSimplificado},
  CadastroRapidoContas in 'Source_Financeiro\CadastroRapidoContas.pas' {frmCadastroRapidoContas},
  Confirmacao in 'Source_Financeiro\Confirmacao.pas' {frmConfirmacao},
  Pessoa in 'Source_Financeiro\Pessoa.pas' {frmCadPessoa},
  SaldoDetalhado in 'Source_Financeiro\SaldoDetalhado.pas' {frmSaldoDetalhado},
  Agendamento in 'Source_Financeiro\Agendamento.pas' {frmAgendamento},
  Previsao in 'Source_Financeiro\Previsao.pas' {frmPrevisao},
  CadastroRapidoLancamento in 'Source_Financeiro\CadastroRapidoLancamento.pas' {frmCadastroRapidoLancamento},
  RegistroParcial in 'Source_Financeiro\RegistroParcial.pas' {frmCadastroRapidoRegistroParcial},
  CadastroRapidoTransfProvisao in 'Source_Financeiro\CadastroRapidoTransfProvisao.pas' {frmCadastroRapidoTransfProvisao},
  CaixaFinanceiro in 'Source_Financeiro\CaixaFinanceiro.pas' {frmCaixaFinanceiro},
  LivroCaixa in 'Source_Financeiro\LivroCaixa.pas' {frmLivroCaixa},
  frmPropDlg in 'Source_Financeiro\frmPropDlg.pas' {PropertiesDlg},
  PdfToTiff in 'Source_Financeiro\PdfToTiff.pas',
  CadastroRapidoalteraLIvroCaixa in 'Source_Financeiro\CadastroRapidoalteraLIvroCaixa.pas' {frmCadastroRapidoAlteraLivroCaixa},
  RelatorioFinanceiro in 'Source_Financeiro\RelatorioFinanceiro.pas' {frmCadRelatorioFinanceiro},
  GridVisualizacao in 'Source_Financeiro\GridVisualizacao.pas' {frmGridVisualizacao},
  CadGrupoContabil in 'Source_Tesouraria\CadGrupoContabil.pas' {frmCadGrupoContabil},
  CadastroRapidoOrcamento in 'Source_Financeiro\CadastroRapidoOrcamento.pas' {frmCadastroRapidoOrcamento},
  CadastroRapidoOrcTransf in 'Source_Financeiro\CadastroRapidoOrcTransf.pas' {frmCadastroRapidoOrcTransf},
  GerenciaBoletoERemessa in 'Source_Financeiro\GerenciaBoletoERemessa.pas' {frmGerenciaBoletoRemessa},
  EnviarBoletoPorEmail in 'Source_Financeiro\EnviarBoletoPorEmail.pas' {frmEnviarBoletoPorEmail},
  Agenda in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Agenda.pas' {frmAgenda},
  FundoTipo in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\FundoTipo.pas',
  FundoTipoDAO in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\FundoTipoDAO.pas',
  CadTipoSaida in 'Source_Financeiro\CadTipoSaida.pas' {frmCadTipoSaida},
  FrameEditor in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\FrameEditor.pas' {fmeEditor: TFrame},
  CadastroRapidoTransferencia in 'Source_Financeiro\CadastroRapidoTransferencia.pas' {frmCadastroRapidoTransferencia},
  QrCode in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\QrCode.pas',
  DelphiZXIngQRCode in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\DelphiZXIngQRCode.pas',
  FrameCalculadora in 'Source_Tesouraria\FrameCalculadora.pas' {fmeCalculadora: TFrame},
  CalculadoraValores in 'Source_Tesouraria\CalculadoraValores.pas' {frmCalculadoraValores},
  Geral.Model.Entity.Spec.Enumerator in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Enumerator.pas',
  Geral.Model.Entity.Spec.Configuracao in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Configuracao.pas',
  Geral.Model.Entity.Spec.ConfiguracaoGrupo in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.ConfiguracaoGrupo.pas',
  Geral.Model.Entity.Spec.Blob in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Blob.pas',
  Geral.Model.Entity.Spec.Maybe in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Maybe.pas',
  Geral.Model.Entity.Spec.TipoValorConfiguracao in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.TipoValorConfiguracao.pas',
  Geral.Model.Entity.Spec.Sistema in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Sistema.pas',
  Geral.Model.Entity.Spec.Situacao in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Situacao.pas',
  Geral.Model.Entity.Spec.List in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.List.pas',
  Geral.Model.Entity.Spec.List.Transform in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.List.Transform.pas',
  Geral.Model.Entity.Impl.Enumerator.Spring in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.Enumerator.Spring.pas',
  Geral.Model.Entity.Impl.List.Spring in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.List.Spring.pas',
  Geral.Model.Entity.Spec.Factory in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Factory.pas',
  Geral.Model.Entity.Impl.Configuracao in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.Configuracao.pas',
  Geral.Model.Entity.Impl.ConfiguracaoGrupo in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.ConfiguracaoGrupo.pas',
  Geral.Model.Entity.Impl.List.Transform in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.List.Transform.pas',
  MensagemUtils in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Controller\Utils\MensagemUtils.pas',
  BooleanHelper in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\Model\Entity\Helper\BooleanHelper.pas',
  CadEmailTextoPadraoFin in 'Source_Geral_Exclusivo\CadEmailTextoPadraoFin.pas' {frmCademailTextoPadraoFin},
  FormatImageWPtools in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\FormatImageWPtools.pas',
  LanDateTimeTools in '..\..\Tri7_DBExpress\Projeto_Geral\trunk\Source_Geral\LanDateTimeTools.pas',
  FrameImagem in '..\..\Tri7_Firedac\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\FrameImageNovo\FrameImagem.pas' {fmeImagem: TFrame},
  RotinasImagem in '..\..\Tri7_Firedac\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\FrameImageNovo\RotinasImagem.pas',
  VisualizarImagem in '..\..\Tri7_Firedac\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\FrameImageNovo\VisualizarImagem.pas' {frmVisualizarImagem},
  PesquisaImagem in '..\..\Tri7_Firedac\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\FrameImageNovo\PesquisaImagem.pas' {frmPesquisaImagem},
  Geral.Model.Entity.Spec.PKI in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.PKI.pas',
  Geral.Controller.Factory.Entity.PDF in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.Controller.Factory.Entity.PDF.pas',
  Geral.Model.Entity.Impl.PDF.Debenu in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.PDF.Debenu.pas',
  Geral.Controller.Factory.Entity.PKI in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.Controller.Factory.Entity.PKI.pas',
  Geral.Model.Entity.Impl.PKI.XSignPKCS in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.PKI.XSignPKCS.pas',
  Geral.Model.Entity.Impl.Blob in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.Blob.pas',
  XSign_TLB in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\XSign_TLB.pas',
  Geral.Model.Entity.Impl.PKI.Eldos in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.PKI.Eldos.pas',
  Geral.View.Sel.Certificado.Eldos in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.View.Sel.Certificado.Eldos.pas' {frmSelecionarCertificadoEldos},
  Geral.Model.PDF in 'Source_Geral_Exclusivo\Geral.Model.PDF.pas',
  Geral.Model.Entity.Spec.PDF in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.PDF.pas',
  FN.Model.GED in 'D:\Tri7\Desenvolvimento\Projeto_Principal\Financeiro\trunk\Source_JuridicoFinanceiro\FN.Model.GED.pas',
  Geral.Model.GED in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\Geral.Model.GED.pas',
  csDXFunctions in 'D:\Tri7\Desenvolvimento\Projeto_Geral\trunk\Source_Geral\csDXFunctions.pas',
  CodigoPix in 'Source_Geral_Exclusivo\CodigoPix.pas',
  Geral.Model.Entity.Impl.Assinar.PDF in 'Source_Geral_Exclusivo\Geral.Model.Entity.Impl.Assinar.PDF.pas',
  Geral.Model.Entity.Impl.Maybe in 'Source_Geral_Exclusivo\Geral.Model.Entity.Impl.Maybe.pas',
  Geral.Model.Entity.Impl.Factory.List in 'Source_Geral_Exclusivo\Geral.Model.Entity.Impl.Factory.List.pas',
  Email in 'Source_Geral_Exclusivo\Email.pas';

{$R *.res}
{$R Atualizador.res}

   procedure IX_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'imagxpr7.dll' name 'PS_Unlock';
   procedure TP_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'TwnPRO4.dll' name 'PS_Unlock';
   procedure CAP_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'capturepro3.dll' name 'PS_Unlock';
   procedure NX_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'imagxpr7.dll' name 'PS_Unlock';
   procedure PP_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'printpro3.dll' name 'PS_Unlock';

var Hwnd: THandle;
    Ini  : TIniFile;
    vSecao: string;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  vgChaveSecao:= 'Grupo@I9vare@Tri7';
  vSecao      := 'Geral';
  vgTipoBanco := Ini.ReadString(vSecao, 'TipoBanco', ''); //Firebird ou Oracle
  vgBaseDados := Ini.ReadString(vSecao, 'BaseDados', '');
  vgUsuario   := Ini.ReadString(vSecao, 'Usuario', '');
  vgSenha     := Ini.ReadString(vSecao, 'Senha', '');

  vgKey       := Ini.ReadString(vSecao, 'Key', '');
  Ini.Free;

  vgId := 2;
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Hwnd := FindWindow('TApplication', 'I9vare TESOURARIA');

  CopyFile(PChar(vgVERSAO + '\dbexpida40.dll')  , PChar('dbexpida40.dll')  , false);

  if Hwnd = 0 then
  begin
   Application.CreateForm(TdtmControles, dtmControles);
  Application.CreateForm(TdtmLookupBoleto, dtmLookupBoleto);
  Application.CreateForm(TdtmLookupFinanceiro, dtmLookupFinanceiro);
  Application.CreateForm(TdtmLookupContabil, dtmLookupContabil);
  Application.CreateForm(TdtmLookupServico, dtmLookupServico);
  Application.Initialize;
   frmSplash := tfrmSplash.Create(Application);
    frmSplash.Show;
    frmSplash.Update;
    Application.Title := 'I9vare TESOURARIA';
    if vgExecutarSistema then
    begin
      IX_Unlock(228945729, 870386929, 834184233, 23643);
      TP_Unlock(228945729, 870386929, 834184233, 23643);
      CAP_Unlock(228945729, 870386929, 834184233, 23643);
      NX_Unlock(228945729, 870386929, 834184233, 23643);
      PP_Unlock(228945729, 870386929, 834184233, 23643);
    end;
    Application.CreateForm(TfrmPrincipal, frmPrincipal);
    Application.CreateForm(TdtmLookup, dtmLookup);
    frmSplash.Close;
    Application.Run;
  end
  else
  begin
    ShowWindow(Hwnd, SW_SHOWMAXIMIZED);
    SetForegroundWindow(Hwnd);
    Application.Restore;
  end;

end.