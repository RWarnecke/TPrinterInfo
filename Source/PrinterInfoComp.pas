{------------------------------------------------------------------------------}
{                                                                              }
{   Unit-Name         : PrinterInfoComp.pas                                    }
{   Version           : 2.6                                                    }
{   Create Date       : 2008/08/29                                             }
{   Software Engineer : Rolf Warnecke                                          }
{   Department        : BIS-Programmierung                                     }
{   Website           : http://www.bis-programmierung.de                       }
{                                                                              }
{   Copyright by Rolf Warnecke 2008 - 2014                                     }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{   History :                                                                  }
{     2009/05/16 - Property hinzugefügt um den Namen des Standarddruckers zu   }
{                  ermitteln.                                           (V1.1) }
{                                                                              }
{     2009/05/17 - Property "PrinterListName" hinzugefügt               (V1.2) }
{                - Umbau zu einer Komponente (Namenswechsel von                }
{                  GetPrinterInfo.pas nach PrinterInfoComp.pas)         (V1.3) }
{                - Property "PaperSizes" hinzugefügt                    (V1.3) }
{                - Property "PaperTrays" hinzugefügt                    (V1.3) }
{                                                                              }
{     2009/05/21 - Für Delphi 5 verfügbar                               (V1.4) }
{                - Property "ColorPrinting" hinzugefügt. Damit kann            }
{                  überpüft werden ob der Drucker Farbe drucken kann    (V1.6) }
{                - Property "JobNameList" hinzugefügt                   (V1.6) }
{                                                                              }
{     2009/06/10 - Ein Icon für die Komponente hinzugefügt, welches in         }
{                  Tool-Palette angezeigt wird.                         (V1.6) }
{                                                                              }
{     2009/06/11 - Neue Klasse JobInfo erstellt für die Informationen          }
{                  der Druckerjobs                                      (V2.0) }
{                - Property "JobNameList" in die Klasse JobInfo                }
{                  übernommen                                           (V2.0) }
{                                                                              }
{     2009/06/12 - Die folgenden Properties hinzugefügt :               (V2.0) }
{                  [+] JobIndex      (Position in der Spoolingliste)           }
{                  [+] JobName       (Einzelnen Jobnamen anhand des Index)     }
{                  [+] JobOwner      (Besitzer des Druckauftrags)              }
{                  [+] JobSize       (Größe des Druckauftrages)                }
{                  [+] JobStatus     (Den Status des Druckauftrages ermitteln) }
{                  [+] JobNumPages   (Die Anzahl zu druckenden Seiten)         }
{                  [+] JobSubmitTime (Die Zeit wann der Job gesendet wurde)    )
{                - TPrinterInfo wird aufgesplittet in TPrinterCustom           }
{                  und TPrinterInfo.                                    (V2.0) }
{                - Die Properties von TPrinterInfo werden nichtmehr in         }
{                  TJobInfo und umgekehrt angezeigt.                    (V2.0) }
{                                                                              }
{     2009/06/13 - (TPrinterInfo) Das Property "SupportDuplex"                 }
{                  hinzugefügt.                                         (V2.0) }
{                - (TPrinterInfo) Das Property "Memory" hinzugefügt     (V2.0) }
{                - (TPrinterInfo) Das Property "PaperHeight" und               }
{                - "PaperWidth" hinzugefügt                             (V2.0) }
{                                                                              }
{     2009/10/29 - (TPrinterInfo) Das Property "DefaultPrinterID"              }
{                  hinzugefügt.                                         (V2.0) }
{                                                                              }
{     2010/06/06 - Compilerdatei geändert                               (V2.2) }
{                - Package für Delphi 2010 erstellt                     (V2.2) }
{                - Mehrere Bugs behoben bezüglich den Rückgabewert             }
{                  "TStrings"                                           (V2.2) }
{                - Die minimalen Druckränder des Drucker werden                }
{                  ermittelt                                            (V2.2) }
{                                                                              }
{     2013/06/21 - Package für Delphi XE, XE2, XE3 und XE4 erstellt     (V2.3) }
{                - Mehrere kleine Bugs behoben für die neuen Packages   (V2.3) }
{                                                                              }
{     2013/09/14 - Package für Delphi XE5 erstellt                      (V2.4) }
{                                                                              }
{     2014/04/16 - Package für Delphi XE6 erstellt                      (V2.5) }
{                                                                              }
{     2014/09/04 - Package für Delphi XE7 erstellt                      (V2.6) }
{                                                                              }
{     2014/04/18 - Package für Delphi XE8 erstellt                      (V2.7) }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{   1. Lizenz                                                                  }
{   DIESER QUELLCODE WIRD SO WIE HIER ZUR VERFÜGUNG GESTELLT, OHNE             }
{   GEWÄHRLEISTUNG IRGENDEINER ART. SIE HABEN DAS RECHT ES WEITER ZU VERTEILEN }
{   ODER DEN QUELLCODE ZU MODIFIZIEREN.                                        }
{                                                                              }
{   DIESER QUELLCODE DARF NUR FÜR NICHT KOMMERZIELLE ZWECKE EINGESETZT WERDEN. }
{                                                                              }
{   2. Haftung                                                                 }
{   IN KEINEM FALL KANN DER AUTOR HAFTBAR GEMACHT WERDEN FÜR IRGENDWELCHE      }
{   SCHÄDEN, GLEICH WELCHER ART.                                               }
{                                                                              }
{   3. COPYRIGHT                                                               }
{   Die Software wird sowohl durch Urheberrechtsgesetze und internationale     }
{   Urheberrechtsverträge geschützt, als auch durch andere Gesetze und         }
{   Vereinbarungen über geistiges Eigentum.                                    }
{                                                                              }
{   4. Weitergabe                                                              }
{   Der Quellcode darf und soll in der hier angebotenen Form weitergegeben     }
{   werden. Alle Rechte verbleiben aber beim Autor.                            }
{   Bei Veröffentlichung einer geänderten Version würde ich gerne              }
{   benachrichtigt werden und wo und wie der Quellcode veröffentlicht wurde.   }
{                                                                              }
{   5. Modifizierung                                                           }
{   Der Quellcode darf verändert / modifiziert werden unter folgenden          }
{   Bedingungen:                                                               }
{     1.) Modifizierter Quellcode ist zu kennzeichen.                          }
{     2.) Der Copyrightvermerk aus dem Dateikopf muß erhalten bleiben.         }
{     3.) Der Ursprung des original Quellcodes darf nicht verfälscht werden.   }
{     4.) Wurde der Code geändert und / oder modifiziert bin ich darüber zu    }
{         informieren und eine Kopie des geänderten und / oder modifiziertenm  }
{         Quellcodes ist mir zu zusenden. Danke.                               }
{                                                                              }
{------------------------------------------------------------------------------}
unit PrinterInfoComp;

{$I ..\inc\compiler.inc}

{$IFDEF DELPHI10_UP}
  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

interface

uses
{$IFDEF DELPHI16_UP}
  System.SysUtils, System.Classes, Winapi.Windows, Vcl.Printers, Winapi.WinSpool;
{$ELSE}
  SysUtils, Classes, Windows, Printers, WinSpool;
{$ENDIF}

type
  TMasseinheit = (mInch, mCenti);
  TPrinterMargins = record
    Left   : Double;
    Top    : Double;
    Right  : Double;
    Bottom : Double;
  end;
  TPrinterCustom = class(TComponent)
  private
    // Variablen für die PrinterInfo
    FAllInfos        : TList;
    // Variablen für die JobInfo
    FJobNameList     : TStrings;
    // Funktionen/Proceduren für PrinterInfo
    procedure GetPrinterNumbers;
    procedure GetAllPrinterInfos;
    procedure GetPrinterState;
  protected
    // Variablen für die PrinterInfo
    FPrinterCount    : integer;
    FPrinterIndex    : integer;
    FPrinterState    : DWORD;
    FPrinterListName : TStrings;
    // Variablen für die JobInfo
    FJobIndex        : integer;
    // Funktionen/Proceduren für JobInfo
    function GetJobName: string;
    function GetJobNameList: TStrings;
    function GetJobOwner: string;
    function GetJobSize: string;
    function GetJobStatus: string;
    function GetJobPages: Integer;
    function GetSubmitTime: string;
    // Funktionen/Proceduren für PrinterInfo
    function GetColorState: boolean;
    function GetServerName: string;
    function GetPrinterName: string;
    function GetPrinterListName: TStrings;
    function GetShareName: string;
    function GetPortName: string;
    function GetDriverName: string;
    function GetComment: string;
    function GetLocation: string;
    function GetSepFile: string;
    function GetPrintProcessor: string;
    function GetDatatype: string;
    function GetParameters: string;
    function GetAttributes: DWORD;
    function GetPriority: DWORD;
    function GetDefaultPriority: DWORD;
    function GetStartTime: DWORD;
    function GetUntilTime: DWORD;
    function GetDefaultPrinterName: string;
    function GetDefaultPrinterID: DWORD;
    function GetPrinterStateString: string;
    function GetcJobs: DWORD;
    function GetAveragePPM: DWORD;
    function GetSupportDuplex: Boolean;
    function GetPrnMemory: Integer;
    function GetPaperWidth: Extended;
    function GetPaperHeight: Extended;
    function GetPrinterMargins: TPrinterMargins;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Refresh;
  end;

{$IFDEF DELPHI16_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
{$ENDIF}
  TPrinterInfo = class(TPrinterCustom)
  public
    property Attributes         : DWORD    read GetAttributes;
    property AveragePPM         : DWORD    read GetAveragePPM;
    property cJobs              : DWORD    read GetcJobs;
    property ColorPrinting      : boolean  read GetColorState;
    property Comment            : string   read GetComment;
    property Datatype           : string   read GetDatatype;
    property DefaultPrinter     : string   read GetDefaultPrinterName;
    property DefaultPrinterID   : Cardinal read GetDefaultPrinterID;
    property DefaultPriority    : DWORD    read GetDefaultPriority;
    property DriverName         : string   read GetDriverName;
    property Location           : string   read GetLocation;
    property Memory             : Integer  read GetPrnMemory;
    property PaperHeight        : Extended read GetPaperHeight;
    property PaperWidth         : Extended read GetPaperWidth;
    property Parameters         : string   read GetParameters;
    property PortName           : string   read GetPortName;
    property PrinterCount       : integer  read FPrinterCount;
    property PrinterIndex       : integer  read FPrinterIndex write FPrinterIndex;
    property PrinterName        : string   read GetPrinterName;
    property PrinterListName    : TStrings read GetPrinterListName;
    property PrinterState       : DWORD    read FPrinterState;
    property PrinterStateString : string   read GetPrinterStateString;
    property PrintProcessor     : string   read GetPrintProcessor;
    property Priority           : DWORD    read GetPriority;
    property SepFile            : string   read GetSepFile;
    property ServerName         : string   read GetServerName;
    property ShareName          : string   read GetShareName;
    property StartTime          : DWORD    read GetStartTime;
    property SupportDuplex      : Boolean  read GetSupportDuplex;
    property UntilTime          : DWORD    read GetUntilTime;
    property PrinterMargins     : TPrinterMargins read GetPrinterMargins;
    procedure GetPaperTrays(const APaperTrays: TStrings);
    procedure GetPaperSizes(const APaperSize: TStrings);
  end;

{$IFDEF DELPHI16_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
{$ENDIF}
  TPrnJobInfo = class(TPrinterCustom)
  public
    property JobIndex      : integer  read FJobIndex write FJobIndex;
    property JobName       : string   read GetJobName;
    property JobNameList   : TStrings read GetJobNameList;
    property JobOwner      : string   read GetJobOwner;
    property JobNumPages   : Integer  read GetJobPages;
    property JobSize       : string   read GetJobSize;
    property JobStatus     : string   read GetJobStatus;
    property JobSubmitTime : string   read GetSubmitTime;
  end;

procedure Register;

implementation

{$R ..\res\PrnInfo.res}

var
  PPrinter   : PPrinterInfo2;

resourcestring
  // Alle strings für den Druckerstatus
  rsPRNReady             = 'Bereit';
  rsPRNPrint             = 'Druckt';
  rsPRNTrayOpen          = 'Schublade ist offen';
  rsPRNError             = 'Fehler';
  rsPRNINITIALIZING      = 'Initialisierung.';
  rsPRNIO_ACTIVE         = 'Drucker ist in einem aktiven Input/Output Zustand';
  rsPRNMANUAL_FEED       = 'Drucker im manuellen Modus';
  rsPRNNO_TONER          = 'Kein Toner';
  rsPRNNOT_AVAILABLE     = 'Drucker nicht erreichbar für''s Drucken';
  rsPRNOFFLINE           = 'Drucker offline';
  rsPRNOUT_OF_MEMORY     = 'Speicherüberlauf';
  rsPRNOUTPUT_BIN_FULL   = 'Ausgabefach voll';
  rsPRNPAGE_PUNT         = 'Der Drucker kann die aktuelle Seite nicht drucken';
  rsPRNPAPER_JAM         = 'Papierstau';
  rsPRNPAPER_OUT         = 'Kein Papier';
  rsPRNPAPER_PROBLEM     = 'Papierproblem';
  rsPRNPAUSED            = 'Angehalten';
  rsPRNPENDING_DELETION  = 'Drucker wird gelöscht.';
  rsPRNPOWER_SAVE        = 'Powersave Modus';
  rsPRNPRINTING          = 'Druckt';
  rsPRNPROCESSING        = 'Druckt einen Job';
  rsPRNSERVER_UNKNOWN    = 'Druckerstatus unbekannt';
  rsPRNTONER_LOW         = 'Wenig Toner';
  rsPRNUSER_INTERVENTION = 'Benutzereingriff notwendig';
  rsPRNWAITING           = 'Drucker wartet';
  rsPRNWARMING_UP        = 'Aufwärmphase';
  rsOfflinePaused        = 'Drucker offline - Angehalten';
  // Alle strings für den Jobstatus
  rsJobPaused           = 'Druckauftrag wurde angehalten';
  rsJobError            = 'Beim Druckauftrag wurde ein Fehler festgestellt';
  rsJobDeleting         = 'Druckauftrag wird gelöscht';
  rsJobSpooling         = 'Druckauftrag wartet';
  rsJobPrinting         = 'Druckauftrag wird gedruckt';
  rsJobOffline          = 'Drucker ist offline';
  rsJobPaperOut         = 'Drucker hat kein Papier';
  rsJobPrinted          = 'Druckauftrag wurde ausgedruckt';
  rsJobDeleted          = 'Druckauftrag wurde gelöscht';
  rsJobBlockedDEVQ      = 'Der Treiber kann den Druckauftrag nicht drucken';
  rsJobUserIntervention = 'Benutzereingriff am Drucker notwendig';
  rsJobRestart          = 'Druckauftrag wurde neu gestartet';
  rsNoJobs              = 'Keine Druckaufträge vorhanden';

////////////////////////////////////////////////////////////////////////////////
///
///  Die Komponente in der Komponentenliste registrieren
///
procedure Register;
begin
  RegisterComponents('BIS-Komponenten', [TPrinterInfo, TPrnJobInfo]);
end;
////////////////////////////////////////////////////////////////////////////////
//
//  Funktion zum Suchen ob ein Zeichen im String enthalten ist
//
function PosN(Substring, Mainstring: string; n: Integer): Integer;
begin
  if Pos(substring, mainstring) = 0 then
  begin
    posn := 0;
    Exit;
  end
  else
  begin
    if  n = 1 then
      posn := Pos(substring, mainstring)
    else
    begin
      posn := Pos(substring, mainstring) + posn(substring, Copy(mainstring,
         (Pos(substring, mainstring) + 1), Length(mainstring)), n - 1);
    end;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///
///
function SavePChar(p: PChar): PChar;
const
  error: PChar = 'Nil';
begin
  if not Assigned(p) then
    Result := error
  else
    Result := p;
end;
////////////////////////////////////////////////////////////////////////////////
//
//  Die richtige Größenangabe bestimmen und zurückgeben.
//
function FormatSize(SizeB: Extended): String;
begin
  if SizeB>1099511627776 then result:=Format('%f TB',[SizeB/1024/1024/1024/1024]) else
  if SizeB>1024*1024*1024 then result:=Format('%f GB',[SizeB/1024/1024/1024]) else
  if SizeB>1024*1024 then result:=Format('%f MB',[SizeB/1024/1024]) else
  if SizeB>1024 then result:=Format('%f KB',[SizeB/1024]) else
  if SizeB>=0 then result:=Format('%f Byte',[SizeB]);
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Der Construktor der Klasse TPrinterCustom
///  { TPrinterCustom }
///
constructor TPrinterCustom.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAllInfos := TList.Create;
  FAllInfos.Clear;
  GetPrinterNumbers;
  GetAllPrinterInfos;
  GetPrinterListName;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Der Destruktor der Klasse TPrinterCustom
///  { TPrinterCustom }
///
destructor TPrinterCustom.Destroy;
var
  I : integer;
begin
  if FAllInfos.Count > 0 then
  begin
     for I :=0 to FAllInfos.Count -1 do Dispose(FAllInfos[I]);
     FAllInfos.Clear;
  end;
  FAllInfos.Free;
  inherited;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Ermitteln, wieviele Drucker installiert sind
///  { TPrinterCustom }
///
procedure TPrinterCustom.GetPrinterNumbers;
var
  Flags, Count, NumInfo: DWORD;
  Level: Byte;
  Buffer: PChar;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Flags := PRINTER_ENUM_CONNECTIONS or PRINTER_ENUM_LOCAL;
    Level := 4;
  end
  else
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 5;
  end;
  Count := 0;
  EnumPrinters(Flags, nil, Level, nil, 0, Count, NumInfo);
  if Count = 0 then
  begin
    FPrinterCount := 0;
    Exit;
  end;
  GetMem(Buffer, Count);
  if not EnumPrinters(Flags, nil, Level, PByte(Buffer), Count, Count, NumInfo) then
  begin
    FPrinterCount := 0;
    FreeMem(Buffer);
    Exit;
  end
  else
  begin
    FPrinterCount := NumInfo;
    FreeMem(Buffer);
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Den Status des Druckers ermitteln und als String zurückgeben
///  { TPrinterCustom }
///
function TPrinterCustom.GetPrinterStateString:string;
begin
  GetPrinterState;
  case FPrinterState of
    0 : result := rsPRNReady;
    PRINTER_STATUS_BUSY : Result := rsPRNPrint;
    PRINTER_STATUS_DOOR_OPEN : Result := rsPRNTrayOpen;
    PRINTER_STATUS_ERROR : Result := rsPRNError;
    PRINTER_STATUS_INITIALIZING : Result := rsPRNINITIALIZING;
    PRINTER_STATUS_IO_ACTIVE : Result := rsPRNIO_ACTIVE;
    PRINTER_STATUS_MANUAL_FEED : Result := rsPRNMANUAL_FEED;
    PRINTER_STATUS_NO_TONER : Result := rsPRNNO_TONER;
    PRINTER_STATUS_NOT_AVAILABLE : Result := rsPRNNOT_AVAILABLE;
    PRINTER_STATUS_OFFLINE : Result := rsPRNOFFLINE;
    PRINTER_STATUS_OUT_OF_MEMORY : Result := rsPRNOUT_OF_MEMORY;
    PRINTER_STATUS_OUTPUT_BIN_FULL : Result := rsPRNOUTPUT_BIN_FULL;
    PRINTER_STATUS_PAGE_PUNT : Result := rsPRNPAGE_PUNT;
    PRINTER_STATUS_PAPER_JAM : Result := rsPRNPAPER_JAM;
    PRINTER_STATUS_PAPER_OUT : Result := rsPRNPAPER_OUT;
    PRINTER_STATUS_PAPER_PROBLEM : Result := rsPRNPAPER_PROBLEM;
    PRINTER_STATUS_PAUSED : Result := rsPRNPAUSED;
    PRINTER_STATUS_PENDING_DELETION : Result := rsPRNPENDING_DELETION;
    PRINTER_STATUS_POWER_SAVE : Result := rsPRNPOWER_SAVE;
    PRINTER_STATUS_PRINTING : Result := rsPRNPRINTING;
    PRINTER_STATUS_PROCESSING : Result := rsPRNPROCESSING;
    PRINTER_STATUS_SERVER_UNKNOWN : Result := rsPRNSERVER_UNKNOWN;
    PRINTER_STATUS_TONER_LOW : Result := rsPRNTONER_LOW;
    PRINTER_STATUS_USER_INTERVENTION : Result := rsPRNUSER_INTERVENTION;
    PRINTER_STATUS_WAITING : Result := rsPRNWAITING;
    PRINTER_STATUS_WARMING_UP : Result := rsPRNWARMING_UP;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Ermitteln aller Informationen über die installierten Drucker
///  { TPrinterCustom }
///
procedure TPrinterCustom.GetAllPrinterInfos;
var
  pcbNeeded  : DWORD;
  pcReturned : DWORD;
  Buffer     : PAnsiChar;
  PrinterInfo: PAnsiChar;
  I          : Integer;
  Flags      : DWORD;
  Level      : Byte;
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Flags := PRINTER_ENUM_CONNECTIONS or PRINTER_ENUM_LOCAL;
    Level := 2;
  end
  else
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 2;
  end;
  EnumPrinters(Flags, nil, Level, nil, 0, pcbNeeded, pcReturned);
  GetMem(Buffer, pcbNeeded);
  EnumPrinters(Flags, nil, Level, PByte(Buffer), pcbNeeded, pcbNeeded, pcReturned);
  PrinterInfo := Buffer;
  for I := 0 to pcReturned - 1 do
  begin
    New(PPrinter);
    with PPrinterInfo2(PrinterInfo)^ do
    begin
      PPrinter^.pServerName     := pServerName;
      PPrinter^.pPrinterName    := pPrinterName;
      PPrinter^.pShareName      := pShareName;
      PPrinter^.pPortName       := pPortName;
      PPrinter^.pDriverName     := pDriverName;
      PPrinter^.pComment        := pComment;
      PPrinter^.pLocation       := pLocation;
      PPrinter^.pSepFile        := pSepFile;
      PPrinter^.pPrintProcessor := pPrintProcessor;
      PPrinter^.pDatatype       := pDatatype;
      PPrinter^.pParameters     := pParameters;
      PPrinter^.Attributes      := Attributes;
      PPrinter^.Priority        := Priority;
      PPrinter^.DefaultPriority := DefaultPriority;
      PPrinter^.StartTime       := StartTime;
      PPrinter^.UntilTime       := UntilTime;
      PPrinter^.Status          := Status;
      PPrinter^.cJobs           := cJobs;
      PPrinter^.AveragePPM      := AveragePPM;
      FAllInfos.Add(Pointer(PPrinter));
      Inc(PrinterInfo, SizeOf(TPrinterInfo2));
    end;
  end;
  FreeMem(Buffer);
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Druckerservernamen ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetServerName;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pServerName;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Die Namensliste aller installieren Drucker ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetPrinterListName: TStrings;
var
  I : Integer;
begin
  if FPrinterListName = nil then
    FPrinterListName := TStringList.Create;
  FPrinterListName.Clear;
  for I := 0 to FAllInfos.Count - 1 do
  begin
    PPrinter := FAllInfos.Items[i];
    FPrinterListName.Add(PPrinter^.pPrinterName);
  end;
  Result := FPrinterListName;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID die minimalen Ränder des Druckers ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetPrinterMargins: TPrinterMargins;
var
  PixelsPerInch: TPoint;
  PhysPageSize: TPoint;
  OffsetStart: TPoint;
  PageRes: TPoint;
  DevM: THandle;
begin
  Result.Top := 0; Result.Left := 0; Result.Right := 0; Result.Bottom := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
    PixelsPerInch.y := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
    PixelsPerInch.x := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
    Escape(Printer.Handle, GETPHYSPAGESIZE, 0, nil, @PhysPageSize);
    Escape(Printer.Handle, GETPRINTINGOFFSET, 0, nil, @OffsetStart);
    PageRes.y := GetDeviceCaps(Printer.Handle, VERTRES);
    PageRes.x := GetDeviceCaps(Printer.Handle, HORZRES);
    // Top Margin
    Result.Top := OffsetStart.y / PixelsPerInch.y;
    // Left Margin
    Result.Left := OffsetStart.x / PixelsPerInch.x;
    // Bottom Margin
    Result.Bottom := ((PhysPageSize.y - PageRes.y) / PixelsPerInch.y) -
      (OffsetStart.y / PixelsPerInch.y);
    // Right Margin
    Result.Right := ((PhysPageSize.x - PageRes.x) / PixelsPerInch.x) -
      (OffsetStart.x / PixelsPerInch.x);
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Druckernamen ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetPrinterName:string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pPrinterName;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Freigabenamen ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetShareName:string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pShareName;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Portnamen ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetPortName:string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pPortName;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID der Treibernamen ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetDriverName:string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pDriverName;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Überpüfen ob der Drucker in Farbe drucken kann
///  { TPrinterCustom }
///
function TPrinterCustom.GetColorState: boolean;
var
  DevM : THandle;
  DM1  : PDeviceMode;
  DM2  : PDeviceMode;
  Sz   : Integer;
begin
  result := false;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
    DM1 := nil;
    DM2 := nil;
    Sz  := DocumentProperties(0, 0, PPrinter^.pPrinterName, DM1^, DM2^, 0);
    GetMem(DM1, Sz);
    DocumentProperties(0, 0, PPrinter^.pPrinterName, DM1^, DM2^, DM_OUT_BUFFER);
    if DM1^.dmColor > 1 then
      result := true;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Kommentar vom installierten Drucker ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetComment:string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pComment;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Standort vom installierten Drucker ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetLocation:string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pLocation;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID das SEP-File des installierten Druckers ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetSepFile:string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pSepFile;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Print Processor des installierten Drucker ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetPrintProcessor:string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pPrintProcessor;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Datentyp des Druckers ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetDatatype: string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pDatatype;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Die Papierhöhe ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetPaperHeight: Extended;
var
  DevM: THandle;
begin
  Result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
    Result := GetDeviceCaps(Printer.Canvas.Handle, PHYSICALHEIGHT) /
              GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSY) * 25.4;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Die Papierbreite ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetPaperWidth: Extended;
var
  DevM: THandle;
begin
  Result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
    Result := GetDeviceCaps(Printer.Canvas.Handle, PHYSICALWIDTH) /
              GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSX) * 25.4;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID die Parameter des Druckers ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetParameters: string;
begin
  result := '';
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.pParameters;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID die Attribute des Druckers ermitteln
///  (Netzwerkdrucker, Lokal etc.)
///  { TPrinterCustom }
///
function TPrinterCustom.GetAttributes:DWORD;
begin
  result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.Attributes;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Prioritätsstatus des Druckers ermitteln zum weiterleiten
///  von Jobs
///  { TPrinterCustom }
///
function TPrinterCustom.GetPriority:DWORD;
begin
  result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.Priority;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Ermitteln des Arbeitsspeichers eines Druckers
///  { TPrinterCustom }
///
function TPrinterCustom.GetPrnMemory: Integer;
var
  DevM : THandle;
begin
  Result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName,
                       PPrinter^.pDriverName,
                       PPrinter^.pPortName,
                       DevM);
    Result := WinSpool.DeviceCapabilities(PPrinter^.pPrinterName,
                                          PPrinter^.pPortName,
                                          DC_PRINTERMEM,
                                          nil,
                                          nil);
    Result := Round(Result / 1024);
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Die ID des Standarddruckers ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetDefaultPrinterID: DWORD;
begin
  Result := Printer.PrinterIndex;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Den Namen des Standarddruckers ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetDefaultPrinterName: string;
var
  ResStr: array[0..255] of Char;
begin
  GetProfileString('Windows', 'device', '', ResStr, 255);
  Result := Copy(StrPas(ResStr), 0, posn('winspool', StrPas(ResStr), 1) - 2);
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID die Standardpriorität für einen Druckjob ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetDefaultPriority:DWORD;
begin
  result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.DefaultPriority;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Die frühste Start Zeit ermitteln, wann wieder ein Job abgearbeitet werden
///  kann
///  { TPrinterCustom }
///
function TPrinterCustom.GetStartTime:DWORD;
begin
  result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.StartTime;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Die Zeit ermitteln, wann der Drucker zuletzt benutzt wurde
///  { TPrinterCustom }
///
function TPrinterCustom.GetUntilTime:DWORD;
begin
  result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.UntilTime;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Die Informationen der Druckerliste erneuern
///
procedure TPrinterCustom.Refresh;
begin
  FAllInfos.Clear;
  GetPrinterNumbers;
  GetAllPrinterInfos;
  GetPrinterListName;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID die Anzahl der Jobs in dem Drucker ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetcJobs;
begin
  result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.cJobs;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Ermitteln, wieviele Seiten pro Minute der Drucker schon gedruckt hat.
///  { TPrinterCustom }
///
function TPrinterCustom.GetAveragePPM:DWORD;
begin
  result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    result := PPrinter^.AveragePPM;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Über die ID den Status des Druckers ermitteln
///  { TPrinterCustom }
///
procedure TPrinterCustom.GetPrinterState;
begin
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    FPrinterState := PPrinter^.Status;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Einen einzelnen Jobnamen ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetJobName: string;
type
  TJobs  = array [0..1000] of JOB_INFO_2;
  PJobs = ^TJobs;
var
  hPrinter, DevM: THandle;
  bytesNeeded, numJobs: Cardinal;
  pJ: PJobs;
begin
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
{$IFDEF DELPHI10_UP}
    if not OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
      RaiseLastWin32Error;
{$ELSE}
    if OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
{$ENDIF}
    try
      EnumJobs(hPrinter, 0, 1000, 2, nil, 0, bytesNeeded, numJobs);
      pJ := AllocMem(bytesNeeded);
{$IFDEF DELPHI10_UP}
      if not EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
        RaiseLastWin32Error;
{$ELSE}
      if EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
{$ENDIF}
      Result := SavePChar(pJ^[FJobIndex].pDocument);
    finally
      ClosePrinter(hPrinter);
    end;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Die Jobnamen aus der Druckerqueue ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetJobNameList: TStrings;
type
  TJobs  = array [0..1000] of JOB_INFO_2;
  PJobs = ^TJobs;
var
  hPrinter, DevM: THandle;
  bytesNeeded, numJobs, j: Cardinal;
  pJ: PJobs;
begin
  if FJobNameList = nil then
  begin
    try
      FJobNameList := TStringList.Create;
    except
      FJobNameList.Free;
      FJobNameList := nil;
    raise;
    end;
  end;
  FJobNameList.Clear;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
{$IFDEF DELPHI10_UP}
    if not OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
      RaiseLastWin32Error;
{$ELSE}
    if OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
{$ENDIF}
    try
      EnumJobs(hPrinter, 0, 1000, 2, nil, 0, bytesNeeded, numJobs);
      pJ := AllocMem(bytesNeeded);
{$IFDEF DELPHI10_UP}
      if not EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
        RaiseLastWin32Error;
{$ELSE}
      if EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
{$ENDIF}
      if numJobs = 0 then
        FJobNameList.Add(rsNoJobs)
      else
        for j := 0 to Pred(numJobs) do
          FJobNameList.Add(SavePChar(pJ^[j].pDocument));
    finally
      ClosePrinter(hPrinter);
    end;
  end;
  Result := FJobNameList;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Ermitteln des Datums und der Uhrzeit, wann der Druckauftrag übermittelt
///  wurde.
///  { TPrinterCustom }
///
function TPrinterCustom.GetSubmitTime: string;
type
  TJobs  = array [0..1000] of JOB_INFO_2;
  PJobs = ^TJobs;
var
  hPrinter, DevM: THandle;
  bytesNeeded, numJobs: Cardinal;
  pJ: PJobs;
  SubmitTime : TSystemTime;
begin
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
{$IFDEF DELPHI10_UP}
    if not OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
      RaiseLastWin32Error;
{$ELSE}
    if OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
{$ENDIF}
    try
      EnumJobs(hPrinter, 0, 1000, 2, nil, 0, bytesNeeded, numJobs);
      pJ := AllocMem(bytesNeeded);
{$IFDEF DELPHI10_UP}
      if not EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
        RaiseLastWin32Error;
{$ELSE}
      if EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
{$ENDIF}
        SubmitTime := pJ^[FJobIndex].Submitted;
    finally
      ClosePrinter(hPrinter);
    end;
    Result := IntToStr(SubmitTime.wHour) + ':' +
              IntToStr(SubmitTime.wMinute) + ':' +
              IntToStr(SubmitTime.wSecond) + ' ' +
              IntToStr(SubmitTime.wDay) + '.' +
              IntToStr(SubmitTime.wMonth) + '.' +
              IntToStr(SubmitTime.wYear);
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Ermitteln, ob der Drucker Duplex drucken kann
///  Quelle : http://www.swissdelphicenter.ch/de/showcode.php?id=1961
///  { TPrinterCustom }
///
function TPrinterCustom.GetSupportDuplex: Boolean;
var
  DevM : THandle;
begin
  Result := False;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
    Result := WinSpool.DeviceCapabilities(PPrinter^.pPrinterName, PPrinter^.pPortName, DC_DUPLEX, nil, nil) <> 0;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Den Besitzer eines Jobs ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetJobOwner: string;
type
  TJobs  = array [0..1000] of JOB_INFO_2;
  PJobs = ^TJobs;
var
  hPrinter, DevM: THandle;
  bytesNeeded, numJobs: Cardinal;
  pJ: PJobs;
begin
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
{$IFDEF DELPHI10_UP}
    if not OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
      RaiseLastWin32Error;
{$ELSE}
    if OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
{$ENDIF}
    try
      EnumJobs(hPrinter, 0, 1000, 2, nil, 0, bytesNeeded, numJobs);
      pJ := AllocMem(bytesNeeded);
{$IFDEF DELPHI10_UP}
      if not EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
        RaiseLastWin32Error;
{$ELSE}
      if EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
{$ENDIF}
      Result := SavePChar(pJ^[FJobIndex].pUserName);
    finally
      ClosePrinter(hPrinter);
    end;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Ermitteln, wieviele Seiten der Druckauftrag enthält
///  { TPrinterCustom }
///
function TPrinterCustom.GetJobPages: Integer;
type
  TJobs  = array [0..1000] of JOB_INFO_2;
  PJobs = ^TJobs;
var
  hPrinter, DevM: THandle;
  bytesNeeded, numJobs: Cardinal;
  pJ: PJobs;
begin
  Result := 0;
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
{$IFDEF DELPHI10_UP}
    if not OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
      RaiseLastWin32Error;
{$ELSE}
    if OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
{$ENDIF}
    try
      EnumJobs(hPrinter, 0, 1000, 2, nil, 0, bytesNeeded, numJobs);
      pJ := AllocMem(bytesNeeded);
{$IFDEF DELPHI10_UP}
      if not EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
        RaiseLastWin32Error;
{$ELSE}
      if EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
{$ENDIF}
      Result := pJ^[FJobIndex].TotalPages;
    finally
      ClosePrinter(hPrinter);
    end;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Die Größe des Druckjobs ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetJobSize: string;
type
  TJobs  = array [0..1000] of JOB_INFO_2;
  PJobs = ^TJobs;
var
  hPrinter, DevM: THandle;
  bytesNeeded, numJobs: Cardinal;
  pJ: PJobs;
begin
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
{$IFDEF DELPHI10_UP}
    if not OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
      RaiseLastWin32Error;
{$ELSE}
    if OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
{$ENDIF}
    try
      EnumJobs(hPrinter, 0, 1000, 2, nil, 0, bytesNeeded, numJobs);
      pJ := AllocMem(bytesNeeded);
{$IFDEF DELPHI10_UP}
      if not EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
        RaiseLastWin32Error;
{$ELSE}
      if EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
{$ENDIF}
      Result := FormatSize(pJ^[FJobIndex].Size);
    finally
      ClosePrinter(hPrinter);
    end;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Den Status eines Jobs ermitteln
///  { TPrinterCustom }
///
function TPrinterCustom.GetJobStatus: string;
type
  TJobs  = array [0..1000] of JOB_INFO_2;
  PJobs = ^TJobs;
var
  hPrinter, DevM: THandle;
  bytesNeeded, numJobs: Cardinal;
  pJ: PJobs;
begin
  if FAllInfos.Count <> 0 then
  begin
    PPrinter := FAllInfos.Items[FPrinterIndex];
    Printer.GetPrinter(PPrinter^.pPrinterName, PPrinter^.pDriverName, PPrinter^.pPortName, DevM);
{$IFDEF DELPHI10_UP}
    if not OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
      RaiseLastWin32Error;
{$ELSE}
    if OpenPrinter(PPrinter^.pPrinterName, hPrinter, nil) then
{$ENDIF}
    try
      EnumJobs(hPrinter, 0, 1000, 2, nil, 0, bytesNeeded, numJobs);
      pJ := AllocMem(bytesNeeded);
{$IFDEF DELPHI10_UP}
      if not EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
        RaiseLastWin32Error;
{$ELSE}
      if EnumJobs(hPrinter, 0, 1000, 2, pJ, bytesNeeded, bytesNeeded, numJobs) then
{$ENDIF}
      case pJ^[FJobIndex].Status of
        JOB_STATUS_PAUSED            : Result := rsJobPaused;
        JOB_STATUS_ERROR             : Result := rsJobError;
        JOB_STATUS_DELETING          : Result := rsJobDeleting;
        JOB_STATUS_SPOOLING          : Result := rsJobSpooling;
        JOB_STATUS_PRINTING          : Result := rsJobPrinting;
        JOB_STATUS_OFFLINE           : Result := rsJobOffline;
        JOB_STATUS_PAPEROUT          : Result := rsJobPaperOut;
        JOB_STATUS_PRINTED           : Result := rsJobPrinted;
        JOB_STATUS_DELETED           : Result := rsJobDeleted;
        JOB_STATUS_BLOCKED_DEVQ      : Result := rsJobBlockedDEVQ;
        JOB_STATUS_USER_INTERVENTION : Result := rsJobUserIntervention;
        JOB_STATUS_RESTART           : Result := rsJobRestart;
      end;
    finally
      ClosePrinter(hPrinter);
    end;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
///
///  Ermitteln der Papierformate des Druckers
///  Quelle : http://www.swissdelphicenter.ch/de/showcode.php?id=792
/// { TPrinterInfo }
///
procedure TPrinterInfo.GetPaperSizes(const APaperSize: TStrings);
type
  TPaperName      = array [0..63] of Char;
  TPaperNameArray = array [1..High(Word) div SizeOf(TPaperName)] of TPaperName;
  PPapernameArray = ^TPaperNameArray;
var
  Device, Driver, Port: array [0..255] of Char;
  hDevMode: THandle;
  i, numPaperformats: Integer;
  pPaperFormats: PPapernameArray;
begin
  Printer.PrinterIndex := FPrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDevmode);
  numPaperformats := WinSpool.DeviceCapabilities(Device, Port, DC_PAPERNAMES, nil, nil);
  if numPaperformats > 0 then
  begin
    GetMem(pPaperformats, numPaperformats * SizeOf(TPapername));
    try
      WinSpool.DeviceCapabilities(Device, Port, DC_PAPERNAMES, PChar(pPaperFormats), nil);
      APaperSize.Clear;
      for i := 1 to numPaperformats do
        APaperSize.Add(pPaperformats^[i]);
    finally
      FreeMem(pPaperformats);
    end;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
///
///  Ermitteln der Papierschächte des Druckers
///  Quelle : http://www.swissdelphicenter.ch/de/showcode.php?id=796
///  { TPrinterInfo }
///
procedure TPrinterInfo.GetPaperTrays(const APaperTrays: TStrings);
type
  TBinName      = array [0..23] of Char;
  TBinNameArray = array [1..High(Integer) div SizeOf(TBinName)] of TBinName;
  PBinnameArray = ^TBinNameArray;
  TBinArray     = array [1..High(Integer) div SizeOf(Word)] of Word;
  PBinArray     = ^TBinArray;
var
  Device, Driver, Port: array [0..255] of Char;
  hDevMode: THandle;
  i, numBinNames, numBins, temp: Integer;
  pBinNames: PBinnameArray;
  pBins: PBinArray;
begin
  if not Assigned(APaperTrays) then
    raise Exception.Create('Problems to read out the paper trays');
  if FAllInfos.Count <> 0 then
  begin
    Printer.PrinterIndex := FPrinterIndex;
    Printer.GetPrinter(Device, Driver, Port, hDevmode);
    numBinNames := WinSpool.DeviceCapabilities(Device, Port, DC_BINNAMES, nil, nil);
    numBins     := WinSpool.DeviceCapabilities(Device, Port, DC_BINS, nil, nil);
    if numBins <> numBinNames then
    begin
      raise Exception.Create('DeviceCapabilities reports different number of bins and bin names!');
    end;
    if numBinNames > 0 then
    begin
      GetMem(pBinNames, numBinNames * SizeOf(TBinname));
      GetMem(pBins, numBins * SizeOf(Word));
      try
        WinSpool.DeviceCapabilities(Device, Port, DC_BINNAMES, PChar(pBinNames), nil);
        WinSpool.DeviceCapabilities(Device, Port, DC_BINS, PChar(pBins), nil);
        APaperTrays.Clear;
        for i := 1 to numBinNames do
        begin
          temp := pBins^[i];
          APaperTrays.addObject(pBinNames^[i], TObject(temp));
        end;
      finally
        FreeMem(pBinNames);
        if pBins <> nil then
          FreeMem(pBins);
      end;
    end;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
end.
