{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{                   ExpressScheduler                                 }
{                                                                    }
{       Copyright (c) 2003-2003 Developer Express Inc.               }
{       ALL RIGHTS RESERVED                                          }
{                                                                    }
{   The entire contents of this file is protected by U.S. and        }
{   International Copyright Laws. Unauthorized reproduction,         }
{   reverse-engineering, and distribution of all or any portion of   }
{   the code contained in this file is strictly prohibited and may   }
{   result in severe civil and criminal penalties and will be        }
{   prosecuted to the maximum extent possible under the law.         }
{                                                                    }
{   RESTRICTIONS                                                     }
{                                                                    }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES            }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE     }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS    }
{   LICENSED TO DISTRIBUTE THE EXPRESSSCHEDULER AND ALL ACCOMPANYING }
{   VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.              }
{                                                                    }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED       }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE         }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE        }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT   }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                       }
{                                                                    }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON        }
{   ADDITIONAL RESTRICTIONS.                                         }
{                                                                    }
{********************************************************************}

{$I cxSchedulerVer.inc}

unit cxSchedulerEventEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, cxTextEdit, cxMemo, cxImageComboBox, cxCalendar,
  cxTimeEdit, cxLookAndFeelPainters, cxDropDownEdit, cxCheckBox,
  cxSpinEdit, cxMaskEdit, cxControls, cxContainer, cxEdit, cxButtons,
  cxSchedulerStorage, cxLookAndFeels, cxSchedulerCustomControls,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TcxSchedulerEventEditor = class(TForm)
    pnlCaption: TPanel;
    lbSubject: TLabel;
    teSubject: TcxTextEdit;
    icbLabel: TcxImageComboBox;
    lbLabel: TLabel;
    pnlMessage: TPanel;
    meMessage: TcxMemo;
    pnlReminder: TPanel;
    cbReminder: TcxCheckBox;
    cbAdvanceTime: TcxComboBox;
    lbShowTimeAs: TLabel;
    icbShowTimeAs: TcxImageComboBox;
    pnlTime: TPanel;
    lbStartTime: TLabel;
    deStart: TcxDateEdit;
    teStart: TcxTimeEdit;
    lbEndTime: TLabel;
    deEnd: TcxDateEdit;
    teEnd: TcxTimeEdit;
    cbAllDayEvent: TcxCheckBox;
    pnlResource: TPanel;
    Bevel5: TBevel;
    cbResources: TcxComboBox;
    lbResource: TLabel;
    Bevel1: TBevel;
    pnlThreeButtons: TPanel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    btnDelete: TcxButton;
    pnlRecurrence: TPanel;
    Bevel2: TBevel;
    Label1: TLabel;
    lcxUsuarioPara: TcxLookupComboBox;
    Label2: TLabel;
    lcxUsuarioAgendou: TcxLookupComboBox;
    procedure OnChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure cbAllDayEventPropertiesChange(Sender: TObject);
    procedure StartDateChanged(Sender: TObject);
    procedure btnAlterarImoveisClick(Sender: TObject);
  private
    FBiasTime: TDateTime;
    FDeleteSeries: Boolean;
    FDeleteExceptions: Boolean;
    FEvent: TcxSchedulerControlEvent;
    FForceSeries: Boolean;
    FHasStorageEvent: Boolean;
    FNeedCheckLossOfExceptions: Boolean;
    FReadOnly: Boolean;
    FRecurrenceActivate: Boolean;
    FOnDeleteFunc: TcxOnDeleteEventFunc;
    function GetEventName: string;
    procedure SetReadOnly(AValue: Boolean);
  protected
    FModified: Boolean;
    procedure ApplyChanges; virtual;
    procedure CheckVisible;
    procedure ClearModifiedFlag; virtual;
    procedure DeleteEvent;
    function GetReminderTime: Integer;
    procedure InitLabel;
    procedure InitReminderPanel;
    procedure InitResources;
    procedure LoadEventValuesIntoControls; virtual;
    function IsRecurrenceSeries: Boolean;
    function IsValid: Boolean; virtual;
    procedure PostEvent;
    procedure SaveChanges; virtual;
    procedure SetActiveControl; virtual;
    procedure SetCaptions; virtual;
    function Storage: TcxCustomSchedulerStorage;
    procedure UpdateEventValuesFromControls; virtual;

    property DeleteExceptions: Boolean read FDeleteExceptions;
  public
    constructor CreateEx(AEvent: TcxSchedulerControlEvent); virtual;
    function ShowModal: Integer; override;

    property BiasTime: TDateTime read FBiasTime write FBiasTime;
    property EventName: string read GetEventName;
    property ForceSeries: Boolean read FForceSeries write FForceSeries;
    property Modified: Boolean read FModified;
    property Event: TcxSchedulerControlEvent read FEvent;
    property RecurrenceActivate: Boolean read FRecurrenceActivate write FRecurrenceActivate;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property OnDeleteFunc: TcxOnDeleteEventFunc read FOnDeleteFunc write FOnDeleteFunc;
  end;

  TcxSchedulerEventEditorClass = class of TcxSchedulerEventEditor;

implementation

uses
  cxClasses, cxSchedulerStrs, cxSchedulerUtils, cxSchedulerDialogs,
  {$IFDEF DELPHI6}Variants, DateUtils, {$ELSE}cxDateUtils, {$ENDIF}
  cxVariants, cxSchedulerRecurrenceSelectionDialog, Lookup, Controles;

{$R *.dfm}

{ TcxSchedulerEventEditor }

constructor TcxSchedulerEventEditor.CreateEx(AEvent: TcxSchedulerControlEvent);
begin
  inherited Create(nil);
  FEvent := AEvent;
  FHasStorageEvent := not ((AEvent.Source = nil) or (AEvent.EventType = etOccurrence));
  FNeedCheckLossOfExceptions := (AEvent.Pattern <> nil) and AEvent.Pattern.HasExceptions;
  InitReminderPanel;
  InitLabel;
  SetCaptions;
  cbReminder.Visible := False; 
  cbAdvanceTime.Visible := False;

  LoadEventValuesIntoControls;
  ClearModifiedFlag;
end;

function TcxSchedulerEventEditor.ShowModal: Integer;
begin
{  if UseSchedulerColorInDialogs then
    Color := teLocation.Style.LookAndFeel.Painter.DefaultSchedulerControlColor;}
  SetActiveControl;
  cxDialogsMetricsStore.InitDialog(Self);
  CheckVisible;
  Result := inherited ShowModal;
  cxDialogsMetricsStore.StoreMetrics(Self);
  ApplyChanges;
end;

procedure TcxSchedulerEventEditor.SaveChanges;
var
  AStorage: TcxCustomSchedulerStorage;
begin
//  if not Modified and (Event.Source <> nil) then Exit;
  AStorage := Event.Storage;
  AStorage.BeginUpdate;
  try
    UpdateEventValuesFromControls;
    PostEvent;
  finally
    AStorage.EndUpdate;
  end;
end;

procedure TcxSchedulerEventEditor.SetActiveControl;
begin
  if (Event.Source = nil) and teSubject.CanFocus then
    ActiveControl := teSubject
  else
    if meMessage.CanFocus then
      ActiveControl := meMessage
    else
      if deStart.CanFocus then
        ActiveControl := deStart;
end;

procedure TcxSchedulerEventEditor.ApplyChanges;
begin
  case ModalResult of
    mrAbort:
      DeleteEvent;
    mrOk:
      SaveChanges;
    mrCancel:
      begin
        Event.Cancel;
        FModified := False;
        Event.Storage.FullRefresh;
      end;
  end;
end;

procedure TcxSchedulerEventEditor.CheckVisible;
begin
  pnlTime.Visible := (Event.EventType = etNone) or
    ((Event.EventType in [etOccurrence, etCustom]) and not ForceSeries);
  teStart.Time := TimeOf(Event.Start);
  teEnd.Time := TimeOf(Event.Finish);
  teStart.Visible := not cbAllDayEvent.Checked;
  teEnd.Visible := not cbAllDayEvent.Checked;
end;

procedure TcxSchedulerEventEditor.ClearModifiedFlag;

  procedure CheckComponent(AComponent: TComponent);
  begin
    if AComponent is TcxCustomEdit then
      TcxCustomEdit(AComponent).EditModified := False;
  end;

var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    CheckComponent(Components[I]);
  FModified := False;
end;

procedure TcxSchedulerEventEditor.DeleteEvent;
begin
  if FDeleteSeries then
    Event.Pattern.Delete
  else
    Event.Delete;
end;

function TcxSchedulerEventEditor.GetReminderTime: Integer;
begin
  Result := Integer(cbAdvanceTime.Properties.Items.Objects[cbAdvanceTime.ItemIndex]);
end;

procedure TcxSchedulerEventEditor.InitReminderPanel;
var
  I: Integer;
  AItem: TcxImageComboboxItem;
const
{  ATimeTypes: array[0..3] of Pointer =
    (@scxFree, @scxTentative, @scxBusy, @scxOutOfOffice);}
  ATimeTypes: array[0..2] of Pointer =
    (@scxFree, @scxTentative, @scxBusy);
begin
  TcxSchedulerDateTimeHelper.FillAdvanceStrings(cbAdvanceTime.Properties.Items);
  cbAdvanceTime.ItemIndex := 0; //todo:
//  for I := 0 to 3 do
  for I := 0 to 2 do
  begin
    AItem := TcxImageComboboxItem(icbShowTimeAs.Properties.Items.Add);
    AItem.Description := cxGetResourceString(ATimeTypes[I]);
    AItem.ImageIndex := I;
    AItem.Value := I;
  end;
  icbShowTimeAs.ItemIndex := Integer(Event.State);
  icbShowTimeAs.Properties.Images := TimeLinePatterns;
  icbShowTimeAs.Enabled := Storage.IsStateAvailable;
end;

procedure TcxSchedulerEventEditor.InitResources;
var
  I, AResourceIndex: Integer;
begin
  pnlResource.Visible := (Event.Storage.ResourceCount > 0) and
    (csDesigning in Event.Storage.ComponentState);
  if pnlResource.Visible then
  begin
    AResourceIndex := -1;
    with cbResources.Properties.Items do
    begin
      BeginUpdate;
      Clear;
      for I := 0 to Event.Storage.ResourceCount - 1 do
      begin
        Add(Event.Storage.ResourceNames[I]);
        if VarCompare(Event.ResourceID, Event.Storage.ResourceIDs[I]) = 0 then
          AResourceIndex := I;
      end;
      EndUpdate;
    end;
    cbResources.ItemIndex := AResourceIndex;
  end;
end;

function TcxSchedulerEventEditor.IsRecurrenceSeries: Boolean;
begin
  Result := (Event.Source <> nil) and Event.IsRecurring and ForceSeries;
end;

function TcxSchedulerEventEditor.IsValid: Boolean;
begin
  Result := not ((deStart.Date + teStart.Time) >
    (deEnd.Date + teEnd.Time));
  if not Result then
  begin
    MessageDlg(cxGetResourceString(@scxWrongTimeBounds), mtWarning, [mbOk], 0);
    ActiveControl := deEnd;
  end;
end;

procedure TcxSchedulerEventEditor.PostEvent;

  function GetStorageEvent: TcxSchedulerEvent;
  begin
    if not FHasStorageEvent then
      Result := Event.Storage.CreateEvent
    else
      Result := Event.Source;
    Result.Assign(Event);
  end;

  procedure CheckDeleteException;
  begin
    if FDeleteExceptions and (Event.Pattern <> nil) then
      Event.Pattern.DeleteExceptions;
  end;

begin
  CheckDeleteException;
  if Event.IsRecurring then
  begin
    if ForceSeries then
    begin
      if Event.Pattern <> nil then
      begin
        Event.Pattern.Assign(Event);
        Event.Pattern.EventType := etPattern;
      end
      else
        GetStorageEvent.EventType := etPattern;
    end
    else
      with GetStorageEvent do
      begin
        EventType := etCustom;
        ParentID := Event.Pattern.ID;
      end;
  end
  else
    if Event.Pattern <> nil then
      Event.Pattern.Assign(Event)
    else
      GetStorageEvent.EventType := etNone;
end;

procedure TcxSchedulerEventEditor.LoadEventValuesIntoControls;
begin
  teSubject.Text := Event.Caption;
  teSubject.Enabled := Storage.IsCaptionAvailable;
//  teLocation.Text := Event.Location;
//  teLocation.Enabled := Storage.IsLocationAvailable;
  meMessage.Text := Event.Message;
  meMessage.Enabled := Storage.IsMessageAvailable;
  deStart.Date := DateOf(Event.Start);
  teStart.Time := TimeOf(Event.Start);
  deEnd.Date := DateOf(Event.Finish) - Ord(Event.AllDayEvent);
  teEnd.Time := TimeOf(Event.Finish);
  cbAllDayEvent.Checked := Event.AllDayEvent;
  if Event.ResourceID = Null then
  begin
    lcxUsuarioAgendou.EditValue := vgUsuarioID;
    lcxUsuarioPara.EditValue := vgUsuarioID;
  end
  else
  begin
    lcxUsuarioAgendou.EditValue := Event.ResourceID;
    lcxUsuarioPara.EditValue := Event.ParentID;
  end;
  //cbReminder.Checked := Event.Reminder; //for the next version
  InitResources;
end;

procedure TcxSchedulerEventEditor.InitLabel;

  function GetIndex: Integer;
  var
    I: Integer;
  begin
    Result := -1;
    for I := 0 to 10 do
      if Event.LabelColor = EventLabelColors[I] then
      begin
        Result := I;
        break;
      end;
  end;

var
  I: Integer;
  AItem: TcxImageComboboxItem;
begin
//  for I := 0 to 10 do
  for I := 0 to 4 do
  begin
    AItem := TcxImageComboboxItem(icbLabel.Properties.Items.Add);
    AItem.Description := cxGetResourceString(sEventLabelCaptions[I]);
    AItem.ImageIndex := I + 11;
    AItem.Value := EventLabelColors[I];
  end;
  icbLabel.ItemIndex := GetIndex;
  icbLabel.Properties.Images := MenuImages;
  icbLabel.Enabled := Storage.IsLabelColorAvailable;
end;

procedure TcxSchedulerEventEditor.SetCaptions;
begin
{  Caption := cxGetResourceString(@scxEvent) + ' - ' + EventName;
  // events
  lbResource.Caption := cxGetResourceString(@scxResource);
  lbSubject.Caption := cxGetResourceString(@scxSubject);
  lbLocation.Caption := cxGetResourceString(@scxLocation);
  lbLabel.Caption := cxGetResourceString(@scxLabel);
  lbShowTimeAs.Caption := cxGetResourceString(@scxShowTimeAs);
  lbStartTime.Caption := cxGetResourceString(@scxStartTime);
  lbEndTime.Caption := cxGetResourceString(@scxEndTime);
  cbAllDayEvent.Caption := cxGetResourceString(@scxAllDayEvent);
  // buttons
  btnOk.Caption := cxGetResourceString(@scxOk);
  btnCancel.Caption := cxGetResourceString(@scxCancel);
  btnDelete.Caption := cxGetResourceString(@scxDelete);
  btnRecurrence.Caption := cxGetResourceString(@scxRecurrence);
  btnRecurrence.Enabled := Storage.IsRecurrenceAvailable;}
end;

function TcxSchedulerEventEditor.Storage: TcxCustomSchedulerStorage;
begin
  Result := Event.Storage;
end;

procedure TcxSchedulerEventEditor.UpdateEventValuesFromControls;
begin
  if teSubject.EditModified then
    Event.Caption := teSubject.Text;
{  if teLocation.EditModified then
    Event.Location := teLocation.Text;}
  if meMessage.EditModified then
    Event.Message := meMessage.Text;
  //Event.Reminder := cbReminder.Checked;
  //Event.ReminderTime := GetReminderTime;
  if (Event.EventType = etNone) or not ForceSeries then
  begin
    Event.Start := deStart.Date + teStart.Time + BiasTime;
    Event.Finish := deEnd.Date + teEnd.Time + Ord(cbAllDayEvent.Checked) + BiasTime;
    if cbAllDayEvent.EditModified then
      Event.AllDayEvent := cbAllDayEvent.Checked;
  end;
  if icbShowTimeAs.EditModified then
    Event.State := icbShowTimeAs.ItemIndex;
  if icbLabel.EditModified and (icbLabel.ItemIndex <> -1) then
    Event.LabelColor := EventLabelColors[icbLabel.ItemIndex];
  if pnlResource.Visible and (cbResources.ItemIndex <> -1) then
    Event.ResourceID := Event.Storage.ResourceIDs[cbResources.ItemIndex];

//  if lcxUsuarioAgendou.EditModified then
    Event.ResourceID := lcxUsuarioAgendou.EditValue;
  //if lcxUsuarioPara.EditModified then
    Event.ParentID := lcxUsuarioPara.EditValue;

end;

function TcxSchedulerEventEditor.GetEventName: string;
begin
  Result := cxGetResourceString(@scxUntitled);
  if Event.Caption <> '' then
    Result := Event.Caption;
end;

procedure TcxSchedulerEventEditor.OnChanged(Sender: TObject);
begin
  FModified := True;
end;

procedure TcxSchedulerEventEditor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  AMsgRes: Integer;
begin
  CanClose := (ModalResult = mrOk) or not Modified;
  if not CanClose then
  begin
    if ModalResult = mrAbort then
      CanClose := MessageDlg(cxGetResourceString(@scxDeleteConfirmation),
        mtWarning, [mbYes, mbNo], 0) = mrYes
    else
      if ModalResult = mrCancel then
      begin
        AMsgRes := MessageDlg(cxGetResourceString(@scxExitConfirmation),
          mtWarning, [mbYes, mbNo, mbCancel], 0);
        CanClose := AMsgRes in [mrYes, mrNo];
        if AMsgRes = mrYes then
          ModalResult := mrOk;
      end;
    if not CanClose then
      ModalResult := mrNone;
  end;
  if ModalResult = mrOk then
    CanClose := IsValid;
end;

procedure TcxSchedulerEventEditor.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) and not IsInternalPopupWindowShowed(ActiveControl) then
  begin
    ModalResult := mrCancel;
    Key := 0;
  end;
end;

procedure TcxSchedulerEventEditor.FormActivate(Sender: TObject);
begin
  OnActivate := nil;
{  if RecurrenceActivate then
    btnRecurrenceClick(nil);}
end;

procedure TcxSchedulerEventEditor.cbAllDayEventPropertiesChange(
  Sender: TObject);
const
  States: array[Boolean] of Byte = (tlsBusy, tlsFree);
var
  ACanCorrect: Boolean;
begin
  ACanCorrect := icbShowTimeAs.ItemIndex = States[Event.AllDayEvent];
  Event.AllDayEvent := cbAllDayEvent.Checked;
  if ACanCorrect then
    icbShowTimeAs.ItemIndex := States[Event.AllDayEvent];
  FModified := True;
  CheckVisible;
end;

procedure TcxSchedulerEventEditor.StartDateChanged(Sender: TObject);
begin
  OnChanged(nil);
  deEnd.Date := DateOf(deStart.Date + 1 + teStart.Time + 1 * HourToTime);
  teEnd.Time := TimeOf(teStart.Time + 1 * HourToTime);
end;

procedure TcxSchedulerEventEditor.SetReadOnly(AValue: Boolean);
begin
  if FReadOnly <> AValue then
  begin
    pnlCaption.Enabled := not AValue;
    pnlReminder.Enabled := not AValue;
    pnlTime.Enabled := not AValue;
    pnlResource.Enabled := not AValue;
    meMessage.Properties.ReadOnly := AValue;
    btnCancel.Enabled := not AValue;
    btnDelete.Enabled := not AValue and btnDelete.Enabled;
    lcxUsuarioPara.Enabled := not (not AValue and btnDelete.Enabled);
    FReadOnly := AValue;
  end;
end;

procedure TcxSchedulerEventEditor.btnAlterarImoveisClick(Sender: TObject);
var
  AOccurrence: Boolean;
begin
  if not Assigned(FOnDeleteFunc) or FOnDeleteFunc(Event) then
  begin
    if (Event.Pattern <> nil) and Event.IsRecurring then
      if not ForceSeries then
      begin
        if not cxShowRecurrenceSelectionDialog(Event, rsmDeleting, btnOk.LookAndFeel,
          AOccurrence) then Exit;
        FDeleteSeries := not AOccurrence;
      end
      else
        FDeleteSeries := True;
    ModalResult := mrAbort;
  end;
end;

initialization
  RegisterClass(TBevel);

end.
