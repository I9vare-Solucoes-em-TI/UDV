(*************************************************************
  Addict 4.0,  (c) 1996-2014, Addictive Software
  Contact: addictsw@kagi.com
  *************************************************************
  Parser class for WPTools 4, 5, 6 and 7 -  http:/www.wptools.de
  *************************************************************
  WPTools is a powerful suite of components to do word processing,
  HTML editing and RTF reporting. It supports WYSIWYG, tables,
  nested tables, WYSIWYG editable headers and footers, movable images
  and also spell-as-you-go!
  It supports paragraph styles, split screen, many layout modes
  and fast zooming.
  The "premium" edition also does footnotes and text boxes ("frames")
  *************************************************************

History:
23-Mar-00   - Michael Novak  - Initial Write
25-Feb-02   - Julian Ziersch - adaption for WPTools4,
  You now only need to add the unit ad3WPTools and the SpellCheck actions
  provided with WPTools4 will automatically start and stop spellcheck
22-Mar-02	  - Michael Novak - minor updates.
24-Nov-03  - Michael Novak - major updates.
  Checking multiple WPTools controls from the same instance of Addict should now
  be properly supported.  If the WPTools SpellCheck actions are used, they
  should now automatically pick up the version of Addict that exists in the
  hosting application.
16-Feb-04 - Michael Novak - minor updates.
01-Jun-04 - Julian Ziersch - implemented changes required for WPTools Version 5.
  The changes use conditional compilation: {$IFDEF WPTOOLS5} ... {$ELSE}  {$ENDIF}
23-Jul-04 - Julian Ziersch - added some fixes
30-Aug-04 - Julian Ziersch - (bugfix: ignore word, internal range error)
07-Sept-05 - Julian Ziersch - (added support for WPTools 5.18.5 property WPAT_ParFlag=WFLG_NOPROOF )
01-April-06
13-June-2006
14-Nov-2006 - Added a fix for AutoCorrect suggested by Julian Ziersch
28-Feb-2014 - Added a fix for WPTools 7 support suggested by Julian Ziersch
**************************************************************)

unit WPTAddict;

{$I addict3.inc}
{$I WPINC.INC} // WPTools Standard Include file
{.$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q+,R+,S-,T-,U-,V+,W-,X+,Y+,Z1}

interface

uses
     windows, sysutils, classes, controls,
{$IFDEF WP7}
     WPRTEDefsConsts, WPRTEEdit,
{$ENDIF}
{$IFDEF WPTOOLS5}
     WPCtrMemo, WPRteDefs,
{$ELSE}
     wpWinCtr, wpRTFPa, wpDefs, WPRtfInp,
{$ENDIF}
     ad3SpellBase, ad3ParserBase, ad3Ignore,
     ad3Thesaurus, ad3ThesaurusBase, ad3Configuration, ad4Live, System.Types;

type
     //************************************************************
     // 2nd Generation WPTools parser
     //************************************************************

     TWPToolsControlParser = class (TControlParser2)
     protected
          FEdit: TWPCustomRtfEdit;
          FEnd: LongInt;
          FUsingEnd: Boolean;
          FPerformingUndo: Boolean;
     protected
          procedure IgnoreWordAttr (MarkCorrect: Boolean);
     public
          procedure Initialize (EditControl: Pointer); override;
          function GetChar: char; override;
          function GetLine: string; override;
          function MoveNext: Boolean; override;
          function MovePrevious: Boolean; override;
          procedure SetPosition (XPos: LongInt; YPos: LongInt; PosType: TPositionType); override;
          procedure GetPosition (var XPos: LongInt; var YPos: LongInt); override;
          procedure SelectWord (Length: LongInt); override;
          procedure ReplaceWord (Replacement: string; State: LongInt); override;
          procedure IgnoreWord (State: LongInt); override;
          procedure CenterSelection; override;
          procedure GetCursorPosition (var XPos: LongInt; var YPos: LongInt); override;
          procedure GetSelectionPosition (var XPosStart: LongInt; var YPosStart: LongInt; var XPosEnd: LongInt; var YPosEnd: LongInt); override;
          procedure GetControlScreenPosition (var ControlPosition: TRect); override;
          procedure GetSelectionScreenPosition (var SelectionPosition: TRect); override;
          procedure UndoLast (State: LongInt; UndoAction: LongInt; var UndoData: LongInt); override;
          function GetControl: TComponent; override;
          property EditControl: TWPCustomRtfEdit read FEdit;
     end;

     //************************************************************
     // WPTools Specific Ignore Object
     //************************************************************

     TWPToolsHiddenTextIgnore = class (TParserIgnoreBase)
     public
          function NeededBeforeCheck: Boolean; override;
          function ExecuteIgnore (CurrentChar: Char; Parser: TControlParser): Boolean; override;
     end;

     //************************************************************
     // AddictSpell WPTools per-instance integration component
     //************************************************************

     TWPTAddictInstance = class (TObject)
     protected
          FLiveControl: TWPCustomRtfEdit;
          FDestroying: Boolean;
          FAddictSpell: TAddictSpellBase;
          FLiveMenuOptions: TSpellPopupOptions;
          FLiveSpell: Boolean;
          FLiveCorrect: Boolean;
          FMenuShowing: Boolean;
          FOldOnSpellCheckWord: TSpellCheckWordEvent;
{$IFDEF WPTOOLS5}
          FOldOnMouseDownRight: TWPMouseDownRightEvent;
{$ELSE}
          FOldOnMouseDownRight: TMouseDownRightEvent;
{$ENDIF}
          FOldOnAfterCompleteWord: TWPAfterCompleteWordEvent;
     protected
          procedure WriteLiveControl (Control: TWPCustomRtfEdit);
          procedure WriteLiveSpell (NewLiveSpell: Boolean);
          procedure WriteAddictSpell (AddictSpell: TAddictSpellBase); virtual;
{$IFDEF WPTOOLS5}
          procedure WPOnSpellCheckWord (Sender: TObject; var Word: WideString;
               var Res: TSpellCheckResult; var Hyphen: TSpellCheckHyphen;
               par: TParagraph; posinpar: Integer);
          procedure WPOnMouseDownRight (Sender: TObject;
               Button: TMouseButton; Shift: TShiftState;
               X, Y: Integer; par: TParagraph;
               posinpar: Integer; Pos: Integer; len: Integer; var text: string;
               var atr: Cardinal; var Abort: Boolean);
{$ELSE}
          procedure WPOnSpellCheckWord (Sender: TObject; Word: string; var Res: TSpellCheckResult; var Hyphen: TSpellCheckHyphen);
          procedure WPOnMouseDownRight (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, pos, len: Integer; var text: string; var atr: TAttr);
{$ENDIF}
          procedure WPOnAfterCompleteWord (Sender: TObject; var lastchar: Char);
          procedure RemoveLiveSpellHilight;
     public
          constructor Create;
          destructor Destroy; override;
          procedure CheckAgain;
          property LiveControl: TWPCustomRtfEdit read FLiveControl write WriteLiveControl;
          property Destroying: Boolean read FDestroying write FDestroying;
          property AddictSpell: TAddictSpellBase read FAddictSpell write WriteAddictSpell;
          property LiveMenuOptions: TSpellPopupOptions read FLiveMenuOptions write FLiveMenuOptions;
          property LiveSpell: Boolean read FLiveSpell write WriteLiveSpell;
          property LiveCorrect: Boolean read FLiveCorrect write FLiveCorrect;
     end;

     //************************************************************
     // AddictSpell WPTools global integration component
     //************************************************************

     TWPTAddict = class (TComponent)
     protected
          FInstances: TList;
          FDeleting: Boolean;
          FOldOptions: TSpellOptions;
          FLiveSpell: Boolean;
          FLiveCorrect: Boolean;
          FLiveOptions: Boolean;
          FLiveMenuOptions: TSpellPopupOptions;
          FAddictSpell: TAddictSpellBase;
          FAddictThesaurus: TAddictThesaurusBase;
          FCreatedSpell: TAddictSpellBase;
          FCreatedThesaurus: TAddictThesaurusBase;
     protected
          procedure Notification (AComponent: TComponent; Operation: TOperation); override;

          procedure OnConfigChanged (Sender: TObject); virtual;
          procedure OnAddCustomIgnore (Sender: TObject); virtual;

          procedure WriteLiveSpelling (Live: Boolean); virtual;
          procedure WriteLiveCorrect (Correct: Boolean); virtual;
          procedure WriteLiveOptions (Options: Boolean); virtual;
          procedure WriteLiveMenuOptions (Options: TSpellPopupOptions); virtual;
          procedure WriteAddictSpell (AddictSpell: TAddictSpellBase); virtual;
          procedure WriteAddictThesaurus (AddictThesaurus: TAddictThesaurusBase); virtual;

          function FindInstance (Control: TWPCustomRtfEdit): Integer; virtual;
          procedure UpdateInstance (Instance: TWPTAddictInstance; Recheck: Boolean); virtual;
          procedure UpdateInstances (ForceChange: Boolean); virtual;

     public
          constructor Create (AOwner: TComponent); override;
          destructor Destroy; override;

          procedure AddLiveControl (LiveControl: TWPCustomRtfEdit);
          procedure RemoveLiveControl (LiveControl: TWPCustomRtfEdit);

          procedure Check (Control: TWPCustomRtfEdit; CheckType: TCheckType);
          procedure CheckWinControl (Control: TWinControl; CheckType: TCheckType);
          procedure Lookup (Control: TWPCustomRtfEdit);
          procedure LookupWinControl (Control: TWinControl);

          procedure DoSpellCheck (Sender: TObject; Mode: TWPStartSpellcheckMode);

          property AddictSpell: TAddictSpellBase read FAddictSpell write WriteAddictSpell;
          property AddictThesaurus: TAddictThesaurusBase read FAddictThesaurus write WriteAddictThesaurus;

          property LiveSpelling: Boolean read FLiveSpell write WriteLiveSpelling;
          property LiveCorrect: Boolean read FLiveCorrect write WriteLiveCorrect;
          property LiveSpellingOptions: Boolean read FLiveOptions write WriteLiveOptions;
          property LiveMenuOptions: TSpellPopupOptions read FLiveMenuOptions write WriteLiveMenuOptions;
     end;

procedure CheckWPTools (AddictSpell: TAddictSpellBase; Control: TWPCustomRtfEdit; CheckType: TCheckType);
procedure LookupWPTools (AddictThesaurus: TAddictThesaurusBase; Control: TWPCustomRtfEdit);

var
     WPAddict: TWPTAddict;

implementation

//************************************************************
// AddictSpell WPTools utility functions
//************************************************************

procedure CheckWPTools (AddictSpell: TAddictSpellBase; Control: TWPCustomRtfEdit; CheckType: TCheckType);
var
     Parser: TWPToolsControlParser;
begin
     if (Assigned (AddictSpell) and Assigned (Control)) then
     begin
          Parser := TWPToolsControlParser.Create;
          Parser.Initialize (Control);
          AddictSpell.CheckParser (Parser, CheckType);
          if (not AddictSpell.FreeParser) then
          begin
               Parser.Free;
          end;
     end;
end;

//************************************************************

procedure LookupWPTools (AddictThesaurus: TAddictThesaurusBase; Control: TWPCustomRtfEdit);
var
     Parser: TWPToolsControlParser;
begin
     if (Assigned (AddictThesaurus) and Assigned (Control)) then
     begin
          Parser := TWPToolsControlParser.Create;
          Parser.Initialize (Control);
          AddictThesaurus.LookupParser (Parser);
          Parser.Free;
     end;
end;

//************************************************************
// Private utility functions
//************************************************************
{$IFDEF WPTOOLS5}

procedure WPTIgnoreWord (Edit: TWPCustomRtfEdit; const AWord: string; MarkCorrect: Boolean);
var
     par: TParagraph;
     l, i, j: Integer;
     ca: Cardinal;
begin
     par := Edit.Memo.FirstPar;
     l := Length (AWord);
     if l > 0 then
     begin
          while par <> nil do
          begin
               i := 0;
               while i < par.CharCount - l + 1 do
               begin
                    if par.IsWordDelimiter (i + l) and par.IsWordDelimiter (i - 1) and
                         par.Compare (i, AWord, false) then
                    begin
                         for j := 0 to l - 1 do
                         begin
                              ca := par.CharAttr [i + j];
                              ca := ca and not cafsMisspelled;
                              if (MarkCorrect) then
                                   ca := ca or cafsWasChecked
                              else
                                   ca := ca and not cafsWasChecked;
                              par.CharAttr [i + j] := ca;
                         end;
                         inc (i, l);
                    end
                    else
                         inc (i);
               end;
               par := par.next;
          end;
     end;
     Edit.Repaint;
end;
{$ELSE WPTOOLS5}

procedure WPTIgnoreWord (Edit: TWPCustomRtfEdit; const AWord: string; MarkCorrect: Boolean);
var
     par: PTParagraph;
     lin: PTLine;
     pc: PChar;
     l, i, j: Integer;
     pa: PTAttr;
     buf: array [0..256] of Char;

     function IsSpace (ppc: PChar): Boolean;
     begin
          Result := (ppc^ <= #32) or (ppc^ = '.') or (ppc^ = ',') or (ppc^ = '!') or
               (ppc^ = '?');
     end;

begin
     par := Edit.Memo.FirstPar;
     StrPLCopy (buf, AWord, 256);
     l := Length (AWord);
     if l > 0 then
     begin
          while par <> nil do
          begin
               lin := par^.line;
               while lin <> nil do
               begin
                    i := 0;
                    pc := lin^.pc;
                    pa := lin^.pa;
                    if pa <> nil then
                    begin
                         while i < lin^.plen - l + 1 do
                         begin
                              if StrlIComp (buf, pc, l) = 0 then
                              begin
                                   if IsSpace (pc + l) and ((i = 0) or ISSpace (pc - 1)) then
                                   begin
                                        j := 0;
                                        while j < l do
                                        begin
                                             exclude (pa^.style, afsMisspelled);
                                             if (MarkCorrect) then
                                             begin
                                                  include (pa^.style, afsWasChecked);
                                             end
                                             else
                                             begin
                                                  exclude (pa^.style, afsWasChecked);
                                             end;
                                             inc (pa);
                                             inc (pc);
                                             inc (j);
                                             inc (i);
                                        end;
                                   end;
                              end;
                              inc (pa);
                              inc (pc);
                              inc (i);
                         end;
                    end;
                    lin := lin^.next;
               end;
               par := par^.next;
          end;
     end;
     Edit.Memo.Repaint;
end;
{$ENDIF}

//************************************************************
// 2nd Generation WPTools parser
//************************************************************
{$IFDEF WPTOOLS5}

procedure TWPToolsControlParser.IgnoreWordAttr (MarkCorrect: Boolean);
begin
     if MarkCorrect then
     begin
          FEdit.TextCursor.SelectedTextAttr.SetCAFSStyle (cafsWasChecked, cafsMisSpelled);
     end
     else
          FEdit.TextCursor.SelectedTextAttr.SetCAFSStyle (0, cafsMisSpelled);
end;
{$ELSE}

procedure TWPToolsControlParser.IgnoreWordAttr (MarkCorrect: Boolean);
var
     A: TAttr;
begin
     A.Style := [afsMisspelled];
     FEdit.ChangeAttr (A, [wtcSubStyle]);
     if (MarkCorrect) then
     begin
          A.Style := [afsWasChecked];
          FEdit.ChangeAttr (A, [wtcAddStyle]);
     end;
end;
{$ENDIF}

//************************************************************
// TControlParser Implementation
//************************************************************

procedure TWPToolsControlParser.Initialize (EditControl: Pointer);
begin
     FEdit := TWPCustomRtfEdit (EditControl);
     FUsingEnd := False;
end;

//************************************************************

{$IFDEF WPTOOLS5}

function TWPToolsControlParser.GetChar: char;
begin
     if FEdit.TextCursor.active_posinpar < 0 then
          FEdit.TextCursor.active_posinpar := 0;
     if (afsHidden in FEdit.CPAttr.Style) then
     begin
          Result := ' ';
     end
     else
     begin
          Result := FEdit.CPChar;
     end;
end;
{$ELSE}

function TWPToolsControlParser.GetChar: char;
begin
     if (afsHidden in FEdit.CPAttr^.Style) then
     begin
          Result := ' ';
     end
     else
     begin
          Result := FEdit.CPChar^;
     end;
end;
{$ENDIF}

//************************************************************

function TWPToolsControlParser.GetLine: string;
begin
     Result := FEdit.CPLine;
end;

//************************************************************

function TWPToolsControlParser.MoveNext: Boolean;
begin
{$IFDEF WPTOOLS5}
     FEdit.HideSelection;
     repeat
          Result := FEdit.CPMoveNext;
          // we use the WPAT_ParFlag property here (requires WPTools V5.18.5 or later)
          // we use the constants  WPAT_ParFlag=127; WFLG_NOPROOF = 4;
     until (not Result) or ((FEdit.ActiveParagraph.AGetDef (127, 0) and 4) = 0);
{$ELSE}
     Result := FEdit.CPMoveNext;
{$ENDIF}
     if FUsingEnd and (FEdit.CPPosition > FEnd) then
     begin
          Result := False;
     end;
end;

//************************************************************

function TWPToolsControlParser.MovePrevious: Boolean;
begin
     Result := FEdit.CPMoveBack;
end;

//************************************************************

procedure TWPToolsControlParser.SetPosition (XPos: LongInt; YPos: LongInt; PosType: TPositionType);
begin
     if (PosType = ptCurrent) then
     begin
          FEdit.CPPosition := XPos;
     end
     else if (PosType = ptEnd) then
     begin
          FUsingEnd := True;
          FEnd := XPos;
     end;
end;

//************************************************************

procedure TWPToolsControlParser.GetPosition (var XPos: LongInt; var YPos: LongInt);
begin
     YPos := 0;
     XPos := FEdit.CPPosition;
end;

//************************************************************

procedure TWPToolsControlParser.SelectWord (Length: LongInt);
var
     NewPos: LongInt;
begin
     NewPos := FEdit.CPPosition - Length;
     FEdit.CPPosition := NewPos;
     FEdit.SetSelPosLen (FEdit.CPPosition, Length);
     FEdit.CPPosition := NewPos;
{$IFDEF WPTOOLS5}
     FEdit.ShowCursor;
{$ENDIF}
end;

//************************************************************

procedure TWPToolsControlParser.ReplaceWord (Replacement: string; State: LongInt);
begin
     IgnoreWordAttr (not FPerformingUndo);

     if (FUsingEnd) then
     begin
          FEnd := FEnd + (Length (Replacement) - Length (FEdit.SelText));
     end;

     FEdit.SelText := Replacement;
     FEdit.CPPosition := FEdit.SelStart + Length (Replacement);
     //FEdit.Change;
end;

//************************************************************

procedure TWPToolsControlParser.IgnoreWord (State: LongInt);
begin
     if (State = IgnoreState_Ignore) then
     begin
          IgnoreWordAttr (not FPerformingUndo);
     end
     else if (State = IgnoreState_IgnoreAll) or (State = IgnoreState_Add) then
     begin
          WPTIgnoreWord (FEdit, FEdit.SelText, not FPerformingUndo);
     end;
{$IFDEF WPTOOLS5}
     FEdit.CPPosition := FEdit.SelStart + FEdit.SelLength;
{$ELSE}
     FEdit.CPPosition := FEdit.SelStart + Length (FEdit.SelText);
{$ENDIF}
end;

//************************************************************

procedure TWPToolsControlParser.CenterSelection;
begin
end;

//************************************************************

procedure TWPToolsControlParser.GetCursorPosition (var XPos: LongInt; var YPos: LongInt);
begin
     XPos := FEdit.CPPosition;
     YPos := 0;
end;

//************************************************************

procedure TWPToolsControlParser.GetSelectionPosition (var XPosStart: LongInt; var YPosStart: LongInt; var XPosEnd: LongInt; var YPosEnd: LongInt);
begin
     if (FEdit.SelLength > 0) then
     begin
          XPosStart := FEdit.SelStart;
          XPosEnd := XPosStart + FEdit.SelLength;
     end
     else
     begin
          XPosStart := FEdit.CPPosition;
          XPosEnd := XPosStart;
     end;
     YPosStart := 0;
     YPosEnd := 0;
end;

//************************************************************

procedure TWPToolsControlParser.GetControlScreenPosition (var ControlPosition: TRect);
var
     P: TPoint;
begin
     P := Point (0, 0);
     P := FEdit.ClientToScreen (P);
     ControlPosition := Rect (P.X, P.Y, P.X + FEdit.Width, P.Y + FEdit.Height);
end;

//************************************************************
{$IFDEF WPTOOLS5}

procedure TWPToolsControlParser.GetSelectionScreenPosition (var SelectionPosition: TRect);
begin
     SelectionPosition := FEdit.SelRect;
     SelectionPosition.TopLeft := FEdit.ClientToScreen (SelectionPosition.TopLeft);
     SelectionPosition.BottomRight := FEdit.ClientToScreen (SelectionPosition.BottomRight);
end;
{$ELSE}

procedure TWPToolsControlParser.GetSelectionScreenPosition (var SelectionPosition: TRect);
var
     P: TPoint;
begin
     with (FEdit.RTFText as TWPRTFTextPaint) do
     begin
          if (block_e_par = nil) or (block_e_par = nil) then
          begin
               SelectionPosition.Left := -1; (* abort *)
               exit;
          end;
          if block_reverse then
          begin
               P.X := Get_X_from_Cp (block_e_par, block_e_lin, block_e_cp) + left_offset;
               P.Y := Get_Y_from_Lin (block_e_lin) - top_offset;
          end
          else
          begin
               if (block_s_cp >= block_s_lin^.plen) and (block_s_lin^.next <> nil) then
               begin
{$IFDEF WPV3}
                    exclude (block_s_lin^.state, listIsSelected);
{$ENDIF}
                    block_s_cp := 0;
                    block_s_lin := block_s_lin^.next;
               end;
               P.X := Get_X_from_Cp (block_s_par, block_s_lin, block_s_cp) + left_offset;
               P.Y := Get_Y_from_Lin (block_s_lin) - top_offset;
          end;
          P.Y := TwipToScreen (P.Y);
     end;
     P := FEdit.ClientToScreen (P);
     SelectionPosition.Left := P.X;
     SelectionPosition.Top := P.Y;
     with (FEdit.RTFText as TWPRTFTextPaint) do
     begin
          if not block_reverse then
          begin
               P.X := Get_X_from_Cp (block_e_par, block_e_lin, block_e_cp) + left_offset;
               P.Y := Get_Y_from_Lin (block_e_lin) - top_offset + block_e_lin^.Height;
          end
          else
          begin
               P.X := Get_X_from_Cp (block_s_par, block_s_lin, block_s_cp) + left_offset;
               P.Y := Get_Y_from_Lin (block_s_lin) - top_offset + block_e_lin^.Height;
          end;
          P.Y := TwipToScreen (P.Y);
     end;
     P := FEdit.ClientToScreen (P);
     SelectionPosition.Right := P.X;
     SelectionPosition.Bottom := P.Y;
end;
{$ENDIF}

//************************************************************

procedure TWPToolsControlParser.UndoLast (State: LongInt; UndoAction: LongInt; var UndoData: LongInt);
begin
     FPerformingUndo := (State = UndoState_BeforeUndo);
end;

//************************************************************

function TWPToolsControlParser.GetControl: TComponent;
begin
     Result := FEdit;
end;

//************************************************************
// Hidden Text Ignore Object
//************************************************************

function TWPToolsHiddenTextIgnore.NeededBeforeCheck: Boolean;
begin
     Result := True;
end;

//************************************************************
{$IFDEF WPTOOLS5}

function TWPToolsHiddenTextIgnore.ExecuteIgnore (CurrentChar: Char; Parser: TControlParser): Boolean;
begin
     Result := (Parser is TWPToolsControlParser) and
          (afsHidden in
          (Parser as TWPToolsControlParser).EditControl.CPAttr.Style) and (Parser.MoveNext);
end;
{$ELSE}

function TWPToolsHiddenTextIgnore.ExecuteIgnore (CurrentChar: Char; Parser: TControlParser): Boolean;
begin
     Result := (Parser is TWPToolsControlParser) and
          (afsHidden in
          (Parser as TWPToolsControlParser).EditControl.CPAttr^.Style) and (Parser.MoveNext);
end;
{$ENDIF}

//************************************************************
// AddictSpell WPTools per-instance integration component
//************************************************************

constructor TWPTAddictInstance.Create;
begin
     FLiveControl := nil;
     FDestroying := False;
     FAddictSpell := nil;
     FLiveMenuOptions := [spDialog, spAutoCorrect, spAdd, spIgnoreAll, spIgnore, spReplace];
     FLiveSpell := True;
     FLiveCorrect := True;

     FMenuShowing := False;
end;

//************************************************************

destructor TWPTAddictInstance.Destroy;
begin
     LiveControl := nil; // calls WriteLiveControl
     inherited Destroy;
end;

//************************************************************

procedure TWPTAddictInstance.WriteLiveControl (Control: TWPCustomRtfEdit);
begin
     if (Assigned (LiveControl)) then
     begin
          if (not (FDestroying)) then
          begin
{$IFDEF WPTOOLS5}
               FLiveControl.Memo._3RDPartyOnSpellCheckWord := FOldOnSpellCheckWord;
               FLiveControl._3RDParty_OnMouseDownWord := FOldOnMouseDownRight;
{$ELSE}
               FLiveControl.OnSpellCheckWord := FOldOnSpellCheckWord;
               FLiveControl.OnMouseDownRight := FOldOnMouseDownRight;
{$ENDIF}
               FLiveControl.AfterCompleteWordEvent := FOldOnAfterCompleteWord;
          end;
          FOldOnSpellCheckWord := nil;
          FOldOnMouseDownRight := nil;
          FOldOnAfterCompleteWord := nil;
          FLiveControl := nil;
     end;
     FLiveControl := Control;
     if (Assigned (FLiveControl)) then
     begin
{$IFDEF WPTOOLS5}
          FOldOnSpellCheckWord := FLiveControl.Memo._3RDPartyOnSpellCheckWord;
          FLiveControl.Memo._3RDPartyOnSpellCheckWord := WPOnSpellCheckWord;
          FOldOnMouseDownRight := FLiveControl._3RDParty_OnMouseDownWord;
          FLiveControl._3RDParty_OnMouseDownWord := WPOnMouseDownRight;
{$ELSE}
          FOldOnSpellCheckWord := FLiveControl.OnSpellCheckWord;
          FLiveControl.OnSpellCheckWord := WPOnSpellCheckWord;
          FOldOnMouseDownRight := FLiveControl.OnMouseDownRight;
          FLiveControl.OnMouseDownRight := WPOnMouseDownRight;
{$ENDIF}
          FOldOnAfterCompleteWord := FLiveControl.AfterCompleteWordEvent;
          FLiveControl.AfterCompleteWordEvent := WPOnAfterCompleteWord;
          if (FLiveSpell) then
          begin
               CheckAgain;
          end;
     end;
end;

//************************************************************

procedure TWPTAddictInstance.WriteLiveSpell (NewLiveSpell: Boolean);
begin
     if (NewLiveSpell <> FLiveSpell) then
     begin
          FLiveSpell := NewLiveSpell;
          if (FLiveSpell) then
          begin
               CheckAgain;
          end
          else
          begin
               if not (FDestroying) then
               begin
                    RemoveLiveSpellHilight;
               end;
          end;
     end;
end;

//************************************************************

procedure TWPTAddictInstance.WriteAddictSpell (AddictSpell: TAddictSpellBase);
begin
     if (FAddictSpell <> AddictSpell) then
     begin
          FAddictSpell := AddictSpell;
          if (Assigned (FAddictSpell)) then
          begin
               CheckAgain;
          end;
     end;
end;

//************************************************************
{$IFDEF WPTOOLS5}

procedure TWPTAddictInstance.WPOnSpellCheckWord (Sender: TObject; var Word: WideString;
     var Res: TSpellCheckResult; var Hyphen: TSpellCheckHyphen;
     par: TParagraph; posinpar: Integer);
begin
     if (Assigned (FAddictSpell)) and FLiveSpell then
     begin
          if (FAddictSpell.WordAcceptable (Word)) then
          begin
               Res := [];
          end
          else
          begin
               Res := [spMisSpelled];
          end;
     end;

     if (Assigned (FOldOnSpellCheckWord)) then
     begin
          FOldOnSpellCheckWord (Sender, Word, Res, Hyphen, par, posinpar);
     end;
end;
{$ELSE}

procedure TWPTAddictInstance.WPOnSpellCheckWord (Sender: TObject; Word: string;
     var Res: TSpellCheckResult; var Hyphen: TSpellCheckHyphen);
begin
     if (Assigned (FAddictSpell)) and FLiveSpell then
     begin
          if (FAddictSpell.WordAcceptable (Word)) then
          begin
               Res := [];
          end
          else
          begin
               Res := [spMisSpelled];
          end;
     end;

     if (Assigned (FOldOnSpellCheckWord)) then
     begin
          FOldOnSpellCheckWord (Sender, Word, Res, Hyphen);
     end;
end;
{$ENDIF}

//************************************************************
{$IFDEF WPTOOLS5}

procedure TWPTAddictInstance.WPOnMouseDownRight (
     Sender: TObject;
     Button: TMouseButton;
     Shift: TShiftState;
     X, Y: Integer;
     par: TParagraph;
     posinpar: Integer;
     Pos: Integer;
     len: Integer;
     var text: string;
     var atr: Cardinal;
     var Abort: Boolean);
{$ELSE}

procedure TWPTAddictInstance.WPOnMouseDownRight (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, pos, len: Integer; var text: string; var atr: TAttr);
{$ENDIF}
var
     Parser: TWPToolsControlParser;
     PopupResult: TSpellPopupOption;
     XStart: LongInt;
     YStart: LongInt;
     XEnd: LongInt;
     YEnd: LongInt;
     SelectionRect: TRect;
     OldEndMessage: TSpellEndMessage;
     OldInitialPos: TSpellDialogInitialPos;
     OldFreeParser: Boolean;
begin
     if not (FMenuShowing) and Assigned (FAddictSpell) and FLiveSpell and
{$IFDEF WPTOOLS5}
     ((atr and cafsMisSpelled) <> 0) and (Button = mbRight)
{$ELSE}
     (afsMisSpelled in atr.Style)
{$ENDIF} then
     begin
          TWPCustomRtfEdit (FLiveControl).SetSelPosLen (Pos, Length (Text)
{$IFDEF WPTOOLS5}, true{$ENDIF});

{$IFDEF WPTOOLS5} // Additional code required for WPTools 5
          Abort := TRUE;
          TWPCustomRtfEdit (FLiveControl).TextCursor.DisableTextSelection := TRUE;
{$ENDIF}

          Parser := TWPToolsControlParser.Create;
          try
               TWPCustomRtfEdit (FLiveControl).IgnoreMouse;
               SelectionRect := Rect (0, 0, 0, 0);
               Parser.Initialize (FLiveControl);
               Parser.GetSelectionPosition (XStart, YStart, XEnd, YEnd);
               Parser.SetPosition (XStart, YStart, ptCurrent);
               Parser.GetSelectionScreenPosition (SelectionRect);

               FMenuShowing := True;
               PopupResult := FAddictSpell.ShowPopupMenu (FLiveControl, FLiveMenuOptions, SelectionRect.Left, SelectionRect.Bottom, Text);
               FMenuShowing := False;

               case (PopupResult) of
                    spAutoCorrect:
                         begin
{$IFDEF WPTOOLS5}
                              atr := atr and not cafsMisSpelled;
{$ELSE}
                              Exclude (Atr.Style, afsMisSpelled);
{$ENDIF}
                         end;
                    spAdd:
                         begin
{$IFDEF WPTOOLS5}
                              atr := atr and not cafsMisSpelled or cafsWasChecked;
{$ELSE}
                              Exclude (Atr.Style, afsMisSpelled);
                              Include (Atr.Style, afsWasChecked);
{$ENDIF}
                              WPTIgnoreWord (TWPCustomRtfEdit (FLiveControl), Text, False);
                         end;
                    spIgnoreAll:
                         begin
{$IFDEF WPTOOLS5}
                              atr := atr and not cafsMisSpelled;
{$ELSE}
                              Exclude (Atr.Style, afsMisSpelled);
{$ENDIF}
                              WPTIgnoreWord (TWPCustomRtfEdit (FLiveControl), Text, False);
                         end;
                    spIgnore:
                         begin
{$IFDEF WPTOOLS5}
                              atr := atr and not cafsMisSpelled or cafsWasChecked;
{$ELSE}
                              Exclude (Atr.Style, afsMisSpelled);
                              Include (Atr.Style, afsWasChecked);
{$ENDIF}
                         end;
                    spReplace:
                         begin
{$IFDEF WPTOOLS5}
                              atr := atr and not cafsMisSpelled;
{$ELSE}
                              Exclude (Atr.Style, afsMisSpelled);
{$ENDIF}
                         end;
                    spDialog:
                         begin
                              OldEndMessage := AddictSpell.EndMessage;
                              AddictSpell.EndMessage := emNever;
                              OldInitialPos := FAddictSpell.DialogInitialPos;
                              FAddictSpell.DialogInitialPos := ipUnderSelection;
                              OldFreeParser := FAddictSpell.FreeParser;
                              FAddictSpell.FreeParser := False;

                              AddictSpell.CheckParser (Parser, ctSelected);

                              FAddictSpell.FreeParser := OldFreeParser;
                              FAddictSpell.DialogInitialPos := OldInitialPos;
                              FAddictSpell.EndMessage := OldEndMessage;
                         end;
               end;
{$IFNDEF WPTOOLS5}
               FLiveControl.Invalidate;
{$ENDIF}
          finally
               Parser.Free;
{$IFDEF WPTOOLS5}
               // TWPCustomRtfEdit(FLiveControl)._3rdParty_MouseLock := FALSE;
               TWPCustomRtfEdit (FLiveControl).TextCursor.DisableTextSelection := FALSE;
{$ENDIF}
          end;

          if (PopupResult <> spCancel) then
          begin
               TWPCustomRtfEdit (FLiveControl).SetSelPosLen (Pos + Length (Text), 0{$IFDEF WPTOOLS5}, true{$ENDIF});
          end;
     end;

     if (Assigned (FOldOnMouseDownRight)) then
     begin
{$IFDEF WPTOOLS5}
          FOldOnMouseDownRight (Sender, Button, Shift, X, Y, par, posinpar, Pos
               , len, text, atr, Abort);
{$ELSE}
          FOldOnMouseDownRight (Sender, Button, Shift, X, Y, pos, len, text, atr);
{$ENDIF}
     end;
end;

//************************************************************

procedure TWPTAddictInstance.WPOnAfterCompleteWord (Sender: TObject; var lastchar: Char);
var
     Correction: string;
begin
     if Assigned (FAddictSpell) and FLiveCorrect then
     begin
          if (FAddictSpell.WordHasCorrection (FLiveControl.CPWord, Correction)) then
          begin
               FLiveControl.CPWord := Correction;
               //new
               FLiveControl.DelayedReformat;
               FLiveControl.ReformatAll ();
               //new
          end;
     end;

     if (Assigned (FOldOnAfterCompleteWord)) then
     begin
          FOldOnAfterCompleteWord (Sender, lastchar);
     end;
end;

//************************************************************
{$IFDEF WPTOOLS5}

procedure TWPTAddictInstance.RemoveLiveSpellHilight;
var
     par: PTParagraph;
     i: Integer;
begin
     par := FLiveControl.Memo.FirstPar;
     while par <> nil do
     begin
          for i := 0 to par.CharCount - 1 do
          begin
               par.CharAttr [i] := (par.CharAttr [i] and not cafsMisspelled) and not cafsWasChecked;
          end;
          par := par.next;
     end;
     FLiveControl.RePaint;
end;
{$ELSE}

procedure TWPTAddictInstance.RemoveLiveSpellHilight;
var
     par: PTParagraph;
     lin: PTLine;
     i: Integer;
     pa: PTAttr;
begin
     par := FLiveControl.Memo.FirstPar;
     while par <> nil do
     begin
          lin := par^.line;
          while lin <> nil do
          begin
               i := 0;
               pa := lin^.pa;
               if pa <> nil then
               begin
                    while i < lin^.plen do
                    begin
                         exclude (pa^.style, afsMisspelled);
                         inc (pa);
                         inc (i);
                    end;
               end;
               lin := lin^.next;
          end;
          par := par^.next;
     end;
     FLiveControl.Memo.Repaint;
end;
{$ENDIF}

//************************************************************
{$IFDEF WPTOOLS5}

procedure TWPTAddictInstance.CheckAgain;
var
     par: PTParagraph;
begin
     if (FLiveSpell) and (FLiveControl <> nil) and (FAddictSpell <> nil) then
     begin
          par := FLiveControl.Memo.FirstPar;
          while par <> nil do
          begin
               TWPCustomRtfEdit (FLiveControl).Memo.SpellcheckPar (par, true);
               par := par.next;
          end;
          FLiveControl.RePaint;
     end;
end;
{$ELSE}

procedure TWPTAddictInstance.CheckAgain;
var
     par: PTParagraph;
     lin: PTLine;
     pa: PTAttr;
     cp: Integer;
begin
     if (FLiveSpell) and (FLiveControl <> nil) and (FAddictSpell <> nil) then
     begin
          par := FLiveControl.Memo.FirstPar;
          while par <> nil do
          begin
               lin := par^.line;
               if lin^.pa <> nil then
               begin
                    while lin <> nil do
                    begin
                         pa := lin^.pa;
                         cp := 0;
                         while cp < lin^.plen do
                         begin
                              exclude (pa^.style, afsWasChecked);
                              exclude (pa^.style, afsMisspelled); //JZ
                              inc (pa);
                              inc (cp);
                         end;
                         lin := lin^.next;
                    end;
               end;
               TWPCustomRtfEdit (FLiveControl).Memo.spellcheck_par (par);
               par := par^.next;
          end;
          FLiveControl.Memo.Repaint;
     end;
end;
{$ENDIF}

//************************************************************
// AddictSpell WPTools global integration component
//************************************************************

constructor TWPTAddict.Create (AOwner: TComponent);
begin
     inherited Create (AOwner);

     FInstances := TList.Create;
     FDeleting := False;
     FOldOptions := [];

     FLiveSpell := True;
     FLiveCorrect := True;
     FLiveMenuOptions := [spDialog, spAutoCorrect, spAdd, spIgnoreAll, spIgnore, spReplace];
     FLiveOptions := True;

     FAddictSpell := nil;
     FAddictThesaurus := nil;

     FCreatedSpell := nil;
     FCreatedThesaurus := nil;
end;

//************************************************************

destructor TWPTAddict.Destroy;
var
     Index: Integer;
begin
     for Index := 0 to FInstances.Count - 1 do
     begin
          TWPTAddictInstance (FInstances [Index]).Destroying := True;
          TWPTAddictInstance (FInstances [Index]).Free;
     end;
     FInstances.Clear;

     AddictSpell := nil; // calls propset
     AddictThesaurus := nil; // calls propset

     FInstances.Free;

     if (FCreatedSpell <> nil) then
     begin
          FCreatedSpell.Free;
     end;
     if (FCreatedThesaurus <> nil) then
     begin
          FCreatedThesaurus.Free;
     end;

     inherited Destroy;
end;

//************************************************************

procedure TWPTAddict.Notification (AComponent: TComponent; Operation: TOperation);
var
     Index: Integer;
begin
     if (Operation = opRemove) and (Assigned (AComponent)) then
     begin
          if (AComponent is TWPCustomRtfEdit) then
          begin
               Index := FindInstance (TWPCustomRtfEdit (AComponent));
               if (Index >= 0) then
               begin
                    TWPTAddictInstance (FInstances [Index]).Destroying := True;
                    TWPTAddictInstance (FInstances [Index]).Free;
                    FInstances.Delete (Index);
               end;
          end
          else if (AComponent is TAddictSpellBase) and (TAddictSpellBase (AComponent) = FAddictSpell) then
          begin
               FDeleting := True;
               AddictSpell := nil; // calls propwrite
               FDeleting := False;
          end
          else if (AComponent is TAddictThesaurusBase) and (TAddictThesaurusBase (AComponent) = FAddictThesaurus) then
          begin
               FDeleting := True;
               AddictThesaurus := nil; // calls propwrite
               FDeleting := False;
          end;
     end;
     inherited Notification (AComponent, Operation);
end;

//************************************************************

procedure TWPTAddict.OnConfigChanged (Sender: TObject);
begin
     if (Assigned (FAddictSpell)) and FLiveOptions then
     begin
          UpdateInstances (True);
     end;
end;

//************************************************************

procedure TWPTAddict.OnAddCustomIgnore (Sender: TObject);
begin
     if (Assigned (FAddictSpell)) then
     begin
          FAddictSpell.AddIgnore (TWPToolsHiddenTextIgnore.Create);
     end;
end;

//************************************************************

procedure TWPTAddict.WriteLiveSpelling (Live: Boolean);
begin
     FLiveOptions := False;
     FLiveSpell := Live;
     UpdateInstances (False);
end;

//************************************************************

procedure TWPTAddict.WriteLiveCorrect (Correct: Boolean);
begin
     FLiveOptions := False;
     FLiveCorrect := Correct;
     UpdateInstances (False);
end;

//************************************************************

procedure TWPTAddict.WriteLiveOptions (Options: Boolean);
begin
     FLiveOptions := Options;
     UpdateInstances (False);
end;

//************************************************************

procedure TWPTAddict.WriteLiveMenuOptions (Options: TSpellPopupOptions);
begin
     FLiveMenuOptions := Options;
     UpdateInstances (False);
end;

//************************************************************

procedure TWPTAddict.WriteAddictSpell (AddictSpell: TAddictSpellBase);
begin
     if (FAddictSpell <> AddictSpell) then
     begin
          if (Assigned (FAddictSpell)) then
          begin
               if not (FDeleting) then
               begin
                    FAddictSpell.OnConfigChangedList.Remove (Self);
                    FAddictSpell.OnAddCustomIgnoreList.Remove (Self);
               end
               else
               begin
                    // WPTools seems to delete the Addict component if we've invoked
                    // an action, so we'll watch for setting the AddictSpell control
                    // to nil as the result of a deletion (FDeleting = true)

                    if (FAddictSpell = FCreatedSpell) then
                    begin
                         FCreatedSpell := nil;
                    end;
               end;
          end;
          FAddictSpell := AddictSpell;
          if (Assigned (FAddictSpell)) then
          begin
               FAddictSpell.FreeNotification (Self);
               FAddictSpell.OnConfigChangedList.Add (Self, OnConfigChanged);
               FAddictSpell.OnAddCustomIgnoreList.Add (Self, OnAddCustomIgnore);
               if (Assigned (FCreatedSpell)) and (FCreatedSpell <> FAddictSpell) then
               begin
                    FCreatedSpell.Free;
                    FCreatedSpell := nil;
               end;
          end;
          UpdateInstances (False);
     end;
end;

//************************************************************

procedure TWPTAddict.WriteAddictThesaurus (AddictThesaurus: TAddictThesaurusBase);
begin
     if (FAddictThesaurus <> AddictThesaurus) then
     begin
          if (Assigned (FAddictThesaurus)) then
          begin
               if (FDeleting) then
               begin
                    // WPTools seems to delete the Addict component if we've invoked
                    // an action, so we'll watch for setting the control
                    // to nil as the result of a deletion (FDeleting = true)

                    if (FAddictThesaurus = FCreatedThesaurus) then
                    begin
                         FCreatedThesaurus := nil;
                    end;
               end;
          end;
          FAddictThesaurus := AddictThesaurus;
          if (Assigned (FAddictThesaurus)) then
          begin
               FAddictThesaurus.FreeNotification (Self);
               if (Assigned (FCreatedThesaurus)) and (FCreatedThesaurus <> FAddictThesaurus) then
               begin
                    FCreatedThesaurus.Free;
                    FCreatedThesaurus := nil;
               end;
          end;
     end;
end;

//************************************************************

procedure TWPTAddict.UpdateInstance (Instance: TWPTAddictInstance; Recheck: Boolean);
begin
     Instance.AddictSpell := FAddictSpell;
     Instance.LiveSpell := FLiveSpell;
     Instance.LiveCorrect := FLiveCorrect;
     Instance.LiveMenuOptions := FLiveMenuOptions;
     if (Recheck) then
     begin
          Instance.CheckAgain;
     end;
end;

//************************************************************

function TWPTAddict.FindInstance (Control: TWPCustomRtfEdit): Integer;
var
     Index: Integer;
begin
     for Index := 0 to FInstances.Count - 1 do
     begin
          if (Control = TWPTAddictInstance (FInstances [Index]).LiveControl) then
          begin
               Result := Index;
               Exit;
          end;
     end;
     Result := -1;
end;

//************************************************************

procedure TWPTAddict.UpdateInstances (ForceChange: Boolean);
var
     Index: Integer;
     Recheck: Boolean;
begin
     Recheck := False;
     if FLiveOptions then
     begin
          if (Assigned (FAddictSpell)) then
          begin
               FLiveSpell := (soLiveSpelling in FAddictSpell.Configuration.SpellOptions);
               FLiveCorrect := (soLiveCorrect in FAddictSpell.Configuration.SpellOptions);
          end
          else
          begin
               FLiveSpell := False;
               FLiveCorrect := False;
          end;
     end;
     if (Assigned (FAddictSpell)) and (FOldOptions <> FAddictSpell.Configuration.SpellOptions) then
     begin
          Recheck := True;
          FOldOptions := FAddictSpell.Configuration.SpellOptions;
     end;
     Recheck := Recheck or ForceChange;
     for Index := 0 to FInstances.Count - 1 do
     begin
          UpdateInstance (TWPTAddictInstance (FInstances [Index]), Recheck);
     end;
end;

//************************************************************

procedure TWPTAddict.AddLiveControl (LiveControl: TWPCustomRtfEdit);
var
     Index: Integer;
     Instance: TWPTAddictInstance;
begin
     Index := FindInstance (LiveControl);
     if (Index = -1) then
     begin
          Instance := TWPTAddictInstance.Create;
          Instance.LiveControl := LiveControl;
          LiveControl.FreeNotification (Self);
          UpdateInstance (Instance, False);
          FInstances.Add (Instance);
     end;
end;

//************************************************************

procedure TWPTAddict.RemoveLiveControl (LiveControl: TWPCustomRtfEdit);
var
     Index: Integer;
begin
     Index := FindInstance (LiveControl);
     if (Index >= 0) then
     begin
          TWPTAddictInstance (FInstances [Index]).Free;
          FInstances.Delete (Index);
     end;
end;

//************************************************************

procedure TWPTAddict.Check (Control: TWPCustomRtfEdit; CheckType: TCheckType);
begin
     CheckWPTools (FAddictSpell, Control, CheckType);
end;

//************************************************************

procedure TWPTAddict.CheckWinControl (Control: TWinControl; CheckType: TCheckType);
begin
     if (Assigned (FAddictSpell)) then
     begin
          if (Control is TWPCustomRtfEdit) then
          begin
               Check (Control as TWPCustomRtfEdit, CheckType);
          end
          else
          begin
               FAddictSpell.CheckWinControl (Control, CheckType);
          end;
     end;
end;

//************************************************************

procedure TWPTAddict.Lookup (Control: TWPCustomRtfEdit);
begin
     LookupWPTools (FAddictThesaurus, Control);
end;

//************************************************************

procedure TWPTAddict.LookupWinControl (Control: TWinControl);
begin
     if (Assigned (FAddictThesaurus)) then
     begin
          if (Control is TWPCustomRtfEdit) then
          begin
               Lookup (Control as TWPCustomRtfEdit);
          end
          else
          begin
               FAddictThesaurus.LookupWinControl (Control);
          end;
     end;
end;

//************************************************************

procedure TWPTAddict.DoSpellCheck (Sender: TObject; Mode: TWPStartSpellcheckMode);
var
     Control: TWPCustomRtfEdit;
begin
     if (Sender is TWPCustomRtfEdit) then
     begin
          Control := TWPCustomRtfEdit (Sender);

          // Ensure we're setup to perform the action

          case Mode of
               wpStartSpellCheck,
                    wpStartSpellAsYouGo,
                    wpStopSpellAsYouGo:
                    begin
                         if (FAddictSpell = nil) then
                         begin
                              FCreatedSpell := TAddictSpell.Create (Control);
                              AddictSpell := FCreatedSpell;
                         end;
                    end;
               wpStartThesuarus:
                    begin
                         if (FAddictThesaurus = nil) then
                         begin
                              FCreatedThesaurus := TAddictThesaurus.Create (Control);
                              AddictThesaurus := FCreatedThesaurus;
                         end;
                    end;
          end;

          // Perform the action

          case Mode of
               wpStartSpellCheck:
                    begin
                         Check (Control, ctAll);
                    end;
               wpStartThesuarus:
                    begin
                         Lookup (Control);
                    end;
               wpStartSpellAsYouGo:
                    begin
                         AddLiveControl (Control);
                    end;
               wpStopSpellAsYouGo:
                    begin
                         RemoveLiveControl (Control);
                    end;
          end;
     end;
end;

//************************************************************
//************************************************************

initialization
     WPAddict := TWPTAddict.Create (nil);
{$IFDEF WPTOOLS5}
     if (GlobalWPToolsCustomEnviroment <> nil) and
          (GlobalWPToolsCustomEnviroment is TWPToolsEnviroment) then
     begin
          TWPToolsEnviroment (GlobalWPToolsCustomEnviroment).SpellEngine := WPAddict;
          TWPToolsEnviroment (GlobalWPToolsCustomEnviroment).SpellEngine_OnStartSpellcheck
               := WPAddict.DoSpellCheck;
     end;
{$ELSE}
     WPONStartSpellcheck := WPAddict.DoSpellCheck;
{$ENDIF}

finalization
{$IFDEF WPTOOLS5}
     if (GlobalWPToolsCustomEnviroment <> nil) and
          (GlobalWPToolsCustomEnviroment is TWPToolsEnviroment) then
     begin
          TWPToolsEnviroment (GlobalWPToolsCustomEnviroment).SpellEngine := nil;
          TWPToolsEnviroment (GlobalWPToolsCustomEnviroment).SpellEngine_OnStartSpellcheck := nil;
     end;
{$ELSE}
     WPONStartSpellcheck := nil;
{$ENDIF}
     WPAddict.Free;
     WPAddict := nil;
end.

