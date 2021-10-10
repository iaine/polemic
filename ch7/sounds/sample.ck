// sound file
"" => string filename;
if( me.args() ) me.arg(0) => filename;

me.arg(1) => float vol;
me.arg(2) => float dur;
me.arg(3) => float rate;

// the patch 
SndBuf buf => dac;
// load the file
filename => buf.read;

0 => buf.pos;
vol => buf.gain;
rate => buf.rate;
dur::second => now;

