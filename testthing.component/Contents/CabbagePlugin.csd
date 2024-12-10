<Cabbage> bounds(0, 0, 0, 0)
image bounds(0, 0, 400, 330) channel("image10019") file("background.png")

form caption("asampler") size(400, 330), guiMode("queue"), colour(2, 2, 2), pluginId("APR1"), typeface("ARIAL.ttf")

filebutton bounds(18, 18, 115, 40) channel("loadfile"), text("Load Sample", "Load Sample"), corners(5) colour:0(255, 255, 255, 255) fontColour:0(0, 0, 0, 255) 
button bounds(148, 18, 80, 40) channel("play"), text("Play", "Stop"), corners(5) colour:0(255, 255, 255, 255) colour:1(173, 173, 173, 255) fontColour:0(0, 0, 0, 255) fontColour:1(0, 0, 0, 255)

soundfiler bounds(18, 114, 210, 97), channel("soundfiler1"), , colour(147, 210, 0, 255), tableBackgroundColour(0, 0, 0, 107)

hslider bounds(18, 216, 144, 42) channel("speed") range(0, 2, 1, 2, 0.001)

//REVERB
rslider bounds(250, 16, 60, 63) channel("rvrbtime") range(0, 7, 0, 1, 0.001) text("Time") textColour(255, 255, 255, 255) popupText("Time") colour(0, 154, 255, 255)  markerColour(12, 12, 12, 255) trackerColour(0, 117, 238, 255) fontColour(164, 164, 164, 255) outlineColour(0, 0, 0, 255) 
rslider bounds(322, 16, 60, 63) channel("rvrbsend") range(0.01, 0.5, 0, 1, 0.001) text("Send") textColour(255, 255, 255, 255) popupText("Send") colour(0, 154, 255, 255)  markerColour(0, 0, 0, 255) trackerColour(0, 117, 238, 255) fontColour(164, 164, 164, 255) outlineColour(0, 0, 0, 255)
label bounds(250, 92, 133, 16) channel("label10008") text("Reverb") fontColour(255, 255, 255, 255)

//DELAY
rslider bounds(250, 118, 60, 63) channel("delaytime") range(0.01, 50, 0, 1, 0.001) text("Time") textColour(255, 255, 255, 255) popupText("Time") colour(255, 0, 0, 255)  markerColour(0, 0, 0, 255) trackerColour(255, 0, 0, 255) fontColour(164, 164, 164, 255) outlineColour(0, 0, 0, 255)
rslider bounds(322, 118, 60, 63) channel("delaysend") range(0.01, 1, 0, 1, 0.001) text("Send") textColour(255, 255, 255, 255) popupText("Send") colour(255, 0, 0, 255)  markerColour(0, 0, 0, 255) trackerColour(255, 0, 0, 255) fontColour(164, 164, 164, 255) outlineColour(0, 0, 0, 255)
label bounds(250, 192, 133, 16) channel("label10008") text("Chorus") fontColour(255, 255, 255, 255)

//DIST
rslider bounds(250, 224, 60, 63) channel("distwidth") range(0.01, 1, 0, 1, 0.001) text("Width") textColour(255, 255, 255, 255) popupText("Width") colour(163, 255, 124, 255)  markerColour(0, 0, 0, 255) trackerColour(0, 255, 0, 255) fontColour(164, 164, 164, 255) outlineColour(0, 0, 0, 255)
rslider bounds(322, 224, 60, 63) channel("distcenter") range(-1, 1, 0, 1, 0.001) text("Offset") textColour(255, 255, 255, 255) popupText("Center") colour(163, 255, 124, 255)  markerColour(0, 0, 0, 255) trackerColour(0, 255, 0, 255) fontColour(164, 164, 164, 255) outlineColour(0, 0, 0, 255)
label bounds(250, 300, 133, 16) channel("label10008") text("Distortion") fontColour(255, 255, 255, 255)

rslider bounds(166, 218, 62, 66) channel("gain") range(0, 1, 1, 1, 0.001) text("Gain") textColour(255, 255, 255, 255) popupText("Gain") colour(255, 255, 255, 46)  markerColour(255, 255, 255, 255) trackerColour(255, 255, 255, 255) fontColour(164, 164, 164, 255) outlineColour(0, 0, 0, 0)

hmeter bounds(18, 68, 211, 20) channel("vu1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255) meterColour:0(255, 0, 0, 255) meterColour:1(255, 255, 0, 255) meterColour:2(0, 255, 0, 255)
hmeter bounds(18, 88, 211, 20) channel("vu2")  outlineColour(0, 0, 0, 255),    overlayColour(0, 0, 0, 255) meterColour:0(255, 0, 0, 255) meterColour:1(255, 255, 0, 255) meterColour:2(0, 255, 0, 255)

label bounds(19, 264, 143, 18) channel("label10010") text("Speed") fontColour(255, 255, 255, 255)

combobox bounds(126, 290, 104, 25), populate("*.snaps") automatable(0) channel("combo12") channelType("string") value("0") 

filebutton bounds(20, 290, 102, 25), text("Save", "Save"), mode("preset"), populate("*.snaps") channel("filebutton14")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>e
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

gareverb init 0
gadelay init 0
gadist init 0

gameterL init 0
gameterR init 0

alwayson 96
alwayson 97
alwayson 98
alwayson 99

; Taken from PlaySample-ButtonLoad+RandomSpeed
; Rory Walsh 2021 
;
; License: CC0 1.0 Universal
; You can copy, modify, and distribute this file, 
; even for commercial purposes, all without asking permission. 

instr 1

    ;load sample to soundfiler - and dismiss warning if it is showing
    SFilename, kLoadFile cabbageGetValue "loadfile"
    cabbageSet kLoadFile, "soundfiler1", "file", SFilename
    cabbageSet kLoadFile, "warningLabel", "visible", 0

    ;trigger playback of sample
    kPlayState, kPlayTrig cabbageGetValue "play"
    if kPlayTrig == 1 then
        if kPlayState == 1 then
            event "i", "SamplePlayback", 0, -1
        else
            turnoff2 nstrnum("SamplePlayback"), 0, 0
        endif
    endif


endin

instr SamplePlayback

    SFile cabbageGetValue "loadfile"
    
    if strlen(SFile) == 0 then    
        cabbageSet "warningLabel", "visible", 1
        turnoff        
    else    
        kSpeed cabbageGetValue "speed"
        kGain cabbageGetValue "gain"
        a1, a2 diskin2 SFile, kSpeed, 0, 1
        

        outs a1*kGain, a2*kGain
    endif

    gareverb = gareverb + (a1 + a2)
    gadist = gadist + (a1 + a2)
    gadelay = gadelay + (a1 + a2)
    gameterL = gameterL + (a1 + a2)
    gameterR = gameterR + (a1 + a2)
    
endin

instr 96

;multitap asig [, itime1, igain1] [, itime2, igain2] [...]

    kSend cabbageGetValue "delaysend"
    ares vdelay gadelay, chnget:k("delaytime"), 1000
    outs ares*kSend, ares*kSend
    clear gadelay

endin
instr 97

;ares reverb asig, krvt [, iskip]
    
    kSend cabbageGetValue "rvrbsend"
    ares reverb gareverb, chnget:k("rvrbtime")
    outs ares*kSend, ares*kSend
    clear gareverb

endin

instr 98

;ares delay asig, idlt [, iskip]
    
    
    kSend cabbageGetValue "gain"
	;kmod expseg	0.00001, idur, 1.0
    ares pdclip gadist, chnget:k("distwidth"), chnget:k("distcenter")
    outs ares*kSend*chnget:k("distwidth"), ares*kSend*chnget:k("distwidth")
    clear gadist

endin

instr 99

    k1 rms (gameterL*.33), 20
    k2 rms (gameterR*.33), 20
    
    cabbageSetValue "vu1", portk(k1*10, .25), metro(10)
    cabbageSetValue "vu2", portk(k2*10, .25), metro(10)    
    
    clear gameterL
    clear gameterR
           
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 z
</CsScore>
</CsoundSynthesizer>
