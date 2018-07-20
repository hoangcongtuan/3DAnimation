object frm_pro: Tfrm_pro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frm_pro'
  ClientHeight = 369
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 32
    Top = 8
    Width = 401
    Height = 305
    Caption = #7842'nh'
    TabOrder = 0
    object Bevel1: TBevel
      Left = 2
      Top = 15
      Width = 397
      Height = 288
      Align = alClient
      ExplicitLeft = 152
      ExplicitTop = 104
      ExplicitWidth = 50
      ExplicitHeight = 50
    end
    object Image1: TImage
      Left = 2
      Top = 15
      Width = 397
      Height = 288
      Align = alClient
      ExplicitLeft = 3
    end
  end
  object BitBtn1: TBitBtn
    Left = 450
    Top = 23
    Width = 75
    Height = 34
    Caption = 'OK'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 450
    Top = 72
    Width = 75
    Height = 41
    Caption = 'Cancel'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 450
    Top = 136
    Width = 75
    Height = 41
    Caption = 'Ch'#7885'n '#7843'nh'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 464
    Top = 200
  end
end
