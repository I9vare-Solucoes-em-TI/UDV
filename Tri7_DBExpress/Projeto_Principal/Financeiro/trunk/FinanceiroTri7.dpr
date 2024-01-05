program FinanceiroTri7;

uses
  ShareMem,
  EMemLeaks,
  EResLeaks,
  ESendMailSMTP,
  EDialogWinAPIMSClassic,
  EDialogWinAPIEurekaLogDetailed,
  EDialogWinAPIStepsToReproduce,
  EDebugExports,
  EFixSafeCallException,
  EMapWin32,
  EAppVCL,
  ExceptionLog7,
  Forms,
  Windows,
  inifiles,
  Graphics,
  SysUtils,
  classes,
  midaslib,
  Dialogs,
  Rotinas in '..\..\..\Projeto_Geral\trunk\Source_Geral\Rotinas.pas',
  UsuarioSistema in '..\..\..\Projeto_Geral\trunk\Source_Geral\UsuarioSistema.pas',
  Config in '..\..\..\Projeto_Geral\trunk\Source_Geral\Config.pas' {frmConfig},
  ConfigRelatorios in '..\..\..\Projeto_Geral\trunk\Source_Geral\ConfigRelatorios.pas' {frmConfigRelatorios},
  Controles in 'Source_GeralFinanceiro\Controles.pas' {dtmControles: TDataModule},
  GrupoRelatorios in '..\..\..\Projeto_Geral\trunk\Source_Geral\GrupoRelatorios.pas' {frmGrupoRelatorio},
  FrameEditor in '..\..\..\Projeto_Geral\trunk\Source_Geral\FrameEditor.pas' {fmeEditor: TFrame},
  FrameEditorSimples in '..\..\..\Projeto_Geral\trunk\Source_Geral\FrameEditorSimples.pas' {fmeEditorSimples: TFrame},
  CadastroBasicoGeral in '..\..\..\Projeto_Geral\trunk\Source_Geral\CadastroBasicoGeral.pas' {frmCadastroBasicoGeral},
  Pesquisa in 'Source_JuridicoFinanceiro\Pesquisa.pas',
  Lookup in 'Source_GeralFinanceiro\Lookup.pas' {dtmLookup: TDataModule},
  CadAuxiliar in '..\..\..\Projeto_Geral\trunk\Source_Geral\CadAuxiliar.pas' {frmCadAuxiliar},
  LoginAlteracao in '..\..\..\Projeto_Geral\trunk\Source_Geral\LoginAlteracao.pas' {frmLoginAlteracao},
  Login in '..\..\..\Projeto_Geral\trunk\Source_Geral\Login.pas' {frmLogin},
  Auditoria in '..\..\..\Projeto_Geral\trunk\Source_Geral\Auditoria.pas' {frmAuditoria},
  Versao in '..\..\..\Projeto_Geral\trunk\Source_Geral\Versao.pas',
  Splash in '..\..\..\Projeto_Geral\trunk\Source_Geral\Splash.pas' {frmSplash},
  Atualizacao in '..\..\..\Projeto_Geral\trunk\Source_Geral\Atualizacao.pas' {frmAtualizacao},
  CapturarBiometria in '..\..\..\Projeto_Geral\trunk\Source_Geral\CapturarBiometria.pas' {frmCapturarBiometria},
  RotinasFingkey in '..\..\..\Projeto_Geral\trunk\Source_Geral\RotinasFingkey.pas',
  CapturarBiometriaVerifica in '..\..\..\Projeto_Geral\trunk\Source_Geral\CapturarBiometriaVerifica.pas' {frmCapturarBiometriaVerifica},
  AnimationThread in '..\..\..\Projeto_Geral\trunk\Source_Geral\AnimationThread.pas',
  MarcacaoTipo in '..\..\..\Projeto_Geral\trunk\Source_Geral\MarcacaoTipo.pas' {frmMarcacaoTipo},
  MarcacaoTipoAtualizar in '..\..\..\Projeto_Geral\trunk\Source_Geral\MarcacaoTipoAtualizar.pas' {frmMarcacaoTipoAtualizar},
  ControleVariaveis in '..\..\..\Projeto_Geral\trunk\Source_Geral\ControleVariaveis.pas',
  Principal in 'Source_JuridicoFinanceiro\Principal.pas' {frmPrincipal},
  ValidarPermissaoUsuario in '..\..\..\Projeto_Geral\trunk\Source_Geral\ValidarPermissaoUsuario.pas' {frmValidarPermissaoUsuario},
  CHILKATCRYPT2Lib_TLB in '..\..\..\Projeto_Geral\trunk\Source_Geral\CHILKATCRYPT2Lib_TLB.pas',
  CharPrinter in '..\..\..\Projeto_Geral\trunk\Source_Geral\CharPrinter.pas',
  Trava in '..\..\..\Projeto_Geral\trunk\Source_Geral\Trava.pas' {frmTrava},
  CadBasico in '..\..\..\Projeto_Geral\trunk\Source_Geral\CadBasico.pas' {frmCadBasico},
  VisualizaRelatorios in '..\..\..\Projeto_Geral\trunk\Source_Geral\VisualizaRelatorios.pas' {frmVisualizaRelatorios},
  FrameCadastro in 'Source_JuridicoFinanceiro\FrameCadastro.pas' {fmeCadastro: TFrame},
  AtualizacaoSistema in '..\..\..\Projeto_Geral\trunk\Source_Geral\AtualizacaoSistema.pas',
  PalavraGramatical in '..\..\..\Projeto_Geral\trunk\Source_Geral\PalavraGramatical.pas' {frmPalavraGramatical},
  TipoVinculoGramatical in '..\..\..\Projeto_Geral\trunk\Source_Geral\TipoVinculoGramatical.pas' {frmTipoVinculoGramatical},
  MarcacaoAutomatica in '..\..\..\Projeto_Geral\trunk\Source_Geral\MarcacaoAutomatica.pas' {frmMarcacaoAutomatica},
  CadCentroCusto in 'Source_JuridicoFinanceiro\CadCentroCusto.pas' {frmCadCentroCusto},
  CadGrupoContabil in 'Source_JuridicoFinanceiro\CadGrupoContabil.pas' {frmCadGrupoContabil},
  CadPlanoContas in 'Source_JuridicoFinanceiro\CadPlanoContas.pas' {frmCadPlanoContas},
  Lookup_Contabil in 'Source_JuridicoFinanceiro\Lookup_Contabil.pas' {dtmLookupContabil},
  CadPessoaFuncao in 'Source_JuridicoFinanceiro\CadPessoaFuncao.pas' {frmCadPessoaFuncao},
  FrameCompromisso in 'Source_JuridicoFinanceiro\FrameCompromisso.pas' {fmeCompromisso: TFrame},
  FrameAssinaturaDigital in '..\..\..\Projeto_Geral\trunk\Source_Geral\FrameAssinaturaDigital.pas' {fmeAssinaturaDigital: TFrame},
  MostrarImagem in '..\..\..\Projeto_Geral\trunk\Source_Geral\MostrarImagem.pas' {frmMostrarImagem},
  Pessoa in 'Source_JuridicoFinanceiro\Pessoa.pas' {frmCadPessoa},
  PessoaPreCadastro in 'Source_JuridicoFinanceiro\PessoaPreCadastro.pas' {frmPessoaPreCadastro},
  PessoaIgual in 'Source_JuridicoFinanceiro\PessoaIgual.pas' {frmPessoaIgual},
  Sobre in '..\..\..\Projeto_Geral\trunk\Source_Geral\Sobre.pas' {frmSobre},
  Financeiro in 'Source_JuridicoFinanceiro\Financeiro.pas' {frmFinanceiro},
  Previsao in 'Source_JuridicoFinanceiro\Previsao.pas' {frmPrevisao},
  Confirmacao in 'Source_JuridicoFinanceiro\Confirmacao.pas' {frmConfirmacao},
  SelecionarArquivo in 'Source_JuridicoFinanceiro\SelecionarArquivo.pas' {frmSelecionarArquivo},
  CadastroRapidoOrcTransf in 'Source_JuridicoFinanceiro\CadastroRapidoOrcTransf.pas' {frmCadastroRapidoOrcTransf},
  CadBalanceteGrupo in 'Source_JuridicoFinanceiro\CadBalanceteGrupo.pas' {frmCadGrupoBalancete},
  Agendamento in 'Source_JuridicoFinanceiro\Agendamento.pas' {frmAgendamento},
  LivroCaixa in 'Source_JuridicoFinanceiro\LivroCaixa.pas' {frmLivroCaixa},
  ModificarFavorecidoCaucaia in 'Source_JuridicoFinanceiro\ModificarFavorecidoCaucaia.pas' {frmModificarFavorecidoCaucaia},
  WPTAddict in '..\..\..\Projeto_Geral\trunk\Source_Geral\WPTAddict.pas',
  PdfToTiff in 'Source_JuridicoFinanceiro\PdfToTiff.pas',
  frmPropDlg in 'Source_JuridicoFinanceiro\frmPropDlg.pas' {PropertiesDlg},
  Agenda in '..\..\..\Projeto_Geral\trunk\Source_Geral\Agenda.pas' {frmAgenda},
  RelatorioFinanceiro in 'Source_JuridicoFinanceiro\RelatorioFinanceiro.pas' {frmCadRelatorioFinanceiro},
  Chat in '..\..\..\Projeto_Geral\trunk\Source_Geral\Chat.pas' {frmChat},
  dmChat in '..\..\..\Projeto_Geral\trunk\Source_Geral\dmChat.pas' {dtmChat: TDataModule},
  LookupFinanceiro in 'Source_JuridicoFinanceiro\LookupFinanceiro.pas' {dtmLookupFinanceiro: TDataModule},
  Lookup_Servico in 'Source_JuridicoFinanceiro\Lookup_Servico.pas' {dtmLookupServico: TDataModule},
  CadastroRapidoLancamento in 'Source_JuridicoFinanceiro\CadastroRapidoLancamento.pas' {frmCadastroRapidoLancamento},
  RegistroParcial in 'Source_JuridicoFinanceiro\RegistroParcial.pas' {frmCadastroRapidoRegistroParcial},
  VersaoEXE in '..\..\..\Projeto_Geral\trunk\Source_Geral\VersaoEXE.pas',
  Desktop in 'Source_GeralFinanceiro\Desktop.pas' {frmDesktop},
  SaldoDetalhado in 'Source_JuridicoFinanceiro\SaldoDetalhado.pas' {frmSaldoDetalhado},
  Conexao in '..\..\..\Projeto_Geral\trunk\Source_Geral\Conexao.pas',
  PesquisaGeral in '..\..\..\Projeto_Geral\trunk\Source_Geral\PesquisaGeral.pas' {frmPesquisa},
  HttpVersao in '..\..\..\Projeto_Geral\trunk\Source_Geral\HttpVersao.pas',
  InputForm in '..\..\..\Projeto_Geral\trunk\Source_Geral\InputForm.pas' {frmInputForm},
  FrameImagem in '..\..\..\Projeto_Geral\trunk\Source_Geral\FrameImageNovo\FrameImagem.pas' {fmeImagem: TFrame},
  CadastroAuxSimplificado in '..\..\..\Projeto_Geral\trunk\Source_Geral\CadastroAuxSimplificado.pas' {frmCadastroAuxSimplificado},
  CaixaFinanceiro in 'Source_JuridicoFinanceiro\CaixaFinanceiro.pas' {frmCaixaFinanceiro},
  TelaBranco in 'Source_JuridicoFinanceiro\TelaBranco.pas' {frmTelaBranco},
  GridVisualizacao in 'Source_JuridicoFinanceiro\GridVisualizacao.pas' {frmGridVisualizacao},
  EnviarBoletoPorEmail in 'Source_JuridicoFinanceiro\EnviarBoletoPorEmail.pas' {frmEnviarBoletoPorEmail},
  VisualizarBoleto in 'Source_JuridicoFinanceiro\VisualizarBoleto.pas' {frmVisualizaBoleto},
  GerenciaBoletoERemessa in 'Source_JuridicoFinanceiro\GerenciaBoletoERemessa.pas' {frmGerenciaBoletoRemessa},
  CadContaBancaria in 'Source_JuridicoFinanceiro\CadContaBancaria.pas' {frmCadContaBancaria},
  CadEnvioEmailFinanceiro in 'Source_JuridicoFinanceiro\CadEnvioEmailFinanceiro.pas' {frmCadEnvioEmailFinanceiro},
  CadastroRapidoalteraLIvroCaixa in 'Source_JuridicoFinanceiro\CadastroRapidoalteraLIvroCaixa.pas' {frmCadastroRapidoAlteraLivroCaixa},
  CadastroRapidoContas in 'Source_JuridicoFinanceiro\CadastroRapidoContas.pas' {frmCadastroRapidoContas},
  CadastroRapidoTransferencia in 'Source_JuridicoFinanceiro\CadastroRapidoTransferencia.pas' {frmCadastroRapidoTransferencia},
  EurekaLog in '..\..\..\Projeto_Geral\trunk\Source_Geral\EurekaLog.pas',
  FundoTipo in '..\..\..\Projeto_Geral\trunk\Source_Geral\FundoTipo.pas',
  FundoTipoDAO in '..\..\..\Projeto_Geral\trunk\Source_Geral\FundoTipoDAO.pas',
  CadCedente in 'Source_JuridicoFinanceiro\CadCedente.pas' {frmCadCedente},
  CadReservaCadastro in 'Source_JuridicoFinanceiro\CadReservaCadastro.pas' {frmCadReservaCadastro},
  CadModalidade in 'Source_JuridicoFinanceiro\CadModalidade.pas' {frmCadModalidade},
  InterfaceDataSnap in 'Source_GeralFinanceiro\InterfaceDataSnap.pas',
  InterfaceDll in 'Source_GeralFinanceiro\InterfaceDll.pas',
  ConciliacaoBancaria in 'Source_JuridicoFinanceiro\ConciliacaoBancaria.pas' {frmConciliacaoBancaria},
  CadEmailTextoPadraoFin in '..\..\..\Projeto_Geral\trunk\Source_Geral\CadEmailTextoPadraoFin.pas' {frmCademailTextoPadrao},
  ConfiguracaoFundo in '..\..\..\Projeto_Geral\trunk\Source_Geral\ConfiguracaoFundo.pas',
  ConfiguradorFundo in '..\..\..\Projeto_Geral\trunk\Source_Geral\ConfiguradorFundo.pas',
  ConfiguracaoFundoDAO in '..\..\..\Projeto_Geral\trunk\Source_Geral\ConfiguracaoFundoDAO.pas',
  ConfiguracoesFundo in '..\..\..\Projeto_Geral\trunk\Source_Geral\ConfiguracoesFundo.pas',
  RemoveFundoTipo in '..\..\..\Projeto_Geral\trunk\Source_Geral\RemoveFundoTipo.pas' {frmRemoveFundoTipo},
  CentroCustoPersonalizado in 'Source_JuridicoFinanceiro\CentroCustoPersonalizado.pas' {frmCentroCustoPersonalizado},
  Emolumento in '..\..\..\Projeto_Geral\trunk\Source_Geral\Model\Entity\Spec\Emolumento.pas',
  EmolumentoImpl in '..\..\..\Projeto_Geral\trunk\Source_Geral\Model\Entity\Impl\EmolumentoImpl.pas',
  Sistema in '..\..\..\Projeto_Geral\trunk\Source_Geral\Model\Entity\Spec\Sistema.pas',
  VinculoConciliacaoBancaria in 'Source_JuridicoFinanceiro\VinculoConciliacaoBancaria.pas' {frmVinculoConciliacaoBancaria},
  ConciliacaoCarregarArquivo in 'Source_JuridicoFinanceiro\ConciliacaoCarregarArquivo.pas' {frmConciliacaoArquivoCarregar},
  ConsultaCNPJ in '..\..\..\Projeto_Geral\trunk\Source_Geral\ConsultaCNPJ.pas' {frmConsultaCNPJ},
  QrCode in '..\..\..\Projeto_Geral\trunk\Source_Geral\QrCode.pas',
  DelphiZXIngQRCode in '..\..\..\Projeto_Geral\trunk\Source_Geral\DelphiZXIngQRCode.pas',
  PlanilhaML in 'Source_JuridicoFinanceiro\PlanilhaML.pas' {frmPlanilhaML},
  CadastroRapidoOrcamento in 'Source_JuridicoFinanceiro\CadastroRapidoOrcamento.pas' {frmCadastroRapidoOrcamento},
  ConsultorCNPJ in '..\..\..\Projeto_Geral\trunk\ConsultaCNPJ\Model\Entity\Spec\ConsultorCNPJ.pas',
  RetornoConsultaCNPJ in '..\..\..\Projeto_Geral\trunk\ConsultaCNPJ\Model\Entity\Spec\RetornoConsultaCNPJ.pas',
  ConsultaCNPJException in '..\..\..\Projeto_Geral\trunk\ConsultaCNPJ\Model\Entity\Spec\Exception\ConsultaCNPJException.pas',
  ConsultorCNPJReceitaWS in '..\..\..\Projeto_Geral\trunk\ConsultaCNPJ\Model\Entity\Impl\ConsultorCNPJReceitaWS.pas',
  RetornoConsultaCNPJImpl in '..\..\..\Projeto_Geral\trunk\ConsultaCNPJ\Model\Entity\Impl\RetornoConsultaCNPJImpl.pas',
  StringUtils in '..\..\..\Projeto_Geral\trunk\Source_Geral\Model\Entity\Utils\StringUtils.pas',
  MensagemUtils in '..\..\..\Projeto_Geral\trunk\Source_Geral\Controller\Utils\MensagemUtils.pas',
  CNPJUtils in '..\..\..\Projeto_Geral\trunk\Source_Geral\Model\Entity\Utils\CNPJUtils.pas',
  BooleanHelper in '..\..\..\Projeto_Geral\trunk\Source_Geral\Model\Entity\Helper\BooleanHelper.pas',
  Cadastro in 'Source_JuridicoFinanceiro\Cadastro.pas',
  CalculoMultaJuros in 'Source_JuridicoFinanceiro\CalculoMultaJuros.pas' {frmCalculoMultaJuros},
  RelatorioEstatistico in 'Source_JuridicoFinanceiro\RelatorioEstatistico.pas' {frmRelatorioEstatistico},
  Geral.Model.Entity.Spec.Maybe in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Maybe.pas',
  Geral.Model.Entity.Spec.List in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.List.pas',
  Geral.Model.Entity.Spec.Enumerator in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Enumerator.pas',
  Geral.Model.Entity.Spec.Configuracao in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Configuracao.pas',
  Geral.Model.Entity.Spec.ConfiguracaoGrupo in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.ConfiguracaoGrupo.pas',
  Geral.Model.Entity.Spec.Sistema in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Sistema.pas',
  Geral.Model.Entity.Spec.Situacao in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Situacao.pas',
  Geral.Model.Entity.Spec.TipoValorConfiguracao in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.TipoValorConfiguracao.pas',
  Geral.Model.Entity.Spec.Blob in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Blob.pas',
  Geral.Model.Entity.Impl.Configuracao in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.Configuracao.pas',
  Geral.Model.Entity.Impl.Factory.List in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.Factory.List.pas',
  Geral.Model.Entity.Impl.List.Transform in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.List.Transform.pas',
  Geral.Model.Entity.Impl.Maybe in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.Maybe.pas',
  Geral.Model.Entity.Spec.Factory in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.Factory.pas',
  Geral.Model.Entity.Impl.List.Spring in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.List.Spring.pas',
  Geral.Model.Entity.Impl.Enumerator.Spring in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Impl.Enumerator.Spring.pas',
  Geral.Model.Entity.Spec.List.Transform in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.List.Transform.pas',
  Geral.Model.Entity.Spec.ParametrosProxy in '..\..\..\Projeto_Geral\trunk\Source_Geral\Geral.Model.Entity.Spec.ParametrosProxy.pas',
  ItensVinculados in 'Source_JuridicoFinanceiro\ItensVinculados.pas' {frmItensVinculados},
  ItensAgendamento in 'Source_JuridicoFinanceiro\ItensAgendamento.pas' {frmItensAgendamento},
  ConciliacaoDataConciliacao in 'Source_JuridicoFinanceiro\ConciliacaoDataConciliacao.pas' {frmConciliacaoData},
  FormatImageWPtools in '..\..\..\Projeto_Geral\trunk\Source_Geral\FormatImageWPtools.pas',
  LanDateTimeTools in '..\..\..\Projeto_Geral\trunk\Source_Geral\LanDateTimeTools.pas',
  Usuario in 'Source_GeralFinanceiro\Usuario.pas' {frmUsuario};

{$R *.res}

   procedure IX_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'imagxpr7.dll' name 'PS_Unlock';
   procedure TP_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'TwnPRO4.dll' name 'PS_Unlock';
   procedure CAP_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'capturepro3.dll' name 'PS_Unlock';
   procedure NX_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'imagxpr7.dll' name 'PS_Unlock';
   procedure PP_Unlock(pw1, pw2, pw3, pw4: LongInt); stdcall; external 'printpro3.dll' name 'PS_Unlock';

var Hwnd: THandle;
    Ini,
    His : TIniFile;
    vSecao, vSolicitaBase: string;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');

  vgChaveSecao:= 'Grupo@I9vare@Tri7';
  vSecao      := 'Geral';
  vgTipoBanco := Ini.ReadString(vSecao, 'TipoBanco', ''); //Firebird ou Oracle
  vgBaseDados := Ini.ReadString(vSecao, 'BaseDados', '');
  vgUsuario   := Ini.ReadString(vSecao, 'Usuario', '');
  vgSenha       := Ini.ReadString(vSecao, 'Senha', '');
  vSolicitaBase := Ini.ReadString(vSecao, 'SolicitaBase', '');

  vgVersaoSistema   := Ini.ReadString(vSecao, 'Versao', '');
  vgKey             := Ini.ReadString(vSecao, 'Key', '');
  vgSistemas        := Ini.ReadString(vSecao, 'Sistemas', '');
  vgControlarVersao := Ini.ReadString(vSecao, 'ControlarVersao', 'S');

  vgBaseDadosHistorico := Ini.ReadString(vSecao, 'BaseDadosHistorico', '');

  if Copy(vgVersaoSistema,Length(vgVersaoSistema) - 1,1) <> '\' then
    vgVersaoSistema  := vgVersaoSistema + '\';

  if vgBaseDadosHistorico = '' then
  begin
    if not FileExists(vgVersaoSistema + 'Historico.ini') then
      vgBaseDadosHistorico := vgBaseDados
    else
    begin
      try
        His := TIniFile.Create(vgVersaoSistema + 'Historico.ini');
        vgBaseDadosHistorico := His.ReadString(vSecao, 'BaseDadosHistorico', '');
        //Grava caminho no Config.ini
        Ini.WriteString(vSecao, 'BaseDadosHistorico', vgBaseDadosHistorico);
        His.Free;
      except
        His.Free;
        Ini.Free;
        Application.MessageBox(PWideChar('N�o foi possivel acessar a base de historico!'+#13+#13+
                                         'Entre em contato com o administrador do sistema!'), 'TRI7 INFORMA', MB_ICONINFORMATION + MB_OK);
        Application.Terminate;
        exit;
      end;
    end;
  end;

  Ini.Free;
  vgTipoConexao := 'DEVART';

  if Copy(vgVersaoSistema,Length(vgVersaoSistema) - 1,1) <> '\' then
    vgVersaoSistema  := vgVersaoSistema + '\';

  vgId := 18;
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Hwnd := FindWindow('TApplication', 'TRI7 - Financeiro');

  vgSistemaNome       := 'Financeiro';
  vgSplashNomeSistema := 'Financeiro';
  vgLoginNomeSistema  := vgSplashNomeSistema;

  vgSistemaNome := 'FinanceiroTri7';
  if ExtractFileName(Application.ExeName) <> (vgSistemaNome+'.exe') then
  begin
    Application.MessageBox(PChar('Nome do execut�vel est� diferente do padr�o!!!'+#13+#13+
                                 'Nome deve ser igual a '+ vgSistemaNome+'.exe'),'TRI7 INFORMA!!!', MB_ICONINFORMATION + MB_OK);
    Application.Terminate;
    exit
  end;

  CopyFile(PChar(vgVersaoSistema + '\dbexpida40.dll')  , PChar('dbexpida40.dll')  , false);
  CopyFile(PChar(vgVersaoSistema + '\fbclient.dll')  , PChar('fbclient.dll')  , false);
  CopyFile(PChar(vgVersaoSistema + 'VRS.ini')  , PChar('VRS.ini')  , false);
  CopyFile(PChar(vgVersaoSistema + 'borlndmm.dll')  , PChar('borlndmm.ini')  , false);

  if Hwnd = 0 then
  begin
    if AtualizaValidaEXE(vgVersaoSistema, 'FinanceiroTri7.exe', '') = True then
    begin
      Application.Initialize;
      frmSplash := tfrmSplash.Create(Application);

      if (vSolicitaBase = 'S') then
      begin
        if frmSplash.lcxBases.Text <> '' then
        begin
          vgAtivarSelecaoBase := vSolicitaBase = 'S';
          frmSplash.ShowModal;
          if vgBaseSelecionada = '' then
            Application.Terminate;

          vgBaseDados          := vgBaseSelecionada;
          vgBaseDadosHistorico := vgHistoricoSelecionado;
          frmSplash := tfrmSplash.Create(Application);

          if vgBaseSelecionada = '' then
          begin
            Application.Terminate;
            Exit;
          end;
        end;
      end;

      Application.CreateForm(TdtmControles, dtmControles);
  Application.CreateForm(TdtmLookupFinanceiro, dtmLookupFinanceiro);
  Application.CreateForm(TdtmLookupContabil, dtmLookupContabil);
  Application.CreateForm(TdtmChat, dtmChat);
  Application.CreateForm(TdtmLookupServico, dtmLookupServico);
  Application.CreateForm(TdtmChat, dtmChat);
  frmSplash.Show;
      frmSplash.Update;
      Application.Title := 'TRI7 - Financeiro';
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
      Application.Terminate;
    end;
  end
  else
  begin
    ShowWindow(Hwnd, SW_SHOWMAXIMIZED);
    SetForegroundWindow(Hwnd);
    Application.Restore;
  end;

end.

  Usuario in '..\I9vare_Geral_Novo\Source_GeralNovo\Usuario.pas' {frmUsuario},