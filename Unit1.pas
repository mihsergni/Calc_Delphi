unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    function Poisk(sss: string): boolean;
    function Calc_expr(MyExpr : string): string;
    procedure Edit1Enter(Sender: TObject);
  private

  private
    { Private declarations }
  public
    { Public declarations }
    chislo, pamyat : real;
    flag, oper : integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button12Click(Sender: TObject);
var s_f : real;
begin
oper :=3;
flag := 1;
s_f := StrToFloatDef(Edit1.Text, 0);
chislo := s_f;

Label1.Caption:=Edit1.Text + ' * ';

end;

procedure TForm1.Button16Click(Sender: TObject);
var s_f : real;
begin
oper :=2;
flag := 1;
s_f := StrToFloatDef(Edit1.Text, 0);
chislo := s_f;
Label1.Caption:=Edit1.Text + ' - ';

end;

procedure TForm1.Button1Click(Sender: TObject);
var s_f : real;
begin
s_f := StrToFloatDef(Edit1.Text, 0);

case oper of
1 : Edit1.Text:=FloatToStr(chislo * s_f  / 100);
2 : Edit1.Text:=FloatToStr(chislo *  s_f / 100);
3 : Edit1.Text:=FloatToStr(s_f  / 100);
4 : Edit1.Text:=FloatToStr(chislo *  s_f / 100);
end;

end;

procedure TForm1.Button20Click(Sender: TObject);
var s_f : real;
begin
oper := 1;
flag := 1;
s_f := StrToFloatDef(Edit1.Text, 0);
chislo := s_f;
Label1.Caption:=Edit1.Text + ' + ';

end;

procedure TForm1.Button21Click(Sender: TObject);
var s_f : real;
begin
s_f := StrToFloatDef(Edit1.Text, 0);

Edit1.Text:= FloatToStr(s_f * -1);

end;

procedure TForm1.Button23Click(Sender: TObject);
var s : string;
begin
s := Edit1.Text;
if (Pos(',', s) > 0) or (Length(s) = 0)  then exit;

  Edit1.Text := s + ',';

end;

procedure TForm1.Button24Click(Sender: TObject);
var s_f : real;
st : string;
begin

st:= Edit1.Text;

if Poisk(st) then
begin // Обработка арифметического выражения

Edit1.Text := Calc_expr(st);
//ShowMessage('eee');
end;

s_f := StrToFloatDef(Edit1.Text, 0);

if (s_f = 0) and (oper = 4) then
begin
ShowMessage('На ноль делить нельзя!');
exit;
end;

Label1.Caption:=Edit1.Text;

case oper of
1 : Edit1.Text:=FloatToStr(s_f + chislo);
2 : Edit1.Text:=FloatToStr(chislo - s_f);
3 : Edit1.Text:=FloatToStr(chislo * s_f);
4 : Edit1.Text:=FloatToStr(chislo / s_f);
end;

flag:=1;

end;

procedure TForm1.Button25Click(Sender: TObject);
var capt : string;
begin

capt := (Sender as TButton).Caption;

if capt = 'MC' then pamyat := 0;

if capt = 'MR' then Edit1.Text := FloatToStr(pamyat);

if capt = 'M+' then  pamyat := pamyat + StrToFloatDef(Edit1.Text, 0);

if capt = 'M-' then  pamyat := pamyat - StrToFloatDef(Edit1.Text, 0);

if capt = 'MS' then pamyat := StrToFloatDef(Edit1.Text, 0);

if capt = 'Memo' then  ShowMessage(FloatToStr(pamyat));


if pamyat <> 0 then
begin
Button25.Font.Style:=[fsBold];
Button26.Font.Style:=[fsBold];
Button27.Font.Style:=[fsBold];
Button28.Font.Style:=[fsBold];
Button29.Font.Style:=[fsBold];
Button30.Font.Style:=[fsBold];
end else
begin
  Button25.Font.Style:=[];
  Button26.Font.Style:=[];
  Button27.Font.Style:=[];
  Button28.Font.Style:=[];
  Button29.Font.Style:=[];
  Button30.Font.Style:=[];
end;



end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Text:= '0';
  Label1.Caption:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Text:= '0';
  Label1.Caption:='';
  oper := 0;
end;

procedure TForm1.Button4Click(Sender: TObject);
var s : string;
begin
s :=   Edit1.Text;
Delete(s, length(s), 1);
Edit1.Text:=s;

end;

procedure TForm1.Button5Click(Sender: TObject);
var s_f : real;
begin

s_f := StrToFloatDef(Edit1.Text, 0);

if s_f = 0 then
begin
ShowMessage('На ноль делить нельзя!');
exit;
end;


Edit1.Text:=FloatToStr(1/s_f);
end;

procedure TForm1.Button6Click(Sender: TObject);
var s_f : real;
begin

s_f := StrToFloatDef(Edit1.Text, 0);

Edit1.Text:=FloatToStr(s_f * s_f);

end;

procedure TForm1.Button7Click(Sender: TObject);
var s_f : real;
begin

s_f := StrToFloatDef(Edit1.Text, 0);

if s_f < 0 then
begin
ShowMessage('Нельзя извлечь корень из отрицательного числа!');
exit;
end;

Edit1.Text:=FloatToStr(sqrt(s_f));

end;

procedure TForm1.Button8Click(Sender: TObject);
var s_f : real;
begin
oper :=4;
flag := 1;
s_f := StrToFloatDef(Edit1.Text, 0);
chislo := s_f;
Label1.Caption:=Edit1.Text + ' / ';

end;

procedure TForm1.Button9Click(Sender: TObject);
var s_f : real;
begin

if flag <> 0 then begin Edit1.Text:= '';flag := 0;end;

if (Edit1.Text = '0') and ((Sender as TButton).Caption <> ',') then Edit1.Text:= '';

Edit1.Text := Edit1.Text + (Sender as TButton).Caption;

end;

function TForm1.Calc_expr(MyExpr: string): string;
var ch, op :TStringList;
   Rez, ss : string;
   j, fl, i : integer;

  function Poisk(sss: string): boolean;
   var
     r: boolean;
     i, Pos: Integer;
   begin

     for i:=1 to Length(sss) do
     begin
       if ss[i] = '.' then ss[i] := ',';
       if sss[i] in ['+','-','/','*'] then begin r := true;break;end
       else r := false;
     end;

     Result := r;
   end;
begin

  ch:= TStringList.Create;
  op:= TStringList.Create;

  ss := Trim(MyExpr);

    // Удаление пробелов
  j:=-1;
  while j <> 0 do
  begin
   j:= Pos(' ', ss);
   if j > 0 then
    begin
     Delete(ss, j, 1);
    end;
  end;

  // Проверка на запрещенные символы
  for i:=1 to Length(ss) do
  begin
    if not (ss[i] in ['0'..'9', '.', ',','+','-','/','*']) then
    begin
      ShowMessage('В строке есть запрещённые символы!');
      exit;
    end;
  end;


  //Разбивка выражения по операциям
  while  Poisk(ss) do
    begin
  for i:=1 to Length(ss) do
  begin

  if ss[i] = '.' then ss[i] := ',';
  if not (ss[i] in ['0'..'9', '.', ',']) then
  begin
    op.Add(ss[i]);
    ch.Add(Copy(ss,1,i-1));
    delete(ss,1,i);
    if not Poisk(ss) then
    begin
       ch.Add(ss);
       op.Add('@');
    end;
    break;
//    ShowMessage(ss);
  end;
  end;
  end;


  // Выполнение операций умножения и деления
  for i:=0 to op.Count-1 do
  begin

  if (op.Strings[i] = '*') then
  begin
  try
  ch[i+1] := FloatToStr(StrToFloat(ch[i+1]) * StrToFloat(ch[i]));
  except
  ShowMessage('В выражении содержится неверное вещественное число!');
  exit;
  end;
  ch[i] := '#';op[i] := '#';
  end;
  if (op.Strings[i] = '/') then
  begin
  try
  ch[i+1] := FloatToStr(StrToFloat(ch[i]) / StrToFloat(ch[i+1]));
  except
  ShowMessage('В выражении содержится неверное вещественное число!');
  exit;
  end;
  ch[i] := '#';op[i] := '#';
  end;
  end;

  fl:=0;
  while fl <> 1 do
  begin
  i:=0;
  repeat
  begin
   if ch[i] = '#' then
   begin
     ch.Delete(i);op.Delete(i); fl:=0;break;
   end;
   if op[i] <> '@' then
   Inc(i);
   fl := 1;
  end;
  until  op[i] = '@'
  end;


//  ShowMessage('');


// Выполнение операций сложения и вычитания
  for i:=0 to op.Count-1 do
  begin

  if (op.Strings[i] = '+') then
  begin
  try
  ch[i+1] := FloatToStr(StrToFloat(ch[i+1]) + StrToFloat(ch[i]));
  except
    ShowMessage('В выражении содержится неверное вещественное число!');
  exit;
  end;
  ch[i] := '#';op[i] := '#';
  end;
  if (op.Strings[i] = '-') then
  begin
  try
  ch[i+1] := FloatToStr(StrToFloat(ch[i]) - StrToFloat(ch[i+1]));
  except
    ShowMessage('В выражении содержится неверное вещественное число!');
  exit;
  end;
  ch[i] := '#';op[i] := '#';
  end;
  end;

  Rez := ch[ch.Count-1];

  Result :=   Rez;
//  ShowMessage('Результат: ' + Rez);

  ch.Free;op.free;
//
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
if Trim(Edit1.Text) = '0' then Edit1.Text:='';

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
//ShowMessage(Key);
  if not (key in ['1','2','3','4','5','6','7','8','9','0','+','-','*','/',#8]) then Key :=Chr(0);

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
Button24.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
flag := 0;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if not Edit1.Focused then
  begin
  case Key of
  '+' :   Button20.Click;
  '-' :   Button16.Click;
  '*' :   Button12.Click;
  '/' :   Button8.Click;
  '1' :   Button17.Click;
  '2' :   Button18.Click;
  '3' :   Button19.Click;
  '4' :   Button13.Click;
  '5' :   Button14.Click;
  '6' :   Button15.Click;
  '7' :   Button9.Click;
  '8' :   Button10.Click;
  '9' :   Button11.Click;
  '0' :   Button22.Click;
  '.' :   Button23.Click;
  end;
  end;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//ShowMessage(IntToStr(key));

if (Key = 13) then Button24.SetFocus;
if (Key = 102) and (ssCtrl in Shift) then Button7.Click;   //6
if (Key = 101) and (ssCtrl in Shift) then Button6.Click;   //5
if (Key = 100) and (ssCtrl in Shift) then Button5.Click;   //4
if (Key = 103) and (ssCtrl in Shift) then Button1.Click;   //7
if (Key = 104) and (ssCtrl in Shift) then Button2.Click;   //8
if (Key = 105) and (ssCtrl in Shift) then Button3.Click;   //9
if (Key = 97) and (ssCtrl in Shift) then Button21.Click;   //1
if (Key = 38) and (ssCtrl in Shift) then Button30.Click;   //MS
if (Key = 40) and (ssCtrl in Shift) then Button27.Click;   //MR
if (Key = 107) and (ssCtrl in Shift) then Button28.Click;   //M+
if (Key = 109) and (ssCtrl in Shift) then Button29.Click;   //M-
if (Key = 110) and (ssCtrl in Shift) then Button26.Click;   //Memo
if (Key = 46) and (ssCtrl in Shift) then Button25.Click;   //Memo

end;


function TForm1.Poisk(sss: string): boolean;
var
     r: boolean;
     i, Pos: Integer;
begin

 for i:=1 to Length(sss) do
 begin
   if sss[i] in ['+','-','/','*'] then begin r := true;break;end
   else r := false;
 end;

 Result := r;
end;






end.
