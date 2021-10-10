Moog moog => dac;

Std.atof(me.arg(0)) => float freq;
Std.atof(me.arg(1)) => float vol;
Std.atof(me.arg(2)) => float dur;

0.5  => moog.filterQ;
0.5 => moog.filterSweepRate;
6 => moog.lfoSpeed;
0.5 => moog.lfoDepth;
vol => moog.volume;
freq => moog.freq;
vol => moog.noteOn;
dur::second => now;
