fun void whiteNoise () {
    // noise generator, biquad filter, dac (audio output) 
    Noise n => BiQuad f => dac;
    // set biquad pole radius
    //.7 => f.prad;
    // set biquad gain
    //.05 => f.gain;
    // set equal zeros 
    1 => f.eqzs;
    // our float
    0.0 => float t;
    
    1500.0 => f.pfreq;
    
    // infinite time-loop
    //while( t < 2.0 )
    //{
        // alter the radius
        Math.random2f(0.5,.99) => f.prad;
        Math.random2f(0.0,.55) => f.gain;
        t + .1 => t;
        // advance time
        100::ms => now;
    //}    
}

fun void makeSound(float freq, float vol, float dur ) {
  SinOsc s => Gain g => dac;

  freq => s.freq;
  vol => g.gain;
  dur::second => now;
}

Std.atof(me.arg(0)) => float frequency;
Std.atof(me.arg(1)) => float volume;
Std.atof(me.arg(2)) => float duration;

whiteNoise();

makeSound(frequency, volume, duration);

50::ms => now;
