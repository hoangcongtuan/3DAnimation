object frm_loadMesh: Tfrm_loadMesh
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frm_loadMesh'
  ClientHeight = 156
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edt_Name: TLabeledEdit
    Left = 16
    Top = 32
    Width = 177
    Height = 21
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = 'T'#234'n '#273#7889'i t'#432#7907'ng'
    TabOrder = 0
  end
  object edt_skin: TLabeledEdit
    Left = 264
    Top = 88
    Width = 177
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'L'#7899'p v'#7887
    TabOrder = 1
  end
  object edt_md2: TLabeledEdit
    Left = 16
    Top = 88
    Width = 177
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'D'#7919' li'#7879'u'
    TabOrder = 2
  end
  object EDT_ani: TLabeledEdit
    Left = 264
    Top = 32
    Width = 177
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'H'#224'nh '#272#7897'ng'
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 463
    Top = 30
    Width = 33
    Height = 25
    Caption = '...'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn4: TBitBtn
    Left = 463
    Top = 88
    Width = 33
    Height = 25
    Caption = '...'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 209
    Top = 86
    Width = 33
    Height = 25
    Caption = '...'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object OpenDialog1: TOpenDialog
    Left = 432
    Top = 112
  end
end
