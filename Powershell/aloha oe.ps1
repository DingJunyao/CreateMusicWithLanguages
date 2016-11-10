$notes0 = write-output 8D4 8G4 3B4 8A4 8G4 8F#4 8G4 8E4 2D4
$notes1 = write-output 4B4 3A4 8G#4 8A4 8A4 8C5 8B4 2A4 
$notes2 = write-output 8D4 8G4 3B4 8A4 8G4 8F#4 8G4 8E4 2D4
$notes3 = write-output 8D4 8D4 4E4 8A4 8G4 8F#4 8B4 8A4 8F#4 2G4
$notes4 = write-output 8G4 8G4 8F#4 4E4 4G4 8C5 8E4 8E4 8E4 4D4 4G4 4B4 8G4 8G4 8F#4 8F#4 8F#4 8G4 8A4 8G#4 8A4 8C5 2B4 4G4
$notes5 = write-output 8F#4 4E4 4G4 3C5 8E4 8D4 8D4 8G4 8G4 3B4 8G4 3F#4 8G4 8B4 4A4 8F#4 2G4
function Play([int] $freq, [int] $duration){  
  [console]::Beep($freq, $duration); 
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
foreach($note in $notes0){ 
  $note -match '(\d)(.+)' | out-null 
  $duration = $StandardDuration / ([float] $matches[1]); 
  $playNote = $matches[2]; 
  $freq = GetNoteFreq $playNote; 
  write-host $playNote lalala~~~; 
  Play $freq $duration 
}
start-sleep -milli ([int] $StandardDuration/4);
foreach($note in $notes1){ 
  $note -match '(\d)(.+)' | out-null 
  $duration = $StandardDuration / ([float] $matches[1]); 
  $playNote = $matches[2]; 
  $freq = GetNoteFreq $playNote; 
  write-host $playNote lalala~~~; 
  Play $freq $duration 
}
start-sleep -milli ([int] $StandardDuration/4);
foreach($note in $notes2){ 
  $note -match '(\d)(.+)' | out-null 
  $duration = $StandardDuration / ([float] $matches[1]); 
  $playNote = $matches[2]; 
  $freq = GetNoteFreq $playNote; 
  write-host $playNote lalala~~~; 
  Play $freq $duration 
}
start-sleep -milli ([int] $StandardDuration/4);
foreach($note in $notes3){ 
  $note -match '(\d)(.+)' | out-null 
  $duration = $StandardDuration / ([float] $matches[1]); 
  $playNote = $matches[2]; 
  $freq = GetNoteFreq $playNote; 
  write-host $playNote lalala~~~; 
  Play $freq $duration 
}
start-sleep -milli ([int] $StandardDuration/4);
foreach($note in $notes4){ 
  $note -match '(\d)(.+)' | out-null 
  $duration = $StandardDuration / ([float] $matches[1]); 
  $playNote = $matches[2]; 
  $freq = GetNoteFreq $playNote; 
  write-host $playNote lalala~~~; 
  Play $freq $duration 
}
start-sleep -milli ([int] $StandardDuration/8);
foreach($note in $notes5){ 
  $note -match '(\d)(.+)' | out-null 
  $duration = $StandardDuration / ([float] $matches[1]); 
  $playNote = $matches[2]; 
  $freq = GetNoteFreq $playNote; 
  write-host $playNote lalala~~~; 
  Play $freq $duration 
}