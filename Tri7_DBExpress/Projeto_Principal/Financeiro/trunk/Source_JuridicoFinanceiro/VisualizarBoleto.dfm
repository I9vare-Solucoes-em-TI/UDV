object frmVisualizaBoleto: TfrmVisualizaBoleto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Visualiza'#231#227'o do Boleto'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 35
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 782
    object sbnImprimirPDF: TSpeedButton
      Left = 11
      Top = 6
      Width = 102
      Height = 23
      Cursor = crHandPoint
      Caption = 'Imprimir'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37353537353537353537353537
        3535373535373535373535373535373535E6E5E5FFFFFFFFFFFFF3F3F36C6A6A
        3A38383D3B3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D3B
        3B3937376C6A6AF3F3F3757372888786CCCCCC36343436343436343436343436
        3434363434363434363434363434363434CCCCCC888786757372514F4ECCCCCC
        9796933F3D3CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC6A68686A68684644
        43979693CCCCCC514F4E5D5B59CCCCCC9B9A974D4B4ACCCCCC9B99979B99979B
        99979B99979B9997777573FFFFFF6361609B9A97CCCCCC5D5B59686664E5E5E5
        CCCAC7716F6DFFFFFFDAD8D6DAD8D6DAD8D6DAD8D6DAD8D6A19F9CAAA9A68684
        82CCCAC7E5E5E56866647C7A78FCFCFCD5D4D183817EFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF83817ED5D4D1FFFFFF74726F878583FCFCFC
        E1E0DD94928E94928E94928E94928E94928E94928E94928E94928E94928E9492
        8EDDDDDBFFFFFF7F7D7AA7A5A3C6C5C3FFFFFF545250FFFFFFE6E5E3E6E5E3E6
        E5E3E6E5E3E6E5E3E6E5E3FFFFFF545250D8D8D8C6C5C3A7A5A3F8F8F8AFAEAB
        9694915F5D5BFFFFFFECEBEAECEBEAECEBEAECEBEAECEBEAECEBEAFFFFFF5F5D
        5B969491AFAEABF8F8F8FFFFFFFFFFFFFFFFFF6A6866FFFFFFF1F1F0F1F1F0F1
        F1F0F1F1F0F1F1F0F1F1F0FFFFFF6A6866FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF757371F9EBE5F5DFD6F5DFD6F5DFD6F5DFD6F5DFD6F5DFD6F9EBE57573
        71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF807E7BF9EBE5F5DFD6F5DFD6F5
        DFD6F5DFD6F5DFD6F5DFD6F9EBE5807E7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8B8986F9EBE5F9EBE5F9EBE5F9EBE5F9EBE5F9EBE5F9EBE5F9EBE58B89
        86FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96949196949196949196949196
        9491969491969491969491969491969491FFFFFFFFFFFFFFFFFF}
      OnClick = sbnImprimirPDFClick
    end
  end
  object gtPDFViewer: TgtPDFViewer
    Left = 0
    Top = 35
    Width = 784
    Height = 526
    Cursor = 1
    Align = alClient
    Color = clGray
    DockOrientation = doNoOrient
    ParentColor = False
    TabOrder = 1
    TabStop = True
    About = 'Gnostice PDFtoolkit (www.gnostice.com)'
    Status = 'PDF Viewer loaded Successfully.'
    SearchHighlightColor = clGray
    Version = '5.0.0.16'
    ViewerMode = vmHand
    AllowImageCopy = False
    SelectedRegionColor = clSkyBlue
    HighlightRegionColor = clYellow
    BackgroundRendering = False
    Caching.Enabled = True
    Caching.DocumentCount = 10
    ExplicitWidth = 782
    ExplicitHeight = 518
  end
  object gtPDFDocument: TgtPDFDocument
    About = 'Gnostice PDFtoolkit (www.gnostice.com)'
    Version = '5.0.0.16'
    OpenAfterSave = False
    MergeOptions = []
    EMailAfterSave = False
    ShowSetupDialog = False
    Left = 525
    Top = 188
  end
  object gtPDFPrinter: TgtPDFPrinter
    Collate = True
    Copies = 1
    Options = [poPageNums, poSelection]
    About = 'Gnostice PDFtoolkit (www.gnostice.com)'
    PDFDocument = gtPDFDocument
    Scaling = psNone
    Version = '5.0.0.16'
    AutoRotate = False
    IgnoreHardMargin = True
    Left = 525
    Top = 252
  end
end