�
 TFRMCAIXASERVICO 0N  TPF0�TfrmCaixaServicofrmCaixaServicoLeft� Top� Caption   Caixa ServiçosClientWidth2OldCreateOrder	ExplicitWidthBExplicitHeight�PixelsPerInch`
TextHeight �TPanelPanelBotoesWidth2ExplicitWidth2 �TPanelPanelBotoesBasicosWidth�ExplicitWidth�  �TPanelPanelBotaoFecharLeft�ExplicitLeft�   �
TStatusBar	StatusBarWidth2ExplicitTop�ExplicitWidth2  �TPanel
PanelGeralWidth2ExplicitWidth2ExplicitHeightS �TPanel	PanelDataWidth0Height@ExplicitWidth0ExplicitHeight@ TLabelLabel1Left� TopWidthNHeightCaption   Tipo Transação:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel2LeftGTopWidth0HeightCaption
Serventia:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TcxLabelcxLabel2LeftTopCaption   Código:Style.TextColorclNavy  TcxDBTextEdit	edtCodigoLeftCTop
DataBinding.DataFieldCAIXA_SERVICO_IDDataBinding.DataSourceSourceAncestralEnabled
ParentFontStyle.StyleControllerdtmControles.cxEsc_EditsNormalStyle.TextColorclNavyTabOrderWidthH  TcxLabelcxLabel1LeftTop&Caption   Descrição:Style.TextColorclNavy  TcxDBTextEditedtDescricaoLeftCTop$DataBinding.DataField	DESCRICAODataBinding.DataSourceSourceAncestral
ParentFontStyle.StyleControllerdtmControles.cxEsc_EditsNormalStyle.TextColorclNavyTabOrderWidth  TcxDBCheckBoxchbSituacaoLeftTop
AutoSizeCaptionAtivoDataBinding.DataFieldSITUACAODataBinding.DataSourceSourceAncestral
ParentFontProperties.DisplayCheckedAProperties.DisplayGrayedIProperties.NullStylenssUncheckedProperties.ValueCheckedAProperties.ValueUncheckedIStyle.Font.CharsetDEFAULT_CHARSETStyle.Font.ColorclWindowTextStyle.Font.Height�Style.Font.NameMS Sans SerifStyle.Font.StylefsBold Style.IsFontAssigned	TabOrderHeightWidth;  TcxDBImageComboBoxIbxTransacaoLeft� Top
DataBinding.DataFieldTIPO_TRANSACAODataBinding.DataSourceSourceAncestral
ParentFontProperties.ImagesdtmControles.imgCadBasicosProperties.ItemsDescriptionCredito
ImageIndexValueC DescriptionDebito
ImageIndexValueD  Style.StyleControllerdtmControles.cxEsc_EditsNormalTabOrderWidth^  TcxDBImageComboBox
ibxSistemaLeft}Top	DataBinding.DataField
SISTEMA_IDDataBinding.DataSourceSourceAncestral
ParentFontProperties.Alignment.HorztaLeftJustifyProperties.ItemsDescription   Registro de Imóveis
ImageIndexValue1 DescriptionTabelionato de Notas
ImageIndexValue2 Description   RTD e Pessoa JurídicaValue3 DescriptionRegistro CivilValue4 DescriptionProtestoValue5 DescriptionGeralValue9  Style.StyleControllerdtmControles.cxEsc_EditsNormalTabOrderWidth�    TcxGrid
grdServicoLeftTopIWidth0Height	AlignalClientTabOrderExplicitLeft ExplicitTopG TcxGridDBTableViewgrdServicoDBTableView1NavigatorButtons.ConfirmDelete"NavigatorButtons.PriorPage.Visible!NavigatorButtons.NextPage.VisibleNavigatorButtons.Insert.VisibleNavigatorButtons.Delete.VisibleNavigatorButtons.Edit.VisibleNavigatorButtons.Post.VisibleNavigatorButtons.Cancel.Visible NavigatorButtons.Refresh.Visible%NavigatorButtons.SaveBookmark.Visible%NavigatorButtons.GotoBookmark.VisibleNavigatorButtons.Filter.VisibleDataController.DataSourceSourceAncestral/DataController.Summary.DefaultGroupSummaryItems )DataController.Summary.FooterSummaryItemsFormatTotal:0KindskCount	FieldNameNATUREZA_ID  $DataController.Summary.SummaryGroups !OptionsBehavior.ColumnHeaderHintsOptionsData.CancelOnExitOptionsData.Deleting OptionsData.DeletingConfirmationOptionsData.EditingOptionsData.InsertingOptionsSelection.CellSelectOptionsView.Navigator	OptionsView.Footer	OptionsView.GroupByBoxStyles.StyleSheet.dtmControles.GridTableViewStyleSheetDevExpress TcxGridDBColumn&grdServicoDBTableView1CAIXA_SERVICO_IDCaption   CódigoDataBinding.FieldNameCAIXA_SERVICO_IDWidthP  TcxGridDBColumngrdServicoDBTableView1DESCRICAOCaption   DescriçãoDataBinding.FieldName	DESCRICAOWidthJ  TcxGridDBColumn$grdServicoDBTableView1TIPO_TRANSACAOCaption   TransaçãoDataBinding.FieldNameTIPO_TRANSACAOPropertiesClassNameTcxImageComboBoxPropertiesProperties.ImagesdtmControles.imgCadBasicosProperties.ItemsDescriptionCredito
ImageIndexValueC DescriptionDebito
ImageIndexValueD  Widthd  TcxGridDBColumngrdServicoDBTableView1SITUACAOCaption
   SituaçãoDataBinding.FieldNameSITUACAORepositoryItemdtmLookup.Combo_AtivoInativoWidthZ  TcxGridDBColumngrdServicoDBTableView1Column1CaptionSistemaDataBinding.FieldName
SISTEMA_IDRepositoryItemdtmLookup.Combo_SistemaWidth�    TcxGridLevelgrdServicoLevel1GridViewgrdServicoDBTableView1   TcxSplittercxSplitter1LeftTopAWidth0HeightHotZoneClassNameTcxMediaPlayer9StyleHotZone.SizePercent<AlignSplittersalTopMinSize<Control	PanelData   �TActionListActionList1Top�   �TSQLDataSetDataSetAncestralCommandText3select *  from C_CAIXA_SERVICO 
order by DESCRICAOTop�   �TDataSetProviderProviderAncestralTop�   �TClientDataSetClientAncestralTop�  TFMTBCDFieldClientAncestralCAIXA_SERVICO_ID	FieldNameCAIXA_SERVICO_IDRequired		PrecisionSize  TStringFieldClientAncestralDESCRICAO	FieldName	DESCRICAOSize<  TStringFieldClientAncestralSITUACAO	FieldNameSITUACAOSize  TStringFieldClientAncestralTIPO_TRANSACAO	FieldNameTIPO_TRANSACAOSize  TFMTBCDFieldClientAncestralSISTEMA_ID	FieldName
SISTEMA_ID	PrecisionSize  TStringFieldClientAncestralINTERNO_SISTEMA	FieldNameINTERNO_SISTEMASize  TStringFieldClientAncestralEMITIR_RELATORIO	FieldNameEMITIR_RELATORIOSize   �TDataSourceSourceAncestralTop�    