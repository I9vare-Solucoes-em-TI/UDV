inherited frmPessoaPesquisaAux: TfrmPessoaPesquisaAux
  Caption = 'frmPessoaPesquisaAux'
  ClientWidth = 826
  ExplicitWidth = 832
  ExplicitHeight = 233
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 826
    inherited lblInformaca: TcxLabel
      Caption = ' Pesquisa Pessoa'
      Style.IsFontAssigned = True
      ExplicitLeft = 29
      ExplicitTop = -6
      ExplicitWidth = 531
      Width = 531
      AnchorY = 19
    end
    inherited Panel6: TPanel
      Left = 566
      inherited btnCancelar: TcxButton
        LookAndFeel.SkinName = ''
      end
      inherited btnConfirmar: TcxButton
        LookAndFeel.SkinName = ''
      end
    end
  end
  inherited Panel1: TPanel
    Width = 826
  end
  inherited DataSetAncestral: TSQLDataSet
    Left = 389
    Top = 164
  end
  inherited ProviderAncestral: TDataSetProvider
    Left = 421
    Top = 164
  end
  inherited ClientAncestral: TClientDataSet
    Left = 453
    Top = 164
  end
  inherited SourceAncestral: TDataSource
    Left = 485
    Top = 164
  end
end
