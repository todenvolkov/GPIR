object TreeForm: TTreeForm
  Left = 380
  Top = 259
  ActiveControl = cxTreeList1
  BorderStyle = bsSizeToolWin
  Caption = #1053#1072#1074#1080#1075#1072#1090#1086#1088
  ClientHeight = 605
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxTreeList1: TcxTreeList
    Left = 0
    Top = 57
    Width = 297
    Height = 548
    Align = alClient
    Bands = <
      item
      end>
    DragCursor = crDrag
    Images = cxImageList1
    OptionsBehavior.CellHints = True
    OptionsBehavior.ImmediateEditor = False
    OptionsBehavior.IncSearch = True
    OptionsBehavior.IncSearchItem = cxTreeList1Column1
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.HideFocusRect = False
    OptionsView.CellAutoHeight = True
    OptionsView.CellEndEllipsis = True
    OptionsView.ColumnAutoWidth = True
    OptionsView.CheckGroups = True
    OptionsView.SimpleCustomizeBox = True
    PopupMenu = NavigatorMenu
    TabOrder = 0
    OnCustomDrawDataCell = cxTreeList1CustomDrawDataCell
    OnDblClick = cxTreeList1DblClick
    OnDeletion = cxTreeList1Deletion
    Data = {
      000005009F0100000F00000044617461436F6E74726F6C6C6572310100000012
      000000546378537472696E6756616C75655479706506000000445855464D5400
      000900000043043A04350443043A04350443043A043504445855464D54000009
      00000043043A04350443043A04350443043A043504445855464D540000090000
      0043043A04350443043A04350443043A043504445855464D5400000900000043
      043A043504430435043A0443043A043504445855464D5400000900000043043A
      04350443043A04350443043A043504445855464D5400000B00000043043A0435
      04430435043A044304350443043A043504030000000000000002000100000000
      00000000000000FFFFFFFFFFFFFFFFFFFFFFFF010000001A0002000000010000
      0001000000FFFFFFFFFFFFFFFFFFFFFFFF0200000008000200000002000000FF
      FFFFFFFFFFFFFFFFFFFFFF0300000008000300000003000000FFFFFFFFFFFFFF
      FFFFFFFFFF0400000008000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF05
      00000008020000000000000000FFFFFFFFFFFFFFFFFFFFFFFF1A0003000000}
    object cxTreeList1Column1: TcxTreeListColumn
      Caption.Text = #1042#1089#1077#1075#1086' '#1076#1086#1075#1086#1074#1086#1088#1086#1074':'
      DataBinding.ValueType = 'String'
      Width = 155
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 57
    Align = alTop
    BevelEdges = []
    BevelOuter = bvNone
    TabOrder = 1
    object HintLabel: TLabel
      Left = 8
      Top = 33
      Width = 14
      Height = 16
      Cursor = crHandPoint
      Hint = 
        'Calc =  '#1079#1085#1072#1095#1077#1085#1080#1103' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1080#1079#1084#1077#1085#1080#1083#1080#1089#1100', '#1073#1102#1076#1078#1077#1090' '#1090#1088#1077#1073#1091#1077#1090' '#1087#1077#1088#1077#1088#1072#1089#1095 +
        #1077#1090#1072' + #10#13 + Ok = '#1073#1102#1076#1078#1077#1090' '#1085#1077' '#1090#1088#1077#1073#1091#1077#1090' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090#1072
      Alignment = taCenter
      AutoSize = False
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      OnMouseDown = HintLabelMouseDown
      OnMouseUp = HintLabelMouseUp
    end
    object cxButton1: TcxButton
      Left = 8
      Top = 4
      Width = 97
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000000000001020103183B1B7800000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000028592D9C317036D200000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000002C5C319066B06EFF61AA68FF3D8B44FF37833EFF327B
        37FF286A2EEA1C4E20B70F2D1170040B041D0000000000000000000000000000
        0000000000002F5D348473BD7CFF96D19FFF94CF9CFF8FCD96FF8ACA91FF85C7
        8BFF7ABE81FF65AD6CFF4B9251FF19481CB00716083900000000000000000000
        00000000000034663A8A79C483FF9ED7A7FF9BD4A4FF97D29FFF92CF9AFF8DCC
        95FF88CA90FF7AC282FF7EC485FF5DA463FF1A4A1DB0040B041D000000000000
        00000000000000000000386E3F937BC785FF77C281FF54AB5EFF4EA357FF499B
        51FF63AC6BFF83C38BFF87C98FFF82C689FF509756FF11301370000000000000
        00000000000000000000000000003E78459F4E9A57D200000000000000000000
        000029572E8D3D8444E186C68EFF88C98FFF6FB376FF215525B71A391D611836
        1B611633186114301661112D136101020103305E367B00000000000000000000
        00000000000028532C83428E49ED3F8C46F6398440F8307437E846924DE84595
        4DF83F8C46F6377E3DED1B421F83000000000000000000000000000000000E2E
        107B00010003204124611E3E21611C3B1F6119381D6117351A613C7B43B780C3
        89FF8DCC95FF83C48AFF367B3CE11E48228D0000000000000000000000001D54
        20D2133C169F0000000000000000000000000000000000000000284F2C7075BF
        7EFF98D2A1FF94CF9CFF86C78DFF5EA765FF398640FF347E3AFF2E7633FF4990
        4FFF458B4AFF12391593000000000000000000000000000000000B150C1D3F7E
        47B085C98EFF9BD4A4FF8FCE98FF92CF9AFF8DCC95FF88CA90FF83C68BFF7EC4
        85FF79C17FFF478D4CFF1237148A00000000000000000000000000000000162A
        1839418048B079C383FF89CA92FF94D09CFF95D19EFF90CF99FF8CCB94FF87C9
        8FFF80C487FF4E9554FF14381784000000000000000000000000000000000000
        00000B160D1D2A522F70418148B74F9F57EA50A65AFF4B9E53FF45964DFF60A8
        68FF5BA262FF1D47219000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000003A7E
        41D228592D9C0000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000254D
        2978010201030000000000000000000000000000000000000000}
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 111
      Top = 4
      Width = 177
      Height = 25
      Caption = #1043#1083#1086#1073#1072#1083#1100#1085#1099#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      DropDownMenu = sprMenu
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000005134169F684016E1643C13E15F3D
        1ABA000000000000000000000000000000000000000000000000A37642FF9E70
        3DFF986B38FF936533FF8D602EFF875A29FF825424FF936839FF906536FF7245
        16FF6D4011FF693C0DFF65380AFF613406FF5E3103FF5B2E01FFAB7E4AFFB38B
        5DFFB38B5DFFB38B5DFFB38B5DFFB38B5DFFB38B5DFF7D5121FF794C1DFFB38B
        5DFFB38B5DFFB38B5DFFB38B5DFFB38B5DFFB38B5DFF683C0EFFB0834FFF9E70
        3DFF986B38FF936533FF8D602EFF875A29FF825424FFAB9074FFAA8F73FF7245
        16FF6D4011FF693C0DFF65380AFF613406FF5E3103FF6C3F12FFB68854FFA577
        43FFF9F9F9FFF9F9F9FFF9F9F9FFF8F8F8FFF1F1F1FFE3E3E3FFF3F3F3FFF8F8
        F8FFF9F9F9FFF8F8F8FFE9E9E9FFF8F8F8FF623507FF704416FFBA8D58FFAB7D
        49FFF9F9F9FFF1F1F1FFEDEDEDFFE7E7E7FFD3D3D3FFA5A5A5FFD7D7D7FFF4F4
        F4FFEEEEEEFFEAEAEAFFDCDCDCFFF8F8F8FF66390BFF74481AFFBE915CFFB183
        4EFFF9F9F9FFCCCCCCFFC9C9C9FFC5C5C5FFD3D3D3FFA6A6A6FFD8D8D8FFF4F4
        F4FFCACACAFFC6C6C6FFBABABAFFF8F8F8FF6B3E10FF7A4D1EFFC29560FFB789
        53FFFAFAFAFFF1F1F1FFEDEDEDFFE9E9E9FFD4D4D4FFA6A6A6FFD8D8D8FFF5F5
        F5FFEFEFEFFFEBEBEBFFDCDCDCFFF8F8F8FF714415FF7F5323FFC69862FFBC8E
        58FFFAFAFAFFCCCCCCFFCACACAFFC5C5C5FFD4D4D4FFA7A7A7FFD8D8D8FFF5F5
        F5FFCBCBCBFFC7C7C7FFBBBBBBFFF8F8F8FF774A1AFF845828FFC69963FFC193
        5CFFFAFAFAFFF2F2F2FFEFEFEFFFEAEAEAFFD5D5D5FFB5B5B5FFDFDFDFFFF5F5
        F5FFF1F1F1FFECECECFFDEDEDEFFF9F9F9FF7D5020FF8A5E2DFFC69963FFC597
        60FFFAFAFAFFCDCDCDFFCACACAFFC6C6C6FFF2F2F2FFDDD8D2FFEBE5DFFFFCFC
        FCFFCCCCCCFFC9C9C9FFBDBDBDFFF9F9F9FF845726FF916333FFC69963FFC89A
        63FFFAFAFAFFFAFAFAFFFAFAFAFFF8F8F8FFD9C6B1FFA07646E69B7243E6D7C4
        AFFFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FF8B5D2CFF976938FF281F1433C99B
        64FFD3AE82FFD0AC80FFCEA97DFFCBA67BFFC6A074FF20180F2D1F170E2DBB95
        6AFFB8946AFFB49066FFAF8B62FFAB875EFF926432FF1F160B3300000000281F
        1433281F1433281F1433281E1433271E1333261D12330000000000000000241B
        1033231A0F3322190E3321180D3320160C331E150B3300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      Kind = cxbkDropDown
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      TabOrder = 1
    end
    object Filter: TcxTextEdit
      Left = 24
      Top = 32
      TabOrder = 2
      Text = #1055#1086#1080#1089#1082' '#1087#1086' '#1096#1080#1092#1088#1091' '#1076#1086#1075#1086#1074#1086#1088#1072
      OnKeyUp = FilterKeyUp
      OnMouseDown = FilterMouseDown
      Width = 264
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 40
    Top = 152
  end
  object ADOQuery1: TADOQuery
    Connection = MainForm.MainConnection
    Parameters = <>
    Left = 40
    Top = 200
  end
  object cxImageList1: TcxImageList
    FormatVersion = 1
    DesignInfo = 17825816
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000133B
          5F701D598DA6297CC6EA2C84D1F72C84D1F72C84D1F72C84D1F72C84D1F72C84
          D1F72C84D1F72C84D1F72C83D1F72B81CCF1194D7D9300000000000000002E80
          C4E6CFE2EBF0A6DBF2FD9EDBF4FF96DAF3FF8ED8F3FF86D7F3FF7FD4F2FF79D3
          F2FF72D2F1FF6CD0F1FF69CFF1FFC1E9F7FE3086CCF00000000000000000338F
          D3F7EFFAFEFFA1E9F9FF91E5F8FF81E1F7FF72DEF6FF63DAF5FF54D7F4FF47D3
          F3FF39D0F2FF2ECDF1FF26CBF0FFCAF2FBFF338FD3F700000000000000003596
          D4F8F2FAFDFFB3EDFAFFA4E9F9FF95E6F8FF85E2F7FF76DEF6FF65DBF5FF57D7
          F4FF49D4F3FF3BD1F2FF30CEF1FFCCF2FBFF3393D3F70000000000000000359D
          D5F9F6FCFEFFC8F2FCFFB9EFFBFFACECFAFF9CE8F9FF8BE3F7FF7CE0F6FF6CDC
          F6FF5DD9F5FF4FD6F4FF44D3F3FFD0F3FCFF339AD3F7000000000000000036A3
          D6FAFEFFFFFFF8FDFFFFF6FDFFFFF5FCFFFFF3FCFEFFD8F6FCFF94E6F8FF85E3
          F7FF76DFF6FF68DBF5FF5CD8F4FFD7F4FCFF339FD3F7000000000000000034A8
          D6FAE8F6FBFF94D4EFFF88CEEEFF73C1E9FFC9E9F6FFF2FCFEFFF3FCFEFFF2FC
          FEFFF0FCFEFFEFFBFEFFEEFBFEFFFEFFFFFF34A6D3F7000000000000000033A1
          CFF2F1FAFDFF94DEF5FF93DCF4FF81D5F2FF6ACAEDFF6CCBEAFF85D3EFFF80D2
          EFFF7AD0EFFF76CFEEFF72CFEEFFE9F7FBFF32A6D0F3000000000000000032A5
          CDF0F7FCFEFF8EE4F8FF91DEF5FF9FE0F5FFACE1F6FFEFFBFEFFF4FDFEFFF3FC
          FEFFF1FCFEFFEFFBFEFFEEFBFEFFF4F7F9F92D91B5D4000000000000000035AE
          D4F8FDFEFEFFFEFFFFFFFEFEFFFFFDFEFFFFFEFFFFFFEAF7FBFF68C2DFF968C2
          DDF868C2DDF868C2DDF875C7DFF766B2CAE1113C495600000000000000002A93
          B1D05CBEDDFA5EBFDEFA5EBFDEFA5EBFDEFA5DBFDEFA349EBEDD040F1316030A
          0D0F030A0D0F030A0D0F030A0D0F030B0D0F0103030400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000A479
          58C4CA9269F4D19668FFCE9263FFCB8E5EFFC98A5BFFC78756FFC38452FFC384
          52FFC38452FFC38452FFC38452FFC38452FF81522EB00000000000000000D7A1
          75FFF8F2EDFFF7F0EAFFF6EDE6FFF4EAE2FFF3E7DEFFF1E4DBFFF0E2D8FFF0E2
          D8FFF0E2D8FFF0E2D8FFF0E2D8FFF0E2D8FFC3895CFD0000000000000000D9A4
          7AFFF9F3EEFFEBD2BEFFFFFFFFFFEBD3BFFFFFFFFFFFFFFFFFFFFFFFFFFFEAC7
          ADFFFFFFFFFFFFFFFFFFFFFFFFFFF0E2D8FFC68C5FFF0000000000000000DDA8
          7EFFF9F3EFFFEBD0BAFFEBD0BBFFEBD0BBFFEBD0BBFFEBD0BBFFEBD1BDFFEACD
          B5FFEACDB5FFEACDB5FFEACDB5FFF0E2D8FFC68A5CFF0000000000000000DFAA
          82FFF9F3EFFFEACEB7FFFFFFFFFFEBD0BBFFFFFFFFFFFFFFFFFFFFFFFFFFEACF
          BAFFFBF6F2FFFFFFFFFFFFFFFFFFF0E2D8FFC88D5FFF0000000000000000E1AE
          87FFFAF4F0FFEACBB2FFEACCB3FFEACCB3FFEACCB3FFEACCB3FFEACEB7FFE8C7
          ACFFE8C7ACFFE8C8B0FFE8C8AEFFF0E2D8FFC48654FF0000000000000000E3B1
          8CFFFAF6F1FFEAC9AEFFFFFFFFFFEAC9B0FFFFFFFFFFFFFFFFFFFFFFFFFFE8C7
          ACFFFFFFFFFFFFFFFFFFFFFFFFFFF1E5DBFFC68655FF0000000000000000E5B4
          8FFFFAF6F2FFE9C6AAFFE9C6ACFFEAC7ACFFE9C7ADFFE9C9AEFFE9C9B0FFE8C7
          ACFFE9C9B0FFE8C8B0FFE8CCB5FFF2E7DEFFC88A59FF0000000000000000E7B7
          94FFFBF7F4FFE9C3A6FFFFFFFFFFE8C4A9FFFFFFFFFFFFFFFFFFFFFFFFFFE8C7
          ACFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1EBFFCB8F5FFF0000000000000000E9BA
          98FFFBF7F4FFE9C3A6FFE9C3A6FFE9C3A6FFE9C3A6FFE9C3A6FFE9C3A6FFE9C3
          A6FFE9C3A6FFE9C3A6FFE9C3A6FFFBF7F4FFCE9364FF0000000000000000EBBD
          9BFFFBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F4FFD1976AFF0000000000000000ECBF
          9EFFFBF7F4FF9CD5A5FF98D3A1FF94D09DFF90CE98FF8BCB93FF87C98EFF82C6
          89FF7EC384FF7AC180FF76BE7CFFFBF7F4FFD49B6FFF0000000000000000DBB2
          94EBFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7
          F4FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F4FFD19C71F800000000000000007660
          517ED5AC90E3EDC09FFFEBBE9DFFEBBC9AFFE9BA96FFE7B793FFE6B590FFE4B2
          8CFFE2AF88FFE0AC84FFDDA980FFDCA57DFFAD8161CA00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000704B36A9C38E
          68FFC08B66FFBE8864FFBB8561FFB9835FFFB47E5CFFB27C5AFFB17B58FFAE79
          57FFAD7656FFAB7554FFA97353FFA97151FF704B36A900000000C8926CFFE6E5
          E5FFE5E5E5FFE5E5E6FFE5E5E5FFE5E5E5FFE6E5E5FFE5E5E5FFE6E5E5FFE5E6
          E5FFE6E6E6FFE6E5E5FFE5E6E6FFE6E5E6FFA97251FF00000000CA946EFFE7E7
          E7FFE8E7E7FFE7E7E7FFE7E7E7FFE7E7E7FFC3C3C3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7FFAA7353FF00000000CC976FFFE9E9
          E9FFD28358FFD28358FFD28358FFE9E9E9FFC3C3C3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9EAEAFFAC7554FF00000000D19C73FFECEC
          ECFFECECEBFFECECEBFFECECECFFECEBECFFC3C3C3FFC3C3C3FFC3C3C3FFC3C3
          C3FFC3C3C3FFC3C3C3FFC3C3C3FFECECEBFFB07A58FF00000000D49E75FFEFEE
          EEFFEFEFEFFFEFEEEEFFEFEEEEFFEEEFEEFFEEEEEEFFEEEFEFFFEEEEEEFFEEEE
          EEFFEEEEEEFFEFEEEEFFEEEEEEFFEEEEEFFFB27C5AFF00000000D5A076FFF1F1
          F0FFF1F0F1FFF0F1F1FFF1F0F1FFF1F1F1FFC3C3C3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1FFB57E5CFF00000000D8A279FFF2F2
          F2FFD28358FFD28358FFD28358FFF2F2F3FFC3C3C3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FFB7815EFF00000000D9A379FFF5F5
          F5FFF5F5F4FFF4F5F4FFF4F4F4FFF5F5F4FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3
          C3FFC3C3C3FFC3C3C3FFC3C3C3FFF4F4F5FFBA8560FF00000000DBA47AFFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6
          F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFBD8763FF00000000DCA77BFFDCA7
          7BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFDCA7
          7BFFDCA77BFFDCA77BFFDCA77BFFDCA77BFFC08B66FF00000000DBAB84FDE8B9
          92FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFE8B992FFE8B9
          92FFE8B992FFE8B992FFE8B992FFE8B992FFBF8F6EFD00000000472F226BD3A9
          87F4DCA77BFFDCA67AFFDAA47AFFD8A279FFD5A076FFD49E75FFD29D73FFCF9A
          72FFCE9970FFCB966FFFC9946CFFBC9375F4472F226B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000005134169F684016E1643C13E15F3D
          1ABA000000000000000000000000000000000000000000000000A37642FF9E70
          3DFF986B38FF936533FF8D602EFF875A29FF825424FF936839FF906536FF7245
          16FF6D4011FF693C0DFF65380AFF613406FF5E3103FF5B2E01FFAB7E4AFFB38B
          5DFFB38B5DFFB38B5DFFB38B5DFFB38B5DFFB38B5DFF7D5121FF794C1DFFB38B
          5DFFB38B5DFFB38B5DFFB38B5DFFB38B5DFFB38B5DFF683C0EFFB0834FFF9E70
          3DFF986B38FF936533FF8D602EFF875A29FF825424FFAB9074FFAA8F73FF7245
          16FF6D4011FF693C0DFF65380AFF613406FF5E3103FF6C3F12FFB68854FFA577
          43FFF9F9F9FFF9F9F9FFF9F9F9FFF8F8F8FFF1F1F1FFE3E3E3FFF3F3F3FFF8F8
          F8FFF9F9F9FFF8F8F8FFE9E9E9FFF8F8F8FF623507FF704416FFBA8D58FFAB7D
          49FFF9F9F9FFF1F1F1FFEDEDEDFFE7E7E7FFD3D3D3FFA5A5A5FFD7D7D7FFF4F4
          F4FFEEEEEEFFEAEAEAFFDCDCDCFFF8F8F8FF66390BFF74481AFFBE915CFFB183
          4EFFF9F9F9FFCCCCCCFFC9C9C9FFC5C5C5FFD3D3D3FFA6A6A6FFD8D8D8FFF4F4
          F4FFCACACAFFC6C6C6FFBABABAFFF8F8F8FF6B3E10FF7A4D1EFFC29560FFB789
          53FFFAFAFAFFF1F1F1FFEDEDEDFFE9E9E9FFD4D4D4FFA6A6A6FFD8D8D8FFF5F5
          F5FFEFEFEFFFEBEBEBFFDCDCDCFFF8F8F8FF714415FF7F5323FFC69862FFBC8E
          58FFFAFAFAFFCCCCCCFFCACACAFFC5C5C5FFD4D4D4FFA7A7A7FFD8D8D8FFF5F5
          F5FFCBCBCBFFC7C7C7FFBBBBBBFFF8F8F8FF774A1AFF845828FFC69963FFC193
          5CFFFAFAFAFFF2F2F2FFEFEFEFFFEAEAEAFFD5D5D5FFB5B5B5FFDFDFDFFFF5F5
          F5FFF1F1F1FFECECECFFDEDEDEFFF9F9F9FF7D5020FF8A5E2DFFC69963FFC597
          60FFFAFAFAFFCDCDCDFFCACACAFFC6C6C6FFF2F2F2FFDDD8D2FFEBE5DFFFFCFC
          FCFFCCCCCCFFC9C9C9FFBDBDBDFFF9F9F9FF845726FF916333FFC69963FFC89A
          63FFFAFAFAFFFAFAFAFFFAFAFAFFF8F8F8FFD9C6B1FFA07646E69B7243E6D7C4
          AFFFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FF8B5D2CFF976938FF281F1433C99B
          64FFD3AE82FFD0AC80FFCEA97DFFCBA67BFFC6A074FF20180F2D1F170E2DBB95
          6AFFB8946AFFB49066FFAF8B62FFAB875EFF926432FF1F160B3300000000281F
          1433281F1433281F1433281E1433271E1333261D12330000000000000000241B
          1033231A0F3322190E3321180D3320160C331E150B3300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object sprMenu: TPopupActionBar
    OnChange = sprMenuChange
    Left = 160
    Top = 200
    object N9: TMenuItem
      Action = MainForm.TypesWorkAction
    end
    object N4: TMenuItem
      Action = MainForm.Action12
    end
    object N16: TMenuItem
      Action = MainForm.Action6
    end
    object N11: TMenuItem
      Action = MainForm.Action19
    end
    object N12: TMenuItem
      Action = MainForm.Action21
    end
    object N13: TMenuItem
      Action = MainForm.Action22
    end
    object N1: TMenuItem
      Action = MainForm.Action3
    end
    object N21: TMenuItem
      Action = MainForm.SprFormAccountingHoursShow
    end
    object N19: TMenuItem
      Action = MainForm.Action9
    end
    object N20: TMenuItem
      Action = MainForm.OrgAcrtio
    end
    object N8: TMenuItem
      Action = MainForm.Action16
    end
    object N14: TMenuItem
      Action = MainForm.Action4
    end
    object N10: TMenuItem
      Action = MainForm.Action18
    end
    object N5: TMenuItem
      Action = MainForm.Action13
    end
    object N6: TMenuItem
      Action = MainForm.Action14
    end
    object N17: TMenuItem
      Action = MainForm.Action7
    end
    object N18: TMenuItem
      Action = MainForm.Action8
    end
    object N15: TMenuItem
      Action = MainForm.Action5
    end
    object N3: TMenuItem
      Action = MainForm.Action11
    end
    object N2: TMenuItem
      Action = MainForm.Action10
    end
    object N7: TMenuItem
      Action = MainForm.Action15
    end
  end
  object NavigatorMenu: TPopupActionBar
    OnPopup = NavigatorMenuPopup
    Left = 160
    Top = 256
    object N22: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1092#1086#1088#1084#1077' '#1073#1102#1076#1078#1077#1090#1086#1074
      OnClick = N22Click
    end
  end
end
