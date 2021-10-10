//set up the base frequency
Std.atof(me.arg(0)) => float base;
// the number of iterations
Std.atoi(me.arg(1)) => int iterations;

//15/iterations => float freqs;

//create the sound
fun void makeSound(float freq, float t) {
    SinOsc s => dac;
    <<< freq >>>;
    freq => s.freq;
    t::second => now;
}

//fun float createSpectralRand(float base) {
//    freqs * _version => float spectral;
//    return (base + spectral);
//}

// add frequency steps to the base note
// uses random number to create randomness in the constraints
//fun float createSpectral(float base, float _version) {
//    Math.random2(base, base + 15.0) => float spectral;
//    return (base + spectral);
//}

//calculate the new frequency from the base and the cents
fun float centToNote(float baseFreq,float cents) {
    return baseFreq * Math.pow(2, (cents/1200));
}

//have the base frequency with the sound
//makeSound(base, 0.5);

//make the spectral notes
for (0 => int i; i < iterations; i++ ) {
    10 * i => float k;
    makeSound(centToNote(base, k), 0.1);
}
