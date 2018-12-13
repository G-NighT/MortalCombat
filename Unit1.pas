unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, acPNG, StdCtrls, MPlayer, Buttons;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    SpeedButton2: TSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Image3: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MASSCstop: array[1..9] of string;
  MASSCstopleft: array[1..9] of string;
  MASSCbeg: array[1..12] of string;
  MASSCbegleft: array[1..12] of string;
  MASSCkick: array[1..8] of string;
  MASSCkickleft: array[1..8] of string;
  MASSCsid: array[1..3] of string;
  MASSCsidleft: array[1..3] of string;
  MASSChand: array[1..6] of string;
  MASSChandleft: array[1..6] of string;
  MASSChandup: array[1..8] of string;
  MASSChandupleft: array[1..8] of string;
  //������ �����
  MASSCstop2: array[1..9] of string;
  MASSCstopleft2: array[1..9] of string;
  MASSCbeg2: array[1..12] of string;
  MASSCbegleft2: array[1..12] of string;
  MASSCkick2: array[1..8] of string;
  MASSCkickleft2: array[1..8] of string;
  MASSCsid2: array[1..3] of string;
  MASSCsidleft2: array[1..3] of string;
  MASSChand2: array[1..6] of string;
  MASSChandleft2: array[1..6] of string;
  MASSChandup2: array[1..8] of string;
  MASSChandupleft2: array[1..8] of string;

  Starter, SCstop, SCstopleft, SCbeg, SCbegleft, SCkick, SCkickleft, SCsid,
  SCsidleft, SChand, SChandup, SChandleft, SChandupleft,{������ �����}
  Starter2, SCstop2, SCstopleft2, SCbeg2, SCbegleft2, SCkick2, SCkickleft2,
  SCsid2, SCsidleft2, SChand2, SChandup2, SChandleft2, SChandupleft2: byte;
  SizeH, SizeW, SidDowner: integer;
  Tagart: boolean;

implementation

{$R *.dfm}

//����� - ������. �������� �� ��������.
procedure TForm1.Timer1Timer(Sender: TObject);
begin
Case Starter of
0 : begin          //�������� ��������� ����, ����������� ������
    SCkick:=1;
    inc(SCstop);
    image1.Picture.LoadFromFile(MASSCstop[SCstop]);
      if SCstop>=9 then
      SCstop:=1;
    end;

1 : begin          //�������� ����, ����������� ������
    inc(SCbeg);
    image1.Picture.LoadFromFile(MASSCbeg[SCbeg]);
      if SCbeg>=12 then
      SCbeg:=1;
    end;

2 : begin          //�������� ����� ����� � ���������, ����������� ������
    inc(SCkick);
    image1.Picture.LoadFromFile(MASSCkick[SCkick]);
    if SCkick>=8 then
      begin
      SCkick:=1;
      Starter:=0;
      end;
    end;

3 : begin          //�������� ��������� ����, ����������� ������
    inc(SCsid);
    image1.Picture.LoadFromFile(MASSCsid[SCsid]);
    image1.Top:=image1.Top+20;
      if SCsid>=3 then
      SCsid:=1;
    end;

4 : begin          //�������� ����, ����������� �����
    inc(SCbegleft);
    image1.Picture.LoadFromFile(MASSCbegleft[SCbegleft]);
      if SCbegleft>=12 then
      SCbegleft:=1;
    end;

5 : begin          //�������� ��������� ����, ����������� �����
    SCkickleft:=1;
    inc(SCstopleft);
    image1.Picture.LoadFromFile(MASSCstopleft[SCstopleft]);
      if SCstopleft>=9 then
      SCstopleft:=1;
    end;

6 : begin          //�������� ����� ����� � ���������, ����������� �����
    inc(SCkickleft);
    image1.Picture.LoadFromFile(MASSCkickleft[SCkickleft]);
    if SCkickleft>=8 then
      begin
      SCkickleft:=1;
      Starter:=5;
      end;
    end;

7 : begin          //�������� ��������� ����, ����������� �����
    inc(SCsidleft);
    image1.Picture.LoadFromFile(MASSCsidleft[SCsidleft]);
    image1.Top:=image1.Top+20;
      if SCsidleft>=3 then
      SCsidleft:=1;
    end;

8 : begin          //�������� ����� ����� �����, ����������� ������
    inc(SChand);
    image1.Picture.LoadFromFile(MASSChand[SChand]);
    if SChand>=6 then
      begin
      SChand:=1;
      Starter:=0;
      end;
    end;

9 : begin          //�������� ����� ����� �����, ����������� ������
    inc(SChandup);
    image1.Picture.LoadFromFile(MASSChandup[SChandup]);
    if SChandup>=6 then
      begin
      SChandup:=1;
      Starter:=0;
      end;
    end;

10 : begin          //�������� ����� ����� �����, ����������� �����
    inc(SChandleft);
    image1.Picture.LoadFromFile(MASSChandleft[SChandleft]);
    if SChandleft>=6 then
      begin
      SChandleft:=1;
      Starter:=5;
      end;
    end;

11 : begin          //�������� ����� ����� �����, ����������� �����
    inc(SChandupleft);
    image1.Picture.LoadFromFile(MASSChandupleft[SChandupleft]);
    if SChandupleft>=6 then
      begin
      SChandupleft:=1;
      Starter:=5;
      end;
    end;
end;

Case Starter2 of
20 : begin          //�������� ��������� ����, ����������� ������
    SCkick2:=1;
    inc(SCstop2);
    image3.Picture.LoadFromFile(MASSCstop2[SCstop2]);
      if SCstop2>=9 then
      SCstop2:=1;
    end;

21 : begin          //�������� ����, ����������� ������
    inc(SCbeg2);
    image3.Picture.LoadFromFile(MASSCbeg2[SCbeg2]);
      if SCbeg2>=12 then
      SCbeg2:=1;
    end;

22 : begin          //�������� ����� ����� � ���������, ����������� ������
    inc(SCkick2);
    image3.Picture.LoadFromFile(MASSCkick2[SCkick2]);
    if SCkick2>=8 then
      begin
      SCkick2:=1;
      Starter:=20;
      end;
    end;

23 : begin          //�������� ��������� ����, ����������� ������
    inc(SCsid2);
    image3.Picture.LoadFromFile(MASSCsid2[SCsid2]);
    image3.Top:=image3.Top+20;
      if SCsid2>=3 then
      SCsid2:=1;
    end;

24 : begin          //�������� ����, ����������� �����
    inc(SCbegleft2);
    image3.Picture.LoadFromFile(MASSCbegleft2[SCbegleft2]);
      if SCbegleft2>=12 then
      SCbegleft2:=1;
    end;

25 : begin          //�������� ��������� ����, ����������� �����
    SCkickleft2:=1;
    inc(SCstopleft2);
    image3.Picture.LoadFromFile(MASSCstopleft2[SCstopleft2]);
      if SCstopleft2>=9 then
      SCstopleft2:=1;
    end;

26 : begin          //�������� ����� ����� � ���������, ����������� �����
    inc(SCkickleft2);
    image3.Picture.LoadFromFile(MASSCkickleft2[SCkickleft2]);
    if SCkickleft2>=8 then
      begin
      SCkickleft2:=1;
      Starter:=25;
      end;
    end;

27 : begin          //�������� ��������� ����, ����������� �����
    inc(SCsidleft2);
    image3.Picture.LoadFromFile(MASSCsidleft2[SCsidleft2]);
    image3.Top:=image3.Top+20;
      if SCsidleft2>=3 then
      SCsidleft2:=1;
    end;

28 : begin          //�������� ����� ����� �����, ����������� ������
    inc(SChand2);
    image3.Picture.LoadFromFile(MASSChand2[SChand2]);
    if SChand2>=6 then
      begin
      SChand2:=1;
      Starter:=20;
      end;
    end;

29 : begin          //�������� ����� ����� �����, ����������� ������
    inc(SChandup2);
    image3.Picture.LoadFromFile(MASSChandup2[SChandup2]);
    if SChandup2>=6 then
      begin
      SChandup2:=1;
      Starter:=20;
      end;
    end;

30 : begin          //�������� ����� ����� �����, ����������� �����
    inc(SChandleft2);
    image3.Picture.LoadFromFile(MASSChandleft2[SChandleft2]);
    if SChandleft2>=6 then
      begin
      SChandleft2:=1;
      Starter:=25;
      end;
    end;

31 : begin          //�������� ����� ����� �����, ����������� �����
    inc(SChandupleft2);
    image3.Picture.LoadFromFile(MASSChandupleft2[SChandupleft2]);
    if SChandupleft2>=6 then
      begin
      SChandupleft2:=1;
      Starter:=25;
      end;
    end;
end;
end;

//����� - �������� �����. �������� �� ���������.
procedure TForm1.FormCreate(Sender: TObject);
begin
Starter:=0;
Starter2:=20;
SizeW:=560;
SizeH:=360;

with MediaPlayer1 do
begin
FileName:='Resourse\MortalCombat.mp3';
Open;
Play;
end;

MASSCbeg[1]:='Resourse\01.png';
MASSCbeg[2]:='Resourse\02.png';
MASSCbeg[3]:='Resourse\03.png';
MASSCbeg[4]:='Resourse\04.png';
MASSCbeg[5]:='Resourse\05.png';
MASSCbeg[6]:='Resourse\06.png';
MASSCbeg[7]:='Resourse\07.png';
MASSCbeg[8]:='Resourse\08.png';
MASSCbeg[9]:='Resourse\09.png';
MASSCbeg[10]:='Resourse\10.png';
MASSCbeg[11]:='Resourse\11.png';
MASSCbeg[12]:='Resourse\12.png';

MASSCbegleft[1]:='Resourse\01 - �����.png';
MASSCbegleft[2]:='Resourse\02 - �����.png';
MASSCbegleft[3]:='Resourse\03 - �����.png';
MASSCbegleft[4]:='Resourse\04 - �����.png';
MASSCbegleft[5]:='Resourse\05 - �����.png';
MASSCbegleft[6]:='Resourse\06 - �����.png';
MASSCbegleft[7]:='Resourse\07 - �����.png';
MASSCbegleft[8]:='Resourse\08 - �����.png';
MASSCbegleft[9]:='Resourse\09 - �����.png';
MASSCbegleft[10]:='Resourse\10 - �����.png';
MASSCbegleft[11]:='Resourse\11 - �����.png';
MASSCbegleft[12]:='Resourse\12 - �����.png';

MASSCstop[1]:='Resourse\a01.png';
MASSCstop[2]:='Resourse\a02.png';
MASSCstop[3]:='Resourse\a03.png';
MASSCstop[4]:='Resourse\a04.png';
MASSCstop[5]:='Resourse\a05.png';
MASSCstop[6]:='Resourse\a06.png';
MASSCstop[7]:='Resourse\a07.png';
MASSCstop[8]:='Resourse\a08.png';
MASSCstop[9]:='Resourse\a09.png';

MASSCstopleft[1]:='Resourse\a01 - �����.png';
MASSCstopleft[2]:='Resourse\a02 - �����.png';
MASSCstopleft[3]:='Resourse\a03 - �����.png';
MASSCstopleft[4]:='Resourse\a04 - �����.png';
MASSCstopleft[5]:='Resourse\a05 - �����.png';
MASSCstopleft[6]:='Resourse\a06 - �����.png';
MASSCstopleft[7]:='Resourse\a07 - �����.png';
MASSCstopleft[8]:='Resourse\a08 - �����.png';
MASSCstopleft[9]:='Resourse\a09 - �����.png';

MASSCkick[1]:='Resourse\r01.png';
MASSCkick[2]:='Resourse\r02.png';
MASSCkick[3]:='Resourse\r03.png';
MASSCkick[4]:='Resourse\r04.png';
MASSCkick[5]:='Resourse\r05.png';
MASSCkick[6]:='Resourse\r06.png';
MASSCkick[7]:='Resourse\r07.png';
MASSCkick[8]:='Resourse\r08.png';

MASSCkickleft[1]:='Resourse\r01 - �����.png';
MASSCkickleft[2]:='Resourse\r02 - �����.png';
MASSCkickleft[3]:='Resourse\r03 - �����.png';
MASSCkickleft[4]:='Resourse\r04 - �����.png';
MASSCkickleft[5]:='Resourse\r05 - �����.png';
MASSCkickleft[6]:='Resourse\r06 - �����.png';
MASSCkickleft[7]:='Resourse\r07 - �����.png';
MASSCkickleft[8]:='Resourse\r08 - �����.png';

MASSCsid[1]:='Resourse\d01.png';
MASSCsid[2]:='Resourse\d02.png';
MASSCsid[3]:='Resourse\d03.png';

MASSCsidleft[1]:='Resourse\d01 - �����.png';
MASSCsidleft[2]:='Resourse\d02 - �����.png';
MASSCsidleft[3]:='Resourse\d03 - �����.png';

MASSChand[1]:='Resourse\k01.png';
MASSChand[2]:='Resourse\k02.png';
MASSChand[3]:='Resourse\k03.png';
MASSChand[4]:='Resourse\k04.png';
MASSChand[5]:='Resourse\k05.png';
MASSChand[6]:='Resourse\k06.png';

MASSChandup[1]:='Resourse\o01.png';
MASSChandup[2]:='Resourse\o02.png';
MASSChandup[3]:='Resourse\o03.png';
MASSChandup[4]:='Resourse\o04.png';
MASSChandup[5]:='Resourse\o05.png';
MASSChandup[6]:='Resourse\o06.png';
MASSChandup[7]:='Resourse\o07.png';
MASSChandup[8]:='Resourse\o08.png';

MASSChandleft[1]:='Resourse\k01 - �����.png';
MASSChandleft[2]:='Resourse\k02 - �����.png';
MASSChandleft[3]:='Resourse\k03 - �����.png';
MASSChandleft[4]:='Resourse\k04 - �����.png';
MASSChandleft[5]:='Resourse\k05 - �����.png';
MASSChandleft[6]:='Resourse\k06 - �����.png';

MASSChandupleft[1]:='Resourse\o01 - �����.png';
MASSChandupleft[2]:='Resourse\o02 - �����.png';
MASSChandupleft[3]:='Resourse\o03 - �����.png';
MASSChandupleft[4]:='Resourse\o04 - �����.png';
MASSChandupleft[5]:='Resourse\o05 - �����.png';
MASSChandupleft[6]:='Resourse\o06 - �����.png';
MASSChandupleft[7]:='Resourse\o07 - �����.png';
MASSChandupleft[8]:='Resourse\o08 - �����.png';

//������ �����

MASSCbeg2[1]:='Resourse\������ �����\01.png';
MASSCbeg2[2]:='Resourse\������ �����\02.png';
MASSCbeg2[3]:='Resourse\������ �����\03.png';
MASSCbeg2[4]:='Resourse\������ �����\04.png';
MASSCbeg2[5]:='Resourse\������ �����\05.png';
MASSCbeg2[6]:='Resourse\������ �����\06.png';
MASSCbeg2[7]:='Resourse\������ �����\07.png';
MASSCbeg2[8]:='Resourse\������ �����\08.png';
MASSCbeg2[9]:='Resourse\������ �����\09.png';
MASSCbeg2[10]:='Resourse\������ �����\10.png';
MASSCbeg2[11]:='Resourse\������ �����\11.png';
MASSCbeg2[12]:='Resourse\������ �����\12.png';

MASSCbegleft2[1]:='Resourse\������ �����\01 - �����.png';
MASSCbegleft2[2]:='Resourse\������ �����\02 - �����.png';
MASSCbegleft2[3]:='Resourse\������ �����\03 - �����.png';
MASSCbegleft2[4]:='Resourse\������ �����\04 - �����.png';
MASSCbegleft2[5]:='Resourse\������ �����\05 - �����.png';
MASSCbegleft2[6]:='Resourse\������ �����\06 - �����.png';
MASSCbegleft2[7]:='Resourse\������ �����\07 - �����.png';
MASSCbegleft2[8]:='Resourse\������ �����\08 - �����.png';
MASSCbegleft2[9]:='Resourse\������ �����\09 - �����.png';
MASSCbegleft2[10]:='Resourse\������ �����\10 - �����.png';
MASSCbegleft2[11]:='Resourse\������ �����\11 - �����.png';
MASSCbegleft2[12]:='Resourse\12 - �����.png';

MASSCstop2[1]:='Resourse\������ �����\a01.png';
MASSCstop2[2]:='Resourse\������ �����\a02.png';
MASSCstop2[3]:='Resourse\������ �����\a03.png';
MASSCstop2[4]:='Resourse\������ �����\a04.png';
MASSCstop2[5]:='Resourse\������ �����\a05.png';
MASSCstop2[6]:='Resourse\������ �����\a06.png';
MASSCstop2[7]:='Resourse\������ �����\a07.png';
MASSCstop2[8]:='Resourse\������ �����\a08.png';
MASSCstop2[9]:='Resourse\������ �����\a09.png';

MASSCstopleft2[1]:='Resourse\������ �����\a01 - �����.png';
MASSCstopleft2[2]:='Resourse\������ �����\a02 - �����.png';
MASSCstopleft2[3]:='Resourse\������ �����\a03 - �����.png';
MASSCstopleft2[4]:='Resourse\������ �����\a04 - �����.png';
MASSCstopleft2[5]:='Resourse\������ �����\a05 - �����.png';
MASSCstopleft2[6]:='Resourse\������ �����\a06 - �����.png';
MASSCstopleft2[7]:='Resourse\������ �����\a07 - �����.png';
MASSCstopleft2[8]:='Resourse\������ �����\a08 - �����.png';
MASSCstopleft2[9]:='Resourse\������ �����\a09 - �����.png';

MASSCkick2[1]:='Resourse\������ �����\r01.png';
MASSCkick2[2]:='Resourse\������ �����\r02.png';
MASSCkick2[3]:='Resourse\������ �����\r03.png';
MASSCkick2[4]:='Resourse\������ �����\r04.png';
MASSCkick2[5]:='Resourse\������ �����\r05.png';
MASSCkick2[6]:='Resourse\������ �����\r06.png';
MASSCkick2[7]:='Resourse\������ �����\r07.png';
MASSCkick2[8]:='Resourse\������ �����\r08.png';

MASSCkickleft2[1]:='Resourse\������ �����\r01 - �����.png';
MASSCkickleft2[2]:='Resourse\������ �����\r02 - �����.png';
MASSCkickleft2[3]:='Resourse\������ �����\r03 - �����.png';
MASSCkickleft2[4]:='Resourse\������ �����\r04 - �����.png';
MASSCkickleft2[5]:='Resourse\������ �����\r05 - �����.png';
MASSCkickleft2[6]:='Resourse\������ �����\r06 - �����.png';
MASSCkickleft2[7]:='Resourse\������ �����\r07 - �����.png';
MASSCkickleft2[8]:='Resourse\������ �����\r08 - �����.png';

MASSCsid2[1]:='Resourse\������ �����\d01.png';
MASSCsid2[2]:='Resourse\������ �����\d02.png';
MASSCsid2[3]:='Resourse\������ �����\d03.png';

MASSCsidleft2[1]:='Resourse\������ �����\d01 - �����.png';
MASSCsidleft2[2]:='Resourse\������ �����\d02 - �����.png';
MASSCsidleft2[3]:='Resourse\������ �����\d03 - �����.png';

MASSChand2[1]:='Resourse\������ �����\k01.png';
MASSChand2[2]:='Resourse\������ �����\k02.png';
MASSChand2[3]:='Resourse\������ �����\k03.png';
MASSChand2[4]:='Resourse\������ �����\k04.png';
MASSChand2[5]:='Resourse\������ �����\k05.png';
MASSChand2[6]:='Resourse\������ �����\k06.png';

MASSChandup2[1]:='Resourse\������ �����\o01.png';
MASSChandup2[2]:='Resourse\������ �����\o02.png';
MASSChandup2[3]:='Resourse\������ �����\o03.png';
MASSChandup2[4]:='Resourse\������ �����\o04.png';
MASSChandup2[5]:='Resourse\������ �����\o05.png';
MASSChandup2[6]:='Resourse\������ �����\o06.png';
MASSChandup2[7]:='Resourse\������ �����\o07.png';
MASSChandup2[8]:='Resourse\������ �����\o08.png';

MASSChandleft2[1]:='Resourse\������ �����\k01 - �����.png';
MASSChandleft2[2]:='Resourse\������ �����\k02 - �����.png';
MASSChandleft2[3]:='Resourse\������ �����\k03 - �����.png';
MASSChandleft2[4]:='Resourse\������ �����\k04 - �����.png';
MASSChandleft2[5]:='Resourse\������ �����\k05 - �����.png';
MASSChandleft2[6]:='Resourse\������ �����\k06 - �����.png';

MASSChandupleft2[1]:='Resourse\������ �����\o01 - �����.png';
MASSChandupleft2[2]:='Resourse\������ �����\o02 - �����.png';
MASSChandupleft2[3]:='Resourse\������ �����\o03 - �����.png';
MASSChandupleft2[4]:='Resourse\������ �����\o04 - �����.png';
MASSChandupleft2[5]:='Resourse\������ �����\o05 - �����.png';
MASSChandupleft2[6]:='Resourse\������ �����\o06 - �����.png';
MASSChandupleft2[7]:='Resourse\������ �����\o07 - �����.png';
MASSChandupleft2[8]:='Resourse\������ �����\o08 - �����.png';
end;

//����� - ������ ������. �������� �� �������� ������ �� �������.
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if key=VK_RIGHT then
  begin
  image1.Left:=image1.Left+10;
  if image1.Left>=form1.Width-80 then
    begin
    image1.Left:=image1.Left-15;
    image2.Left:=image2.Left-15;
    if image2.Left<-370 then
      image2.Left:=image2.Left+15;
    end;
  Starter:=1;
  end;

if key=VK_LEFT then
  begin
  image1.Left:=image1.Left-10;
  if image1.Left<=0 then
    begin
    image1.Left:=image1.Left+15;
    image2.Left:=image2.Left+15;
    if image2.Left>0 then
      image2.Left:=image2.Left-15;
    end;
  Starter:=4;
  end;

if key=VK_DOWN then
  begin
    if image1.top>=form1.Height-130 then
      image1.Top:=image1.Top-25;
    if Starter=0 then
      Starter:=3;
    if Starter=5 then
      Starter:=7;
  end;

if key=VK_UP then
  image1.Top:=image1.Top-10;

//������ �����
if key=68 then
  begin
  image3.Left:=image3.Left+10;
  if image3.Left>=form1.Width-80 then
    begin
    image3.Left:=image3.Left-15;
    image2.Left:=image2.Left-15;
    if image2.Left<-370 then
      image2.Left:=image2.Left+15;
    end;
  Starter2:=21;
  end;

if key=65 then
  begin
  image3.Left:=image3.Left-10;
  if image3.Left<=0 then
    begin
    image3.Left:=image3.Left+15;
    image2.Left:=image2.Left+15;
    if image2.Left>0 then
      image2.Left:=image2.Left-15;
    end;
  Starter2:=24;
  end;

if key=83 then
  begin
    if image3.top>=form1.Height-130 then
      image3.Top:=image3.Top-25;
    if Starter2=20 then
      Starter2:=23;
    if Starter2=25 then
      Starter2:=27;
  end;

if key=87 then
  image3.Top:=image3.Top-10;
end;


//����� - ������ ��������. �������� �� �������� ������ �� ����������.
procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RIGHT then
Starter:=0;

if key=VK_LEFT then
Starter:=5;

if key=VK_DOWN then
  begin
  image1.Top:=form1.Height-160;
  if Starter=3 then
    Starter:=0;
  if Starter=7 then
    Starter:=5;
  end;

if key=VK_UP then
  begin
  if Starter=0 then
    Starter:=0;
  if Starter=5 then
    Starter:=5;
  end;

//������ �����
if key=68 then
Starter2:=20;

if key=65 then
Starter2:=25;

if key=83 then
  begin
  image3.Top:=form1.Height-160;
  if Starter2=23 then
    Starter2:=20;
  if Starter2=27 then
    Starter2:=25;
  end;

if key=87 then
  begin
  if Starter2=20 then
    Starter2:=20;
  if Starter2=25 then
    Starter2:=25;
  end;
end;

//����� - ����������. �������� �� ��������� ������������ ������.
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
mediaplayer1.Pause;
end;

//����� - ��������� ������� �����. �������� �� ��������� ������� Image ��� ��������� ������� �����.
procedure TForm1.FormResize(Sender: TObject);
begin
if abs(SizeH-Form1.Height) > abs(SizeW-Form1.Width)
  then Form1.Width:=round(Form1.Height*1.55)
  else Form1.Height:=round(Form1.Width/1.55);
SizeH:=Form1.Height;
SizeW:=Form1.Width;
{
image1.Stretch:=true;
image1.Height:=round(Form1.Height*1.55);
image1.Width:=round(Form1.Width*1.55);}
end;

//����� - ���. �������� �� ����� ������� �����.
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin

case SpeedButton2.Tag of

0 : begin SpeedButton2.Caption:='Fone 2/3';
image2.Picture.LoadFromFile('Resourse\fone2.png');
image1.top:=170;
SpeedButton2.Tag:=1;
end;

1 : begin SpeedButton2.Caption:='Fone 3/3';
image2.Picture.LoadFromFile('Resourse\fone3.png');
image1.top:=180;
SpeedButton2.Tag:=2;
end;

2 : begin SpeedButton2.Caption:='Fone 1/3';
image2.Picture.LoadFromFile('Resourse\fone.png');
image1.top:=200;
SpeedButton2.Tag:=0;
end;

end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin

if key=#49 then   //���� �����
  begin
  if Starter=0 then
  Starter:=8;
  if Starter=5 then
  Starter:=10;
  end;

if key=#52 then   //���� �����
  begin
  if Starter=0 then
  Starter:=9;
  if Starter=5 then
  Starter:=11;
  end;

if key=#51 then   //���� �����
  begin
  if Starter=0 then
    Starter:=2;
  if Starter=5 then
    Starter:=6;
  end;

if key=#54 then
  case tagart of
    false:begin
          Shape1.Visible:=true;
          Shape2.Visible:=true;
          Shape3.Visible:=true;
          tagart:=true;
          end;
    true: begin
          Shape1.Visible:=false;
          Shape2.Visible:=false;
          Shape3.Visible:=false;
          tagart:=false;
          end;
  end;
end;

end.
