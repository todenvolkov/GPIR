object SplashForm: TSplashForm
  Left = 801
  Top = 406
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = #1055#1088#1086#1077#1082#1090' X7'
  ClientHeight = 171
  ClientWidth = 229
  Color = clBtnFace
  TransparentColorValue = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 229
    Height = 171
    Align = alClient
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 156
      Width = 116
      Height = 13
      Caption = #169' '#1055#1088#1086#1077#1082#1090' '#1061'7, '#1089#1073#1086#1088#1082#1072' 0'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 103
      Top = 90
      Width = 33
      Height = 18
      Cursor = crHandPoint
      Caption = #1042#1093#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label2Click
      OnMouseEnter = Label2MouseEnter
    end
    object Label4: TLabel
      Left = 150
      Top = 72
      Width = 43
      Height = 13
      Cursor = crHandPoint
      Alignment = taRightJustify
      Caption = #1069#1090#1086' '#1085#1077' '#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label4Click
    end
    object Label5: TLabel
      Left = 209
      Top = 0
      Width = 20
      Height = 16
      Cursor = crHandPoint
      Caption = '|X|'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Label5Click
    end
    object Image1: TImage
      Left = 110
      Top = 114
      Width = 16
      Height = 16
      AutoSize = True
      Center = True
      Transparent = True
    end
    object StatusLabel: TLabel
      Left = 15
      Top = 132
      Width = 3
      Height = 11
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Progress: TProgressBar
      Left = 11
      Top = 144
      Width = 206
      Height = 6
      Smooth = True
      SmoothReverse = True
      TabOrder = 1
    end
    object PageControl: TPageControl
      Left = 11
      Top = 14
      Width = 206
      Height = 59
      ActivePage = DomainTab
      Style = tsButtons
      TabOrder = 0
      object DomainTab: TTabSheet
        Caption = 'DomainTab'
        TabVisible = False
        object Label3: TLabel
          Left = 16
          Top = 16
          Width = 179
          Height = 30
          Cursor = crHandPoint
          Alignment = taCenter
          AutoSize = False
          Caption = #1055#1077#1090#1088#1086#1074' '#1055#1077#1090#1088' '#1055#1077#1090#1088#1086#1074#1080#1095
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
      end
      object OtherTab: TTabSheet
        Caption = 'OtherTab'
        ImageIndex = 1
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Login: TEdit
          Left = 25
          Top = 3
          Width = 153
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          Text = #1051#1086#1075#1080#1085
          OnKeyPress = LoginKeyPress
        end
        object Password: TMaskEdit
          Left = 25
          Top = 27
          Width = 153
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          PasswordChar = '*'
          TabOrder = 1
          OnKeyPress = PasswordKeyPress
        end
      end
    end
  end
end
