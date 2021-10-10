OscRecv orec;

// need to set up it on the command line    
5005 => orec.port;
orec.listen();
orec.event("/debug, s") @=> OscEvent e;

fun void errorNoise() {
    Noise n => BiQuad f => dac;
    0.99 => f.prad;
    0.05 => f.gain;
    1    => f.eqzs;
    0.00 => float t;
    5::ms => now;
}

while (true) {
    e => now;
    while (e.nextMsg() != 0) {
        //process message here (no need to call nextMsg again
        e.getString() => string op;
        Machine.add(op) => int id;
        <<< "op", op >>>;
        <<< "id", id >>>;
        //if (op == "status") { send it back}
        //Machine.status() => int s;

        if (id == 0) {
            //noise here
        }

    }
}