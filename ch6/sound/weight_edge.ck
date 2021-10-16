//sonify the edge 
//SinOsc s => PRCRev r => dac;
SinOsc s => Gain g => dac;

float Anote;
Std.atoi(me.arg(0)) => int n;
if (n > 1) {
    440 * Math.pow(2, (n/12))  =>  Anote;
} else {
    440.0 => Anote;
}
Std.atof(me.arg(1)) => float Bnote;
Std.atof(me.arg(2)) => float weight;
if (weight == 0.0 ) 0.05 => weight;

Std.atof(me.arg(3)) => float vol;
if (vol == 0.0 ) 0.2 => vol;

vol => g.gain;
weight::second => now;
Anote => s.freq;
weight::second => now;
Bnote => s.freq;
//Anote * Math.pow(2, (3/12)) => s.freq;
