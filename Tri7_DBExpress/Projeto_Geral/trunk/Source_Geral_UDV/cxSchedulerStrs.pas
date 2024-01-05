{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{                   ExpressScheduler                                 }
{                                                                    }
{       Copyright (c) 2003-2004 Developer Express Inc.               }
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

unit cxSchedulerStrs;

{$I cxSchedulerVer.Inc}

interface

resourcestring
  scxUntitledEvent = 'Untitled event';

  scxVertical   = 'Vertical';
  scxHorizontal = 'Horizontal';
  scxTimeGrid   = 'Grade de Tempo';

  scxMinute  = 'Minuto';
  scxMinutes = 'Minutos';
  scxHour    = 'Hora';
  scxHours   = 'Horas';

  // dialogs constants
  scxDeleteRecurringEventDescription = '� um evento retornar. Voc� quer suprimir somente esta ocorr�ncia ou a s�rie?';
  scxEditRecurringEventDescription   = '� um evento retornar. Voc� quer abrir somente esta ocorr�ncia ou a s�rie?';

  scxGoToDateDialogCaption     = 'Ir para Data';
  scxDeleteTypeDialogCaption   = 'Confirma Exclus�o';
  scxDeleteTypeOccurrenceLabel = 'Deletar Registro';
  scxDeleteTypeSeriesLabel     = 'Deletar esta s�rie';
  scxEditTypeDialogCaption     = 'Artigo retornando aberto';
  scxEditTypeOccurrenceLabel   = 'Abrir esta ocorr�ncia';
  scxEditTypeSeriesLabel       = 'Abrir a s�rie';

  scxExitConfirmation  = 'Voc� quer conservar mudan�as?';
  scxDeleteConfirmation= 'Este artigo foi mudado. � voc� certo voc� quer suprimi-lo?';
  scxWrongTimeBounds   = 'A data onde da extremidade voc� incorporou ocorre antes da data do come�o.';
  scxWrongPattern      = 'O teste padr�o do retorno � inv�lido.';
  scxReplaceOccurrenceDate = 'Certos meses t�m menos do que dias de %s. Por estes meses, a ocorr�ncia cair� no �ltimo dia do m�s.';
  scxInvalidRecurrenceDuration = 'A dura��o do evento deve ser mais curta do que como freq�entemente ocorre. ' +
    'Encurtar a dura��o, ou mudar o teste padr�o do retorno na caixa de di�logo do retorno.';
  scxConfirmLostExceptions = 'Todas as exce��es associaram com este evento retornando ser�o perdidas. � esta APROVA��O?';

  scxEvent             = 'Evento';
  scxUntitled          = 'Sem T�tulo';

  scxNoneEvent         = 'Evento Simples';
  scxRecurrenceEvent   = 'Evento de Retorno';
  scxExceptionEvent    = 'Evento Exce��o';
  scxOccurenceEvent    = 'Evento de Ocorr�ncia';

  scxAdd               = '&Adicionar';
  scxEdit              = '&Editar';
  scxDelete            = '&Deletar';
  scxRecurrence        = '&Retornar';

  scxDate              = '&Data:';
  scxShowIn            = '&Mostrar Dento:';
  scxDayCalendar       = 'Calend�rio por Dia';
  scxWeekCalendar      = 'Calend�rio por Semana';
  scxMonthCalendar     = 'Calend�rio por M�s';
  scxWorkWeekCalendar  = 'Calend�rio da Semana de Trabalho';

  scxResource          = 'Recurso';
  scxSubject           = 'Assunto:';
  scxLocation          = 'Posi��o:';
  scxLabel             = 'Preenchimento:';
  scxStartTime         = 'Inicio do Evento:';
  scxEndTime           = 'Fim do Evento:';
  scxAllDayEvent       = 'Todos eventos do dia:';

  scxReminder          = 'Lembrete:';
  scxShowTimeAs        = 'Mostrar �s:';

  scxSuffixMinutes     = 'minutos';
  scxSuffixHour        = 'horas';
  scxSuffixHours       = 'horas';
  scxSuffixDay         = 'dia';
  scxSuffixDays        = 'dias';
  scxSuffixWeek        = 'semana';
  scxSuffixWeeks       = 'semanas';

  scxBusy              = 'Agenda';
  scxFree              = 'Lembrete';
  scxTentative         = 'Para Todos';
//  scxOutOfOffice       = 'Chamado';

  scxRecurrenceCaption = 'Retorno do evento';
  scxEventTime         = ' Tempo do Evento ';
  scxRecurrencePattern = ' Teste padr�o do retorno ';
  scxRangeOfRecurrence = ' Escala do retorno ';
  scxStart             = '&Inicio:';
  scxStart1            = 'Iniciar:';
  scxEnd               = 'Fim:';
  // Pattern
  scxDaily             = 'Di�rio';
  scxWeekly            = 'Semanal';
  scxMonthly           = 'Mensal';
  scxYearly            = 'Anual';
  // daily
  scxEvery             = 'Cada';
  scxEveryWeekDay      = 'Cada dia da Semana';
  scxDays              = 'dia(s)';
  // weekly
  scxWeeksOn           = 'na semana(s):';
  scxRecurEvery        = 'Retornar cada';
  //monthly
  scxOfEvery           = 'de cada';
  scxMonths            = 'm�s(s)';
  // yearly
  scxThe               = 'o';
  scxOf                = 'de';

  // other
  scxFirst             = 'primeiro';
  scxSecond            = 'segundo';
  scxThird             = 'terceiro';
  scxFourth            = 'quarto';
  scxLast              = '�ltimo';
  scxDay               = 'Dia';
  scxDay1              = 'dia';
  scxWeekday           = 'dia da semana';
  scxWeekendday        = '�ltima dia da semana';
  scxNoEndDate         = '&nenhuma data do final';
  scxEndAfter          = 'Ap�s fim:';
  scxEndBy             = 'por fim:';
  scxOccurences        = 'ocorr�ncias';

  // buttons
  scxOk                = 'OK';
  scxCancel            = 'Cancelar';
  scxClose             = 'Fechar';
  scxDown              = 'Para baixo';
  scxRemoveRecur       = 'Apagar retorno';
  scxUp                = 'Para cima';
  //
  scxResourceLayoutCaption = 'Editor da disposi��o dos recursos';

  // popup menu resources
  scxpmNewEvent          = 'Novo evento';
  scxpmNewAllDayEvent    = 'Novo evento para o dia todo';
  scxpmNewRecurringEvent = 'Novo evento retornado';
  scxpmToday             = 'Hoje';
  scxpmGotoThisDay       = 'Ir a este dia';
  scxpmGoToDate          = 'Ir para data�';
  scxpmResourcesLayout   = 'Editor da disposi��o dos recursos...';

  // for event
  scxpmOpen              = 'Abrir';
  scxpmEditSeries        = 'Editar S�rie';
  scxpmShowTimeAs        = 'Mostrar Hora como';
  scxpmDelete            = 'Apagar';
  scxpmFree              = 'Lembrete';
  scxpmTentative         = 'Para Todos';
  scxpmBusy              = 'Agenda';
  scxpmOutOfOffice       = 'Agenda (Prioridade)';
  scxpmLabel             = 'T�tulo';

  // event label captions
  scxEventLabelNone      = 'Nenhum';
  scxEventLabel0         = 'Importante';
  scxEventLabel1         = 'Neg�cio (Trabalho)';
  scxEventLabel2         = 'Pessoal';
//  scxEventLabel3         = 'F�rias';
  scxEventLabel4         = 'Suporte';
//  scxEventLabel5         = 'Curso';
//  scxEventLabel6         = 'Necessidades';
//  scxEventLabel7         = 'Anivers�rio Fam�lia';
//  scxEventLabel8         = 'Anivers�rio Outros';
//  scxEventLabel9         = 'Telefonar';

  // for time ruler menu items
  scxpmTimeZone          = 'Mudar a zona de tempo';
  scxpm60Minutes         = '60 Minutos';
  scxpm30Minutes         = '30 Minutos';
  scxpm15Minutes         = '15 Minutos';
  scxpm10Minutes         = '10 Minutos';
  scxpm6Minutes          = '6 Minutos';
  scxpm5Minutes          = '5 Minutos';

  //for reminder
  scxrCaptionReminder  = '1 Lembrete';
  scxrCaptionReminders = '%d Lembretes';
  scxrDismissButton    = 'Demitir';
  scxrDismissAllButton = 'Demitir Todos';
  scxrDueIn            = 'Devido dentro';
  scxrOpenItemButton   = 'Abrir o Item';
  scxrSnoozeButton     = '&Snooze';
  scxrSubject          = 'Assunto';
  scxrSnoozeLabel      = '&Snooze';
  scxrSelected         = '%d Lembretes selecionados';
  scxrStartTime        = 'Iniciar em: %s';

  // time
  scxTime0m     = '0 minutos';
  scxTime5m     = '5 minutos';
  scxTime10m    = '10 minutos';
  scxTime15m    = '15 minutos';
  scxTime20m    = '20 minutos';
  scxTime30m    = '30 minutos';
  scxTime1h     = '1 hora';
  scxTime2h     = '2 horas';
  scxTime3h     = '3 horas';
  scxTime4h     = '4 horas';
  scxTime5h     = '5 horas';
  scxTime6h     = '6 horas';
  scxTime7h     = '7 horas';
  scxTime8h     = '8 horas';
  scxTime9h     = '9 horas';
  scxTime10h    = '10 horas';
  scxTime11h    = '11 horas';
  scxTime12h    = '12 horas';
  scxTime18h    = '18 horas';
  scxTime1d     = '1 dia';
  scxTime2d     = '2 dias';
  scxTime3d     = '3 dias';
  scxTime4d     = '4 dias';
  scxTime1w     = '1 semana';
  scxTime2w     = '2 semanas';

  // for export

  secxExportStorageInvalid = 'Armazenamento n�o atribu�do';

  // card field names

  secxYes         = 'Sim';
  secxNo          = 'N�o';
  secxSubject     = 'Assunto';
  secxLocation    = 'Posi��o';
  secxDescription = 'Descri��o';
  secxAllDay      = 'Todos os dias';
  secxStart       = 'Inicio';
  secxFinish      = 'Fim';
  secxState       = 'Status';
  secxReminder    = 'Lembrete';

  // table fields


  secxStartDate          = 'StartDate';
  secxStartTime          = 'StartTime';
  secxEndDate            = 'EndDate';
  secxEndTime            = 'EndTime';
  secxAlldayevent        = 'Alldayevent';
  secxReminderonoff      = 'Reminderonoff';
  secxReminderDate       = 'ReminderDate';
  secxReminderTime       = 'ReminderTime';
  secxMeetingOrganizer   = 'MeetingOrganizer';
  secxRequiredAttendees  = 'RequiredAttendees';
  secxOptionalAttendees  = 'OptionalAttendees';
  secxMeetingResources   = 'MeetingResources';
  secxBillingInformation = 'BillingInformation';
  secxCategories         = 'Categories';
  secxMileage            = 'Mileage';
  secxPriority           = 'Priority';
  secxPrivate            = 'Private';
  secxSensitivity        = 'Sensitivity';
  secxShowtimeas         = 'Showtimeas';

  secxNormal             = 'Normal';

  // storage
  scxRequiredFieldsNeeded = 'The following required fields'#13#10'%sare not assigned!';
  scxInvalidFieldName = 'Invalid field name';
  scxInvalidCustomField = 'Invalid custom field';

const
  sRangeNames: array[0..4] of Pointer =
    (@scxFirst, @scxSecond, @scxThird, @scxFourth, @scxLast);
  sDayNames: array [0..9] of string =
    (scxDay, scxWeekday, scxWeekendday, '', '', '', '', '', '', '');
  sEventLabelCaptions: array[0..4] of Pointer = (
    @scxEventLabelNone, @scxEventLabel0, @scxEventLabel1, @scxEventLabel2,
    @scxEventLabel4);
{  sEventLabelCaptions: array[0..10] of Pointer = (
    @scxEventLabelNone, @scxEventLabel0, @scxEventLabel1, @scxEventLabel2,
    @scxEventLabel3, @scxEventLabel4, @scxEventLabel5, @scxEventLabel6,
    @scxEventLabel7, @scxEventLabel8, @scxEventLabel9);}


procedure cxSchedulerInitStrings;

implementation

uses
  SysUtils;

procedure cxSchedulerInitStrings;
var
  I: Integer;
begin
  for I := 1 to 7 do
    sDayNames[2 + I] := LongDayNames[I];
end;

initialization
  cxSchedulerInitStrings;

end.
