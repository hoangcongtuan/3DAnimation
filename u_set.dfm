object frm_set: Tfrm_set
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frm_set'
  ClientHeight = 106
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 217
    Height = 65
    Caption = 'M'#224'u n'#7873'n'
    TabOrder = 0
    object cl_scene: TColorBox
      Left = 19
      Top = 24
      Width = 145
      Height = 22
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 170
      Top = 24
      Width = 31
      Height = 22
      Caption = '...'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object BitBtn2: TBitBtn
    Left = 304
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OK'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 304
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Cancel'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object ColorDialog1: TColorDialog
    Left = 256
    Top = 24
  end
end
