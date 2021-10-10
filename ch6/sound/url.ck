fun void makeSound(float freq, float vol, float dur ) {
  SinOsc s => Gain g => dac;

  freq => s.freq;
  vol => g.gain;
  dur::second => now;
}

Std.atof(me.arg(0)) => float frequency;
Std.atof(me.arg(1)) => float volume;
Std.atof(me.arg(2)) => float duration;

makeSound(frequency, volume, duration);

50::ms => now;
