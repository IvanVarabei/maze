unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label6: TLabel;
    Edit3: TEdit;
    Memo4: TMemo;
    Edit4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
Type
  TSymbol = record
    lett : char;
    count : integer;
    lett_ans : char;
  end;
var
  symb : array [1..26] of TSymbol;
  m : Integer;
  alf : string;


var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.WindowState:=wsMaximized;
  m:=26;
  alf:='etaonisrhldcupfmwybgvkqxjz';
  Memo1.Clear;
  Memo1.Lines.Add('����� �������� �������� �����.');
  Memo2.Clear;
  Memo2.Lines.Add('����� ��������� ������������� �����.');
  Memo3.Clear;
  Memo3.Lines.Add('����� ��������� �������������� �����.');
  Edit1.Text:='A';
  Edit2.Text:='A';
  Edit4.Text:=' ���������� � ���������������';
end;

procedure LETTER();
var
  temp : TSymbol;
  i, j : Integer;
begin

  for i:=1 to m-1 do
    for j:=i+1 to m do
      if symb[i].count<symb[j].count then
      begin
        temp:=symb[i];
        symb[i]:=symb[j];
        symb[j]:=temp;
      end;
  for i:=1 to m do
    symb[i].lett_ans:=alf[i];
end;


function NOD(a, b: Integer):Integer;
begin
  while (a<>0) and (b<>0) do
    if a>b then a:=a mod b
    else b:=b mod a;
  Result:=a+b;
end;

function NEW_CHR(a : char; k : Integer) : Integer;
var
  b:integer;
begin
  b:=((Ord(a)-96)*k) mod m;
  if b=0 then b:=m;
  Result:=(b+96);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i, j, k, nodk, f, q: Integer;
  str, str2 : String;
  c : char;
begin
  for i:=1 to 26 do
    with symb[i] do
      begin
        lett:=chr(i+96);
        count:=0;
        lett_ans:='#';
      end;

  // ��������
  k:=StrToInt(Edit3.Text);
  nodk:=NOD(k,m);

  if (nodk<>1) then
    begin
      Edit4.Clear;
      Edit4.Text := '�� ������� �������!';
    end
  else
  Edit4.Clear;
  if Memo1.Lines[0]<>'' then
  begin
    Memo2.Clear;
    for i:=0 to Memo1.Lines.Count-1 do
      begin
        str:=Memo1.Lines[i];
        str2:=str;
        for j:=1 to Length(str) do
          if (((str[j]>='A') and (str[j]<='Z')) or ((str[j]>='a') and (str[j]<='z'))) then
          begin
            f:=0;
            if ((str[j]>='A') and (str[j]<='Z')) then
            begin
              str[j]:=Chr(Ord(str[j])+32);
              f:=32;
            end;
            str2[j]:=Chr(NEW_CHR(str[j],k)-f);
          end;
        Memo2.Lines.Add(str2);
      end;

    //�����������
    Memo3.Clear;
    for i:=0 to Memo2.Lines.Count-1 do
    begin
    str:=Memo2.Lines[i];
    for j:=1 to Length(str) do
      if (((str[j]>='A') and (str[j]<='Z')) or ((str[j]>='a') and (str[j]<='z'))) then
      begin
        if ((str[j]>='A') and (str[j]<='Z'))
        then c:=Chr(Ord(str[j])+32)
        else c:=str[j];
        for q:=1 to m do
          if (symb[q].lett=c) then
          begin
            Inc(symb[q].count);
             break;
          end;
      end;
    end;

    LETTER();

  for i:=1 to m do
      with symb[i] do
        Memo4.Lines.Add(lett+' '+IntToStr(count)+' ' + lett_ans);

    for i:=0 to Memo2.Lines.Count-1 do
    begin
      str:=Memo2.Lines[i];
      str2:=str;
      for j:=1 to Length(str) do
        if (((str[j]>='A') and (str[j]<='Z')) or ((str[j]>='a') and (str[j]<='z'))) then
        begin
          f:=0;
          if ((str[j]>='A') and (str[j]<='Z'))
          then begin
            c:=Chr(Ord(str[j])+32);
            f:=32;
          end else c:=str[j];
          for  q:=1 to m do
            if c=symb[q].lett then
            begin
              str2[j]:=Chr(Ord(symb[q].lett_ans)-f);
            end;
        end;
      Memo3.Lines.Add(str2);
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  a, b, c :char;
  i, j, f: Integer;
  str : String;
begin
  a:=Edit1.Text[1];
  if (((a>='A') and (a<='Z')) or ((a>='a') and (a<='z'))) then
        if ((a>='A') and (a<='Z'))
        then a:=Chr(Ord(a)+32);
  b:=Edit2.Text[1];
  if (((b>='A') and (b<='Z')) or ((b>='a') and (b<='z'))) then
        if ((b>='A') and (b<='Z'))
        then b:=Chr(Ord(b)+32);

  for i:=1 to m do
    if (symb[i].lett_ans=a) or (symb[i].lett_ans=b) then
      if symb[i].lett_ans=a
      then  symb[i].lett_ans:=b
      else  symb[i].lett_ans:=a;

  if Memo3.Lines[0]<>'' then
    for i:=0 to Memo3.Lines.Count-1 do
      begin
        str:=Memo3.Lines[i];
        for j:=1 to Length(str) do
          if (((str[j]>='A') and (str[j]<='Z')) or
          ((str[j]>='a') and (str[j]<='z'))) then
          begin
            f:=0;
            if ((str[j]>='A') and (str[j]<='Z'))
            then begin
              c:=Chr(Ord(str[j])+32);
              f:=32;
            end else c:=str[j];
            if c=a then str[j]:=Chr(Ord(b)-f);
            if c=b then str[j]:=Chr(Ord(a)-f);
          end;
          Memo3.Lines[i]:=str;
      end;

end;
end.
