s.options.numBuffers = 1024 * 16; // increase this if you need to load more samples
s.options.memSize = 8192 * 16; // increase this if you get "alloc failed" messages
s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
s.options.bindAddress = "127.0.0.1";
s.options.numOutputBusChannels = 16;
s.options.numInputBusChannels = 2;

s.waitForBoot {
    ~dirt = SuperDirt(2, s);
    ~dirt.loadSoundFiles;
    //s.sync;

    // Start with senderAddr argument
    // ~dirt.start(57120, [4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24], (NetAddr.fromIP("172.17.0.1")));
    ~dirt.start(57120, [4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24]);

    (
        ~d1 = ~dirt.orbits[0]; ~d2 = ~dirt.orbits[1]; ~d3 = ~dirt.orbits[2];
        ~d4 = ~dirt.orbits[3]; ~d5 = ~dirt.orbits[4]; ~d6 = ~dirt.orbits[5];
        ~d7 = ~dirt.orbits[6]; ~d8 = ~dirt.orbits[7]; ~d9 = ~dirt.orbits[8];
        ~d10 = ~dirt.orbits[9]; ~d11 = ~dirt.orbits[10]; ~d12 = ~dirt.orbits[11];
    );

    1.wait;
    
    // Sound check on startup :) *gong*
    (
        SynthDef.new(\default, {
            arg dur, attack=0.01, release=1.0,
            t_gate=1, out, freq=442, cutoff=5500,
            rq=1, pan=0.0, amp=0.5;

            var env = EnvGen.kr(Env.perc(attack, release), t_gate, timeScale: dur, doneAction: 2);
            var sig = DPW3Tri.ar(freq: freq, mul: env);
            sig = RLPF.ar(sig, cutoff.clip(20.0, 20000.0), rq.clip(0.0,1.0));
            sig = Pan2.ar(sig, pan);
            Out.ar(out, sig * amp);
        }).add;

        ().play;
    );

}
