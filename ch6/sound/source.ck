//sonify the edge 
//SinOsc s => PRCRev r => dac;
SinOsc s => Gain g => dac;

Std.atof(me.arg(1)) =>float Bnote;
Std.atoi(me.arg(0)) => float Anote;

Std.atof(me.arg(2)) => float weight;
if (weight == 0.0 ) 0.05 => weight;

Std.atof(me.arg(3)) => float vol;
if (vol == 0.0 ) 0.2 => vol;

vol => g.gain;
weight::second => now;
<<< Anote >>>;
Anote => s.freq;
weight::second => now;
<<< Bnote >>>;
Bnote => s.freq;
