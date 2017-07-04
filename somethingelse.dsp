/* "Something Else"
This is code designed to work with a light sensor augmentation
mobile prototype I created at the 2017 CCRMA Mobile Augmentation
workshop.  It borrows from a Karplus-Strong model from our session.
The light sensors are designed to affect parameters of the model.

I fabricated augmentations using a printer.  For now, I'm publishing
openscad files for the top (blue), bottom (red), and insert(blue)
pieces.

We used a laser cutter on acrylic for the clear pieces. The light
sensors run through a Teensy, which is connected as a midi device
to an iphone 6s.  I haven't documented this aspect of the project
yet, a todo item for when my summer workshops at CCRMA are over.

The project will be further updated at:
https://github.com/edmondhowser/somethingelse.git
*/

declare interface "SmartKeyboard{
	'Number of Keyboards':'1',
	'Max Keyboard Polyphony':'1',
	'Inter-Keyboard Slide':'1',
	'Mono Mode':'1',
	'Keyboard 0 - Number of Keys':'10',
	'Keyboard 0 - Lowest Key':'77',
	'Keyboard 0 - Show Labels':'0',
	'Keyboard 0 - Piano Keyboard':'0',
	'Rounding Mode':'2'
}";

import("stdfaust.lib");

in_A0 = hslider("A0[midi:ctrl 10]",40,0,127,1) : ba.midikey2hz : si.smoo;
in_A1 = hslider("A1[midi:ctrl 11]",40,0,127,1) : ba.midikey2hz : si.smoo;
in_A2 = hslider("A2[midi:ctrl 12]",40,0,127,1) : ba.midikey2hz : si.smoo;

feedback = hslider("feedback",0.99,0,1,0.01) : si.smoo;
f = in_A0;
b = in_A1 / 127;
gain = in_A2 / 127;
gate = button("gate");

freq = f * b;

// Karplus-Strong
string(freq,fdbk) = +~(de.fdelay4(1024,del)*fdbk : reflexionFilter)
with{
  del = ma.SR/freq;
  reflexionFilter = _ <: (_'+_)/2;
};

process = gate : ba.impulsify*gain : string(freq,feedback) <: _,_;
