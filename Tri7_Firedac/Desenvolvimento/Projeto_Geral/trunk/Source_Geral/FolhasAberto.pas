unit FolhasAberto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient,
  SimpleDS, DBCGrids,
  cxLabel, StdCtrls, DBCtrls, Menus,
  cxButtons, ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  DbxDevartInterBase, cxControls, dxBarBuiltInMenu, cxPC, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxDBEdit, Vcl.ImgList,
  dxSkinsCore, dxSkinBlue, dxSkinscxPCPainter, dxSkinOffice2007Blue,
  dxSkinOffice2007Pink, cxGroupBox;

type
  TFolhas = record
    LivroAndamentoId: string;
    LivroNaturezaId: string;
    NumeroLivro: string;
    QtdPaginaSolicitada: Integer;
    VisualizarFolhas: Boolean;
  end;

  TPosicao = record
    FolhaInicial: string;
    FolhaFinal: string;
    Qtd: Integer;
    Situacao: string;
    Livro: string;
    AtualizarFolhaAtual: Boolean;
  end;
  TArrayOfPosicao = array of TPosicao;

  TFolhaAux = record
    Pagina: Integer;
    Livro: Integer;
    Situacao: string;
  end;
  TArrayOfFolhaAux = array of TFolhaAux;

  TfrmFolhasAberto = class(TForm)
    dtsFolhas: TDataSource;
    Panel1: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    cxTabControl1: TcxTabControl;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    cdsFolhas: TClientDataSet;
    cdsFolhasPagina: TIntegerField;
    cdsFolhasLivro: TIntegerField;
    cdsFolhasSituacao: TStringField;
    imgFolhasDisponiveis: TImage;
    imgFolhasQuePularam: TImage;
    imgFolhaSelecionada: TImage;
    lbTitulo: TcxLabel;
    Label2: TLabel;
    gbxIndisponibilidade: TcxGroupBox;
    lblQtdFolhasLacuna: TLabel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    lblFolhaCorreta: TLabel;
    lblTotalFolhas: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label130: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure DBText1Click(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
  private
    { Private declarations }
    vlFolhas: TFolhas;
    vlRetorno: TPosicao;
    vlPosicao: TArrayOfPosicao;
    vlFolhaAux: TArrayOfFolhaAux;

    procedure VerificarFolhasAberto;
    procedure LimparRetorno;
    procedure PopularArrayMenorMaiorQtdSituacao;
    procedure PopularArrayFolhaSituacao;
    procedure AtualizarValores;
  public
    procedure MontarTela(
      const vpLivroAndamentoId: string;
      const vpLivroNaturezaId: string;
      const vpNumeroLivro: string;
      const vpQtdPaginaSolicitada: Integer;
      const vpVisualizarFolhas: Boolean;
      const vpDescricaoNatureza: string);
    function GetRetorno: TPosicao;
  end;

var
  frmFolhasAberto: TfrmFolhasAberto;

implementation

uses
  Controles,
  SeloSelecionado,
  Rotinas;

{$R *.dfm}
{$REGION 'Constantes'}
const
  vcSequenciaCorreta = 'S';
  vcFolhaPulou       = 'P';
  vcFolhaSelecionada = 'E';
{$ENDREGION}

procedure TfrmFolhasAberto.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmFolhasAberto.btnConfirmarClick(Sender: TObject);
{$REGION 'Variáveis'}
var
  i: Integer;
  j: Integer;
  viPagina: Integer;
  viPosicao: Integer;
  viPaginasEscolhida: array of Integer;
{$ENDREGION}

  function SequenciaCorreta: Boolean;
  {$REGION 'Variáveis'}
  var
    i: Integer;
    viAux: Integer;
  {$ENDREGION}
  begin
    Result := False;

    if viPaginasEscolhida = nil then
      Exit;

    viAux := viPaginasEscolhida[0];
    for i := Low(viPaginasEscolhida) to High(viPaginasEscolhida) do
    begin
      if (viAux + i) = viPaginasEscolhida[i] then
        Result := True
      else
      begin
        Result := False;
        Break;
      end;
    end;
  end;

  procedure CarregarSituacaoFolhas;
  {$REGION 'Variáveis'}
  var
    i: Integer;
    viPosicao: Integer;
    viMaiorFolha: Integer;
  {$ENDREGION}
  begin
    viMaiorFolha := dtmControles.GetInt(
      'SELECT MAX(FOLHA_FINAL) FROM T_ATO ' +
      ' WHERE LIVRO_ANDAMENTO_ID =' + vlFolhas.LivroAndamentoId);

    viPosicao := cdsFolhas.RecNo;
    try
      cdsFolhas.DisableControls;
      cdsFolhas.First;
      while not cdsFolhas.Eof do
      begin
        cdsFolhas.Edit;
        if cdsFolhasPagina.AsInteger >= viMaiorFolha then
          cdsFolhasSituacao.AsString  := vcSequenciaCorreta
        else
          cdsFolhasSituacao.AsString  := vcFolhaPulou;
        cdsFolhas.Post;

        cdsFolhas.Next;
      end;

      for i := Low(viPaginasEscolhida) to High(viPaginasEscolhida) do
      begin
        if cdsFolhas.Locate('PAGINA', viPaginasEscolhida[i], []) then
        begin
          cdsFolhas.Edit;
          cdsFolhasSituacao.AsString := vcFolhaSelecionada;
          cdsFolhas.Post;
        end;
      end;
    finally
      cdsFolhas.RecNo := viPosicao;
      cdsFolhas.EnableControls;
      DBCtrlGrid1PaintPanel(DBCtrlGrid1, cdsFolhas.RecNo);
    end;
  end;

  function FolhaAtual: Integer;
  begin
    Result := dtmControles.GetInt(
      'SELECT FOLHA_ATUAL FROM T_LIVRO_ANDAMENTO ' +
      ' WHERE LIVRO_ANDAMENTO_ID =' + vlFolhas.LivroAndamentoId);
  end;

  function FolhasReservada: Boolean;
  {$REGION 'Variáveis'}
  var
    i: Integer;
    viQtdFolhasReservadas: Integer;
    viFolhaInicial: Integer;
    viFolhaFinal: Integer;
  {$ENDREGION}
  begin
    Result := False;

    viQtdFolhasReservadas := dtmControles.GetInt(
      'SELECT FOLHA_RESERVA FROM T_LIVRO_NATUREZA ' +
      ' WHERE LIVRO_NATUREZA_ID = ' + vlFolhas.LivroNaturezaId);

    for i := Low(vlPosicao) to High(vlPosicao) do
    begin
      viFolhaInicial := StrToInt(vlPosicao[i].FolhaInicial);
      viFolhaFinal   := StrToInt(vlPosicao[i].FolhaFinal);

      if
        ((viPaginasEscolhida[0] >= viFolhaInicial) and
        (viPaginasEscolhida[0] <= viFolhaFinal)) and
        (((viPaginasEscolhida[0] - viFolhaInicial) > 0) and
        (((viPaginasEscolhida[0] - viFolhaInicial) mod viQtdFolhasReservadas) <> 0))
      then
      begin
        Result := True;
        Break;
      end;
    end;
  end;

begin
  if vlFolhas.VisualizarFolhas then
  begin
    ModalResult := mrOk;
    Abort;
  end;

  if cdsFolhas.IsEmpty then
  begin
    Application.MessageBox('Não existem folhas disponíveis!', 'Aviso', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if vlFolhaAux = nil then
    Exit;

  // Localiza a posição dentro do array
  viPosicao := 0;
  viPagina  := cdsFolhasPagina.AsInteger;
  for i := Low(vlFolhaAux) to High(vlFolhaAux) do
  begin
    if viPagina = vlFolhaAux[i].Pagina then
      Break;

    Inc(viPosicao);
  end;

  // Separa as páginas
  j := 0;
  for i := Low(vlFolhaAux) to High(vlFolhaAux) do
  begin
    if (i >= viPosicao) and (i <= (viPosicao + vlFolhas.QtdPaginaSolicitada) - 1) then
    begin
      vlFolhaAux[i].Situacao := vcFolhaSelecionada;

      SetLength(viPaginasEscolhida, j + 1);
      viPaginasEscolhida[j] := vlFolhaAux[i].Pagina;
      Inc(j);
    end;
  end;

  if FolhasReservada then
  begin
    Application.MessageBox('Quantidade de folhas reservadas é insuficiente!','Alerta', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;

  CarregarSituacaoFolhas;
  if Length(viPaginasEscolhida) <> vlFolhas.QtdPaginaSolicitada then
  begin
    Application.MessageBox('Quantidade de folhas é insuficiente!','Alerta', MB_OK + MB_ICONEXCLAMATION);
    VerificarFolhasAberto;
    Exit;
  end;

  if SequenciaCorreta then
  begin
    if
      Application.MessageBox(Pchar('Confirmar Seleção da(s) Folha(s) ' +
      IntToStr(viPaginasEscolhida[0]) + ' a ' + IntToStr(viPaginasEscolhida[Length(viPaginasEscolhida) - 1]) + '?'),
      'Pergunta', MB_YESNO + MB_ICONINFORMATION) = IDYES
    then
    begin
      vlRetorno.FolhaInicial := IntToStr(viPaginasEscolhida[0]);
      vlRetorno.FolhaFinal   := IntToStr(viPaginasEscolhida[Length(viPaginasEscolhida) - 1]);
      vlRetorno.Qtd          := vlFolhas.QtdPaginaSolicitada;
      vlRetorno.AtualizarFolhaAtual := StrToInt(vlRetorno.FolhaFinal) > FolhaAtual;
      ModalResult := mrOk;
    end
    else
    begin
      VerificarFolhasAberto;
      Exit;
    end;
  end
  else
  begin
    Application.MessageBox('Sequência de folhas selecionada está incorreta!','Alerta', MB_OK + MB_ICONEXCLAMATION);
    VerificarFolhasAberto;
    Exit;
  end;
end;

procedure TfrmFolhasAberto.AtualizarValores;
{$REGION 'Variáveis'}
var
  viQtdSeqCorreta: Integer;
  viQtdSeqPulou: Integer;
{$ENDREGION}
begin
  viQtdSeqCorreta := 0;
  viQtdSeqPulou   := 0;

  cdsFolhas.DisableControls;
  cdsFolhas.First;
  try
    while not cdsFolhas.Eof do
    begin
       if cdsFolhasSituacao.AsString = vcSequenciaCorreta then
         Inc(viQtdSeqCorreta)
       else if cdsFolhasSituacao.AsString = vcFolhaPulou then
         Inc(viQtdSeqPulou);

      cdsFolhas.Next;
    end;
  finally
    cdsFolhas.EnableControls;
    cdsFolhas.First;
  end;
  lblQtdFolhasLacuna.Caption := FormatFloat('000', viQtdSeqPulou);
  lblFolhaCorreta.Caption    := FormatFloat('000', viQtdSeqCorreta);
  lblTotalFolhas.Caption     := FormatFloat('000', cdsFolhas.RecordCount);
end;

procedure TfrmFolhasAberto.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
begin
  imgFolhasDisponiveis.Visible := cdsFolhasSituacao.AsString = vcSequenciaCorreta;
  imgFolhasQuePularam.Visible  := cdsFolhasSituacao.AsString = vcFolhaPulou;
  imgFolhaSelecionada.Visible  := cdsFolhasSituacao.AsString = vcFolhaSelecionada;
end;

procedure TfrmFolhasAberto.DBText1Click(Sender: TObject);
begin
  btnConfirmarClick(Self);
end;

procedure TfrmFolhasAberto.FormActivate(Sender: TObject);
begin
  VerificarFolhasAberto;
  DBCtrlGrid1.SetFocus;
end;

function TfrmFolhasAberto.GetRetorno: TPosicao;
begin
  Result := vlRetorno;
end;

procedure TfrmFolhasAberto.LimparRetorno;
begin
  vlRetorno.FolhaInicial := '';
  vlRetorno.FolhaFinal   := '';
  vlRetorno.Qtd          := -1;
  vlRetorno.Situacao     := '';
  vlRetorno.AtualizarFolhaAtual := False;
end;

procedure TfrmFolhasAberto.PopularArrayMenorMaiorQtdSituacao;
{$REGION 'Variáveis'}
var
  i: Integer;
  j: Integer;
  y: Integer;
  viPos: Integer;
  viSeq: Integer;
  viAux: Integer;
  viContinuar: Integer;
  viSituacao: string;
  viFolhaFinal: string;
  viFolhaInicial: string;
  viPopular: Boolean;
{$ENDREGION}
begin
  if
    (not Length(vlFolhaAux) > 0) or
    (Length(vlFolhaAux) < vlFolhas.QtdPaginaSolicitada)
  then
    Exit;

  y           := 0;
  viContinuar := 0;
  for i :=  Low(vlFolhaAux) to High(vlFolhaAux) do
  begin
    viPos     := 1;
    viSeq     := 1;
    viAux     := vlFolhaAux[i].Pagina;
    viPopular := False;

    if viAux < viContinuar then
       Continue;

    for j := Low(vlFolhaAux) to High(vlFolhaAux) do
    begin
      if vlFolhaAux[j].Pagina < viContinuar then
        Continue;

      if viSeq = 1 then
      begin
        viFolhaInicial := IntToStr(viAux);
        viSituacao     := vlFolhaAux[j].Situacao;
        Inc(viSeq);
        Continue;
      end;

      if (viAux + viPos) = vlFolhaAux[j].Pagina then
      begin
        viFolhaFinal := IntToStr(vlFolhaAux[j].Pagina);
        Inc(viPos);
        Inc(viSeq);
        viPopular := True;
      end
      else
      begin
        viContinuar := vlFolhaAux[j].Pagina;
        Break;
      end;
    end;

    if viPopular then
    begin
      SetLength(vlPosicao, y + 1);

      vlPosicao[y].FolhaInicial := viFolhaInicial;
      vlPosicao[y].FolhaFinal   := viFolhaFinal;
      vlPosicao[y].Qtd          := (StrToInt(viFolhaFinal) - StrToInt(viFolhaInicial)) + 1;
      vlPosicao[y].Situacao     := viSituacao;
      Inc(y);
    end;
  end;
end;

procedure TfrmFolhasAberto.MontarTela(
  const vpLivroAndamentoId: string;
  const vpLivroNaturezaId: string;
  const vpNumeroLivro: string;
  const vpQtdPaginaSolicitada: Integer;
  const vpVisualizarFolhas: Boolean;
  const vpDescricaoNatureza: string);
begin
  vlFolhas.LivroAndamentoId    := vpLivroAndamentoId;
  vlFolhas.LivroNaturezaId     := vpLivroNaturezaId;
  vlFolhas.NumeroLivro         := vpNumeroLivro;
  vlFolhas.QtdPaginaSolicitada := vpQtdPaginaSolicitada;
  vlFolhas.VisualizarFolhas    := vpVisualizarFolhas;

  lbTitulo.Caption := 'Livro Natureza: ' + vpNumeroLivro +
    ' - Natureza: ' + vpDescricaoNatureza;

  btnConfirmar.Visible := not vlFolhas.VisualizarFolhas;
end;

procedure TfrmFolhasAberto.PopularArrayFolhaSituacao;
{$REGION 'Variáveis'}
var
  i: Integer;
{$ENDREGION}
begin
  try
    i := 0;
    cdsFolhas.DisableControls;
    cdsFolhas.First;
    while not cdsFolhas.Eof do
    begin
      SetLength(vlFolhaAux, i + 1);
      vlFolhaAux[i].Pagina := cdsFolhasPagina.AsInteger;

      if cdsFolhasSituacao.AsString = vcSequenciaCorreta then
        vlFolhaAux[i].Situacao := vcSequenciaCorreta
      else if cdsFolhasSituacao.AsString = vcFolhaPulou then
        vlFolhaAux[i].Situacao := vcFolhaPulou;

      Inc(i);
      cdsFolhas.Next;
    end;
  finally
    cdsFolhas.First;
    cdsFolhas.EnableControls;
  end;
end;

procedure TfrmFolhasAberto.VerificarFolhasAberto;
{$REGION 'Variáveis'}
var
  viPaginaFlag: Integer;
  viPaginaInicial: Integer;
  viQtdFolhas: Integer;
  viLivro: Integer;
  i: Integer;
  viPaginas: array of Integer;
  viSql: string;
  viLivroInicial: string;
{$ENDREGION}

  procedure CarregarFolhas;
  {$REGION 'Variáveis'}
  var
    j: Integer;
    viMaiorFolha: Integer;
    viFolhaAtual: Integer;
  {$ENDREGION}
  begin
    viMaiorFolha := dtmControles.GetInt(
      'SELECT MAX(FOLHA_FINAL) FROM T_ATO ' +
      ' WHERE LIVRO_ANDAMENTO_ID =' + vlFolhas.LivroAndamentoId);

    viFolhaAtual := dtmControles.GetInt(
      'SELECT FOLHA_ATUAL FROM T_LIVRO_ANDAMENTO ' +
      ' WHERE LIVRO_NATUREZA_ID = ' + vlFolhas.LivroNaturezaId +
      ' AND LIVRO_ANDAMENTO_ID = ' + vlFolhas.LivroAndamentoId);
    try
      cdsFolhas.DisableControls;
      for j := 0 to viQtdFolhas - 1 do
      begin
        if (viPaginas[j] <> 0) or (j + 1 = viFolhaAtual) then
          Continue;

        cdsFolhas.Append;
        cdsFolhasPagina.AsInteger := j + 1;
        cdsFolhasLivro.AsInteger  := viLivro;

        if j + 1 >= viMaiorFolha then
          cdsFolhasSituacao.AsString  := vcSequenciaCorreta
        else
          cdsFolhasSituacao.AsString  := vcFolhaPulou;

        cdsFolhas.Post;
      end;
    finally
      cdsFolhas.First;
      cdsFolhas.EnableControls;
      AtualizarValores;
    end;
  end;

begin
  viLivroInicial := dtmControles.GetStr(
    'SELECT ' +
    '  LIVRO_INICIAL_VALIDA_FOLHA ' +
    ' FROM T_LIVRO_NATUREZA ' +
    ' WHERE ' +
    '  LIVRO_NATUREZA_ID = ' + vlFolhas.LivroNaturezaId);

  viSql :=
    'SELECT ' +
    '  LIVRO_ANDAMENTO_ID, ' +
    '  NUMERO_LIVRO, ' +
    '  NUMERO_FOLHAS ' +
    ' FROM ' +
    '  T_LIVRO_ANDAMENTO ' +
    ' WHERE ' +
    '  LIVRO_NATUREZA_ID = ' + vlFolhas.LivroNaturezaId +
    '  AND DATA_FECHAMENTO IS NULL ';

  if vlFolhas.NumeroLivro <> '' then
    viSql := viSql + ' AND NUMERO_LIVRO = ' + vlFolhas.NumeroLivro
  else if viLivroInicial <> '' then
    viSql := viSql + ' AND NUMERO_LIVRO >= ' + viLivroInicial;

  ExecutaSimpleDSAux(viSql, 0);

  cdsFolhas.EmptyDataSet;
  while not dtmControles.SimpleAuxiliar.Eof do
  begin
    viQtdFolhas  := dtmControles.SimpleAuxiliar.FieldByName('NUMERO_FOLHAS').AsInteger;
    viLivro      := dtmControles.SimpleAuxiliar.FieldByName('NUMERO_LIVRO').AsInteger;

    ExecutaSqlAuxiliar(
      'SELECT ' +
      '  FOLHA_INICIAL, ' +
      '  FOLHA_FINAL ' +
      ' FROM ' +
      '  T_ATO ' +
      ' WHERE ' +
      '  LIVRO_ANDAMENTO_ID = ' + dtmControles.SimpleAuxiliar.FieldByName('LIVRO_ANDAMENTO_ID').AsString +
      ' AND FOLHA_INICIAL IS NOT NULL ' +
      ' ORDER BY FOLHA_INICIAL', 0);

    for i := 0 to viQtdFolhas - 1 do
    begin
      SetLength(viPaginas, i + 1);
      viPaginas[i] := 0;
    end;

    while not dtmControles.sqlAuxiliar.Eof  do
    begin
      viPaginaInicial := dtmControles.sqlAuxiliar.FieldByName('FOLHA_INICIAL').AsInteger;
      viPaginaFlag    := dtmControles.sqlAuxiliar.FieldByName('FOLHA_FINAL').AsInteger;
      repeat
        viPaginas[viPaginaInicial - 1] := viPaginaInicial;
        Inc(viPaginaInicial);
      until viPaginaInicial > viPaginaFlag;
      dtmControles.sqlAuxiliar.Next;
    end;
    dtmControles.SimpleAuxiliar.Next;
  end;

  CarregarFolhas;
  LimparRetorno;
  PopularArrayFolhaSituacao;
  PopularArrayMenorMaiorQtdSituacao;
end;

end.
