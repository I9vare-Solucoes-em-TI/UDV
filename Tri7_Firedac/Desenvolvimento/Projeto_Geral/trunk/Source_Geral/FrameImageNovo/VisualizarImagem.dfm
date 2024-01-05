object frmVisualizarImagem: TfrmVisualizarImagem
  Left = 0
  Top = 0
  Caption = 'Visualizador'
  ClientHeight = 594
  ClientWidth = 926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline fmeImagem1: TfmeImagem
    Left = 0
    Top = 0
    Width = 926
    Height = 594
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 926
    ExplicitHeight = 594
    inherited Panel1: TPanel
      Width = 685
      Height = 531
      ExplicitWidth = 685
      ExplicitHeight = 531
      inherited ImageView: TImageEnView
        Width = 683
        Height = 529
        ExplicitWidth = 683
        ExplicitHeight = 529
      end
    end
    inherited sbxPropriedades: TScrollBox
      Left = 685
      Height = 531
      ExplicitLeft = 685
      ExplicitHeight = 531
      inherited cxLabel1: TcxLabel
        AnchorX = 119
      end
      inherited cxGroupBox2: TcxGroupBox
        inherited chxDialog: TcxCheckBox
          ExplicitHeight = 0
        end
        inherited chxProgressBar: TcxCheckBox
          ExplicitHeight = 0
        end
        inherited chxDuplex: TcxCheckBox
          ExplicitHeight = 0
        end
      end
      inherited cxGroupBox3: TcxGroupBox
        inherited chxDigitalizacaoColorida: TcxCheckBox
          ExplicitHeight = 0
        end
        inherited chxImagemAutoFit: TcxCheckBox
          ExplicitHeight = 0
        end
        inherited chxImagemMovingScroll: TcxCheckBox
          ExplicitHeight = 0
        end
      end
    end
    inherited StatusBar1: TStatusBar
      Top = 575
      Width = 926
      ExplicitTop = 575
      ExplicitWidth = 926
    end
    inherited BarManager: TdxBarManager
      DockControlHeights = (
        0
        0
        44
        0)
    end
  end
end
