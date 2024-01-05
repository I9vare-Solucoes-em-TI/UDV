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
  OnCreate = FormCreate
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
      Width = 698
      Height = 531
      ExplicitWidth = 698
      ExplicitHeight = 531
      inherited ImageEnMView1: TImageEnMView
        Height = 529
        ExplicitHeight = 529
      end
      inherited cxSplitter1: TcxSplitter
        Height = 529
        ExplicitHeight = 529
      end
      inherited ImageView: TImageEnView
        Width = 548
        Height = 529
        ExplicitWidth = 548
        ExplicitHeight = 529
      end
    end
    inherited sbxPropriedades: TScrollBox
      Left = 698
      Height = 531
      ExplicitLeft = 698
      ExplicitHeight = 531
      inherited cxLabel1: TcxLabel
        AnchorX = 112
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
