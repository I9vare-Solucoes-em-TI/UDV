program ConsultaCNPJ;

uses
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
  Vcl.Forms,
  Principal in 'View\Principal.pas' {frmPrincipal},
  RetornoConsultaCNPJ in '..\Model\Entity\Spec\RetornoConsultaCNPJ.pas',
  ConsultorCNPJ in '..\Model\Entity\Spec\ConsultorCNPJ.pas',
  ConsultaCNPJException in '..\Model\Entity\Spec\Exception\ConsultaCNPJException.pas',
  StringUtils in '..\..\Source_Geral\Model\Entity\Utils\StringUtils.pas',
  BooleanHelper in '..\..\Source_Geral\Model\Entity\Helper\BooleanHelper.pas',
  ConsultorCNPJReceitaWS in '..\Model\Entity\Impl\ConsultorCNPJReceitaWS.pas',
  CNPJUtils in '..\..\Source_Geral\Model\Entity\Utils\CNPJUtils.pas',
  RetornoConsultaCNPJImpl in '..\Model\Entity\Impl\RetornoConsultaCNPJImpl.pas',
  ConsultorCNPJSimpleFactory in 'Controller\Factory\ConsultorCNPJSimpleFactory.pas',
  MensagemUtils in '..\..\Source_Geral\Controller\Utils\MensagemUtils.pas',
  Geral.Model.Entity.Spec.ParametrosProxy in '..\..\Source_Geral\Geral.Model.Entity.Spec.ParametrosProxy.pas',
  Geral.Model.Entity.Impl.ParametrosProxy in '..\..\Source_Geral\Geral.Model.Entity.Impl.ParametrosProxy.pas',
  Geral.Model.Entity.Impl.Maybe in '..\..\Source_Geral\Geral.Model.Entity.Impl.Maybe.pas',
  Geral.Model.Entity.Spec.Maybe in '..\..\Source_Geral\Geral.Model.Entity.Spec.Maybe.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
