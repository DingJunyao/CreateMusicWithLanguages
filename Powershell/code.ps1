# Source: 老表恰跟金圣@bilibili http://www.bilibili.com/video/av6995937/ http://pan.baidu.com/s/1o8zxceu http://pan.baidu.com/s/1i57EIsX
# Modified by DingJunyao
$notes0 = write-output 4C5 4C5 4G5 4G5 4A5 4A5 2G5
# The note is formed with a one-digit number(1~9) to show the duration of it; 1=>whole note 2=>minim 3=>Dotted quarter note 4=>quarter note 8=>quaver
# a note represented as "C", "F#", etc..(without quotes)
# and a one-digit number to show the place of the note. 
# The example plays the first seven notes of Twinkle Twinkle Little Star. 
function Play([int] $freq, [int] $duration){  
  [console]::Beep($freq, $duration); # So it plays square waves~
} 
$f0 = 440; 
$a = [math]::pow(2,(1/12));  
function GetNoteFreq([string]$note){ 
 $note -match '([A-G#]{1,2})(\d+)' | out-null 
  $octave = ([int] $matches[2])-4; 
  $n = $octave * 12 + ( GetHalfStepsFromA $matches[1] ); 
  $freq = $f0 * [math]::Pow($a, $n); 
  return $freq; 
} 
function GetHalfStepsFromA([string] $note){ 
  switch($note){ 
    'C'  { 0 } 
    'C#' { 1 } 
    'D'  { 2 } 
    'D#' { 3 } 
    'E'  { 4 } 
    'F'  { 5 } 
    'F#' { 6 } 
    'G'  { 7 } 
    'G#' { 8 } 
    'A'  { 9 } 
    'A#' { 10 } 
    'B'  { 11 } 
  } 
} 
$StandardDuration = 2500;  # 96bpm, *4
# $StandardDuration = 2000;  # 120bpm,*4
# Above sets the duration. You can calculate it with bpm: 60/bpm*4000
foreach($note in $notes0){ 
  $note -match '(\d)(.+)' | out-null 
  $duration = $StandardDuration / ([float] $matches[1]); 
  $playNote = $matches[2]; 
  $freq = GetNoteFreq $playNote; 
  write-host $playNote lalala~~~; 
  Play $freq $duration 
}
start-sleep -milli ([int] $StandardDuration/4);# Set stop time.
# It can be reused easily, see also "aloha oe.ps1"