//sonify the edge using a beat 
ModalBar s => JCRev r =>  dac;


0.5 => r.gain;

Std.atoi(me.arg(0)) => float Anote;

Std.atof(me.arg(1)) => float weight;
if (weight == 0.0 ) 0.05 => weight;

Std.atof(me.arg(2)) => float vol;
if (vol == 0.0 ) 0.2 => vol;

3 => s.preset; //set to Wood

2 => int strikes;

for ( 0 => int i; i < strikes; i++) {
  weight::second => now;
  <<< Anote >>>;
  0.6 => s.stickHardness;
  0.6 => s.strikePosition;
  0.6 => s.strike;
  Anote => s.freq;
}
75::ms => now;
