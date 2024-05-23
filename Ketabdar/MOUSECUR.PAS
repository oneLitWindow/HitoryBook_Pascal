
{ This is the MOUSECUR.PAS include file for the MOUSE.PAS unit.}
{ It contains the mouse text and graphic cursor definitions }

{---------------------------------------------------------------------------}
{ Mouse Graphic cursors set by - MouseGraphicCursor(Shape); }

{ define what the mouse graphic cursor definition array looks like }
type MGCarray = array [1..MaxMouseGraphShape] of MaskType;

{ Next we define the cursor array as a typed constant }

const MouseGCursor: MGCarray =   {a predefined list of mouse graphic cursors}

{ Standard }
 ((Def: (($3FFF,$1FFF,$0FFF,$07FF,$03FF,$01FF,$00FF,$007F,    { Screen Mask }
          $003F,$001F,$01FF,$10FF,$30FF,$F87F,$F87F,$FC7F),

         ($0000,$4000,$6000,$7000,$7800,$7C00,$7E00,$7F00,    { Cursor Mask }
          $7F80,$7C00,$6C00,$4600,$0600,$0300,$0300,$0000));

         HotX: -1; HotY: -1),                                    { Hot Spot }

{ UpArrow }
  (Def: (($F9FF,$F0FF,$E07F,$E07F,$C03F,$C03F,$801F,$801F,
          $000F,$000F,$F0FF,$F0FF,$F0FF,$F0FF,$F0FF,$F0FF),

         ($0000,$0600,$0F00,$0F00,$1F80,$1F80,$3FC0,$3FC0,
          $7FE0,$0600,$0600,$0600,$0600,$0600,$0600,$0000));

         HotX: 5; HotY: 0),

{ DownArrow }
  (Def: (($F0FF,$F0FF,$F0FF,$F0FF,$F0FF,$F0FF,$000F,$000F,
          $801F,$801F,$C03F,$C03F,$E07F,$E07F,$F0FF,$F9FF),

         ($0000,$0600,$0600,$0600,$0600,$0600,$0600,$7FE0,
          $3FC0,$3FC0,$1F80,$1F80,$0F00,$0F00,$0600,$0000));

         HotX: 5; HotY: 15),

{ LeftArrow }
  (Def: (($FE1F,$F01F,$0000,$0000,$0000,$F01F,$FE1F,$FFFF,
          $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF),

         ($0000,$00C0,$07C0,$7FFE,$07C0,$00C0,$0000,$0000,
          $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000));

         HotX: 0; HotY: 3),

{ RightArrow }
  (Def: (($F87F,$F80F,$0000,$0000,$0000,$F80F,$F87F,$FFFF,
          $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF),

         ($0000,$0300,$03E0,$7FFE,$03E0,$0300,$0000,$0000,
          $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000));

         HotX: 15; HotY: 3),

{ CheckMark }
  (Def: (($FFF8,$FFF0,$FFE1,$FFC3,$FF87,$FF0F,$0E1F,$043F,
          $807F,$E0FF,$F1FF,$FBFF,$FFFF,$FFFF,$FFFF,$FFFF),

         ($0000,$0006,$000C,$0018,$0030,$0060,$00C0,$7180,
          $1B00,$0E00,$0400,$0000,$0000,$0000,$0000,$0000));

         HotX: 5; HotY: 11),

{ UpHand }
  (Def: (($E1FF,$E1FF,$E1FF,$E1FF,$E000,$E000,$E000,$0000,    { Screen Mask }
          $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000),

         ($1E00,$1200,$1200,$1200,$13FF,$1249,$1249,$F249,    { Cursor Mask }
          $9001,$9001,$9001,$8001,$8001,$8001,$8001,$FFFF));

         HotX: 5; HotY: 0),                                      { Hot Spot }

{ DownHand }
  (Def: (($0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
          $0000,$E000,$E000,$E000,$E1FF,$E1FF,$E1FF,$E1FF),

         ($FFFF,$8001,$8001,$8001,$8001,$9001,$9001,$9001,
          $F249,$1249,$1249,$13FF,$1200,$1200,$1200,$1E00));

         HotX: 5; HotY: 15),

{ LeftHand }
  (Def: (($FFFF,$FF8F,$FF07,$FF03,$FF81,$8000,$0000,$0000,
          $0000,$8000,$F000,$F800,$F800,$FC00,$FC01,$FC03),

         ($0000,$0000,$0070,$0048,$0024,$0032,$7FF2,$800A,
          $7FF6,$0412,$07F2,$0212,$03F2,$0116,$01FC,$0000));

         HotX: 0; HotY: 7),

{ RightHand }
  (Def: (($FFFF,$F1FF,$E0FF,$C0FF,$81FF,$0001,$0000,$0000,
          $0000,$0001,$000F,$001F,$001F,$003F,$803F,$C03F),

         ($0000,$0000,$0E00,$1200,$2400,$4C00,$4FFE,$5001,
          $6FFE,$4820,$4FE0,$4840,$4FC0,$6880,$3F80,$0000));

         HotX: 15; HotY: 7),

{ StopHand }
  (Def: (($FE3F,$F80F,$F007,$F003,$F001,$F001,$0001,$0001,
          $0001,$0001,$8001,$C001,$C001,$E003,$F007,$F80F),

         ($0000,$01C0,$0770,$0550,$055C,$0554,$0554,$7554,
          $5554,$4FFC,$2804,$1004,$180C,$0C18,$07F0,$0000));

         HotX: 7; HotY: 7),

{ HourGlass }
  (Def: (($0000,$0000,$0000,$0000,$8001,$C003,$E007,$F00F,
          $E007,$C003,$8001,$0000,$0000,$0000,$0000,$FFFF),

         ($0000,$7FFE,$6006,$300C,$1818,$0C30,$0660,$03C0,
          $0660,$0C30,$1998,$33CC,$67E6,$7FFE,$0000,$0000));

         HotX: 7; HotY: 7),

{ DiagCross }
  (Def: (($07E0,$0180,$0000,$C003,$F00F,$C003,$0000,$0180,
          $07E0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF),

         ($0000,$700E,$1C38,$0660,$03C0,$0660,$1C38,$700E,
          $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000));

         HotX: 7; HotY: 4),

{ RectCross }
  (Def: (($FC3F,$FC3F,$FC3F,$0000,$0000,$0000,$FC3F,$FC3F,
          $FC3F,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF),

         ($0000,$0180,$0180,$0180,$7FFE,$0180,$0180,$0180,
          $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000));

         HotX: 7; HotY: 4),


  { these cursors need to be updated yet }
{ RectBox }
  (Def: (($FFFF,$FFFF,$0000,$0000,$0000,$1FF8,$1FF8,$1FF8,
          $1FF8,$1FF8,$1FF8,$1FF8,$0000,$0000,$0000,$FFFF),

         ($0000,$0000,$0000,$7FFE,$4002,$4002,$4002,$4002,
          $4002,$4002,$4002,$4002,$4002,$7FFE,$0000,$0000));

         HotX: 7; HotY: 8),

{ TargetCross }
  (Def: (($FFFF,$FFFF,$FC7F,$FC7F,$FC7F,$FC7F,$FC7F,$06C1,
          $0101,$06C1,$FC7F,$FC7F,$FC7F,$FC7F,$FC7F,$FFFF),

         ($0000,$0000,$0000,$0100,$0100,$0100,$0100,$0000,
          $783C,$0000,$0100,$0100,$0100,$0100,$0000,$0000));

         HotX: 7; HotY: 4),

{ TargetCircle }
  (Def: (($FFFF,$FFFF,$F01F,$C007,$8003,$0441,$0C61,$06C1,
          $0101,$06C1,$0C61,$0441,$8003,$C007,$F01F,$FFFF),

         ($0000,$0000,$0000,$07C0,$1930,$3118,$610C,$600C,
          $783C,$600C,$610C,$3118,$1930,$07C0,$0000,$0000));

         HotX: 7; HotY: 8),

{ TargetBox }
  (Def: (($FFFF,$FFFF,$0001,$0001,$0001,$1C71,$1C71,$06C1,
          $0101,$06C1,$1C71,$1C71,$0001,$0001,$0001,$FFFF),

         ($0000,$0000,$0000,$7FFC,$4104,$4104,$4104,$4004,
          $783C,$4004,$4104,$4104,$4104,$7FFC,$0000,$0000));

         HotX: 7; HotY: 8),

{ QuestionMark }
  (Def: (($FFFF,$E00F,$C007,$8003,$0001,$0001,$0001,$0001,
          $0001,$0001,$0001,$0001,$0001,$8003,$C007,$E00F),

         ($0000,$0000,$1FF0,$3FF8,$783C,$739C,$739C,$7F3C,
          $7E7C,$7E7C,$7FFC,$7E7C,$7E7C,$3FF8,$1FF0,$0000));

         HotX: 7; HotY: 7));


{---------------------------------------------------------------------------}
{ Mouse text cursors set by -  MouseTextCursor(Select,Start,Stop) }

{ define what the mouse graphic cursor definition array looks like }
type MTCarray = array [1..MaxMouseTextShape] of MouseTextType;

{ Next we define the text cursor array as a typed constant }
const MouseTCursor: MTCarray =   {a predefined list of mouse text cursors}
    ((Select: 1;  Start: 1;      Stop: 14),     {1 Hardware Cursor}
     (Select: 0;  Start: $77FF;  Stop: $7700),  {2 Standard Cursor}
     (Select: 0;  Start: $07FF;  Stop: $F800),  {3 Blink Cursor}
     (Select: 0;  Start: $7000;  Stop: $8718),  {4 Up Arrow}
     (Select: 0;  Start: $7000;  Stop: $8719),  {5 Down Arrow}
     (Select: 0;  Start: $7000;  Stop: $871B),  {6 Left Arrow}
     (Select: 0;  Start: $7000;  Stop: $871A),  {7 Right Arrow}
     (Select: 0;  Start: $7000;  Stop: $871E),  {8 Up Triangle}
     (Select: 0;  Start: $7000;  Stop: $871F),  {9 Down Triangle}
     (Select: 0;  Start: $7000;  Stop: $8711),  {10 Left Triangle}
     (Select: 0;  Start: $7000;  Stop: $8710),  {11 Right Triangle}
     (Select: 0;  Start: $7000;  Stop: $8704),  {12 Diamond}
     (Select: 0;  Start: $7000;  Stop: $8716),  {13 Square}
     (Select: 0;  Start: $7000;  Stop: $8709),  {14 Circle}
     (Select: 0;  Start: $7000;  Stop: $8707)); {15 Spot}


{---------------------------------------------------------------------------}
{ End Of MOUSECUR.PAS include file }

