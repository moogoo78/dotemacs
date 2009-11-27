(setq csound-declaration-opcodes (quote ("endin" "endop" "instr" "opcode")))
(setq csound-regexp-declaration (quote "\\<\\(end\\(in\\|op\\)\\|instr\\|opcode\\)\\>[^;/

(setq csdoc-functions (quote ("!=" "%" "&" "*" "+" "/" "==" "^" "a" "abs" "ampdb" "ampdbfs" "birnd" "ceil" "cent" "cos" "cosh" "cosinv" "cpsmidinn" "cpsoct" "cpspch" "db" "dbamp" "dbfsamp" "exp" "floor" "frac" "ftchnls" "ftlen" "ftlptim" "ftsr" "i" "int" "k" "log" "log10" "logbtwo" "nsamp" "octave" "octcps" "octmidinn" "octpch" "p" "pchmidinn" "pchoct" "powoftwo" "rnd" "round" "semitone" "sin" "sinh" "sininv" "sqrt" "tan" "tanh" "taninv" "urd" "|" "||" "~")))
(setq csound-regexp-functions (quote "\\<\\([%&*+/^aikp|~]\\|!=\\|==\\|a\\(bs\\|mpdb\\(\\|fs\\)\\)\\|birnd\\|c\\(e\\(il\\|nt\\)\\|os\\(\\|h\\|inv\\)\\|ps\\(midinn\\|oct\\|pch\\)\\)\\|db\\(\\|amp\\|fsamp\\)\\|exp\\|f\\(loor\\|rac\\|t\\(chnls\\|l\\(en\\|ptim\\)\\|sr\\)\\)\\|int\\|log\\(\\|10\\|btwo\\)\\|nsamp\\|oct\\(ave\\|cps\\|midinn\\|pch\\)\\|p\\(ch\\(midinn\\|oct\\)\\|owoftwo\\)\\|r\\(nd\\|ound\\)\\|s\\(emitone\\|in\\(\\|h\\|inv\\)\\|qrt\\)\\|tan\\(\\|h\\|inv\\)\\|urd\\|||\\)\\>[ 	]*("))
(setq csdoc-0-opcodes (quote ("ATSbufread" "FLcolor" "FLcolor2" "FLgroup" "FLhide" "FLlabel" "FLloadsnap" "FLpack" "FLpackEnd" "FLpanel" "FLpanelEnd" "FLprintk" "FLprintk2" "FLrun" "FLsavesnap" "FLscroll" "FLscrollEnd" "FLsetAlign" "FLsetBox" "FLsetColor" "FLsetColor2" "FLsetFont" "FLsetPosition" "FLsetSize" "FLsetSnapGroup" "FLsetText" "FLsetTextColor" "FLsetTextSize" "FLsetTextType" "FLsetVal" "FLsetVal_i" "FLshow" "FLslidBnk" "FLslidBnk2" "FLslidBnk2Set" "FLslidBnk2Setk" "FLslidBnkSet" "FLslidBnkSetk" "FLtabs" "FLtabsEnd" "FLupdate" "FLvkeybd" "FLvslidBnk" "FLvslidBnk2" "MixerClear" "MixerSend" "MixerSetLevel" "OSCsend" "cggoto" "chano" "chnclear" "chnmix" "chnset" "cigoto" "ckgoto" "clear" "clockoff" "clockon" "cngoto" "cpuprc" "ctrlinit" "delayw" "deltapxw" "denorm" "dispfft" "display" "dssiactivate" "dssictls" "dssilist" "dumpk" "dumpk2" "dumpk3" "dumpk4" "else" "endif" "endin" "endop" "event" "event_i" "exitnow" "ficlose" "fin" "fini" "fink" "flashtxt" "fluidCCi" "fluidCCk" "fluidControl" "fluidNote" "fluidProgramSelect" "fluidSetInterpMethod" "fout" "fouti" "foutir" "foutk" "fprintks" "fprints" "ftfree" "ftload" "ftloadk" "ftmorf" "ftsave" "ftsavek" "goto" "hvs1" "hvs2" "hvs3" "igoto" "ihold" "imagefree" "imagesave" "initc14" "initc21" "initc7" "inrg" "inz" "jacktransport" "kgoto" "ktableseg" "loop_ge" "loop_gt" "loop_le" "loop_lt" "lorismorph" "lorisread" "lpinterp" "lpslot" "massign" "maxabsaccum" "maxaccum" "maxalloc" "mclock" "mdelay" "midichannelaftertouch" "midicontrolchange" "mididefault" "midinoteoff" "midinoteoncps" "midinoteonkey" "midinoteonoct" "midinoteonpch" "midion" "midion2" "midiout" "midipitchbend" "midipolyaftertouch" "midiprogramchange" "minabsaccum" "minaccum" "moscil" "mrtmsg" "mute" "noteoff" "noteon" "noteondur" "noteondur2" "nrpn" "out" "out32" "outc" "outch" "outh" "outiat" "outic" "outic14" "outipat" "outipb" "outipc" "outkat" "outkc" "outkc14" "outkpat" "outkpb" "outkpc" "outo" "outq" "outq1" "outq2" "outq3" "outq4" "outrg" "outs" "outs1" "outs2" "outvalue" "outx" "outz" "pgmassign" "prealloc" "print" "printk" "printk2" "printks" "prints" "pset" "push" "push_f" "puts" "pvbufread" "pvsdisp" "pvsftr" "pvsfwrite" "pvsout" "reinit" "remoteport" "remove" "rewindscore" "rigoto" "rireturn" "scanhammer" "scanu" "schedkwhen" "schedkwhennamed" "schedule" "schedwhen" "scoreline" "scoreline_i" "seed" "setctrl" "setksmps" "setscorepos" "sfilist" "sfpassign" "sfplist" "sndload" "socksend" "soundout" "soundouts" "spat3dt" "specdisp" "splitrig" "stack" "strset" "tablecopy" "tablegpw" "tableicopy" "tableigpw" "tableimix" "tableiw" "tablemix" "tableseg" "tablew" "tablewkt" "tablexseg" "tabplay" "tabrec" "tempo" "tigoto" "timout" "trigseq" "turnoff" "turnoff2" "turnon" "vadd" "vadd_i" "vaddv" "vaddv_i" "vaset" "vbaplsinit" "vbapz" "vbapzmove" "vcella" "vcopy" "vcopy_i" "vdivv" "vdivv_i" "vecdelay" "vexp" "vexp_i" "vexpseg" "vexpv" "vexpv_i" "vincr" "vlimit" "vlinseg" "vmap" "vmirror" "vmult" "vmult_i" "vmultv" "vmultv_i" "vphaseseg" "vport" "vpow" "vpow_i" "vpowv" "vpowv_i" "vrandh" "vrandi" "vstbankload" "vstedit" "vstinfo" "vstmidiout" "vstnote" "vstprogset" "vsubv" "vsubv_i" "vtaba" "vtabi" "vtabk" "vtable1k" "vtablea" "vtablei" "vtablek" "vtablewa" "vtablewi" "vtablewk" "vtabwa" "vtabwi" "vtabwk" "vwrap" "wiirange" "xout" "xscansmap" "xscanu" "xtratim" "zacl" "zakinit" "zaw" "zawm" "ziw" "ziwm" "zkcl" "zkw" "zkwm")))
(setq csound-regexp-0-opcodes (quote "\\<\\(ATSbufread\\|FL\\(color2?\\|group\\|hide\\|l\\(abel\\|oadsnap\\)\\|p\\(a\\(ck\\(\\|End\\)\\|nel\\(\\|End\\)\\)\\|rintk2?\\)\\|run\\|s\\(avesnap\\|croll\\(\\|End\\)\\|et\\(Align\\|Box\\|Color2?\\|Font\\|Position\\|S\\(ize\\|napGroup\\)\\|Text\\(\\|Color\\|Size\\|Type\\)\\|Val\\(\\|_i\\)\\)\\|how\\|lidBnk\\(\\|2\\(\\|Setk?\\)\\|Setk?\\)\\)\\|tabs\\(\\|End\\)\\|update\\|v\\(keybd\\|slidBnk2?\\)\\)\\|Mixer\\(Clear\\|Se\\(nd\\|tLevel\\)\\)\\|OSCsend\\|c\\(ggoto\\|h\\(ano\\|n\\(clear\\|mix\\|set\\)\\)\\|igoto\\|kgoto\\|l\\(ear\\|ocko\\(ff\\|n\\)\\)\\|ngoto\\|puprc\\|trlinit\\)\\|d\\(e\\(l\\(ayw\\|tapxw\\)\\|norm\\)\\|isp\\(fft\\|lay\\)\\|ssi\\(activate\\|ctls\\|list\\)\\|umpk\\(\\|[234]\\)\\)\\|e\\(lse\\|nd\\(i[fn]\\|op\\)\\|vent\\(\\|_i\\)\\|xitnow\\)\\|f\\(i\\(close\\|n\\(\\|[ik]\\)\\)\\|l\\(ashtxt\\|uid\\(C\\(C[ik]\\|ontrol\\)\\|Note\\|ProgramSelect\\|SetInterpMethod\\)\\)\\|out\\(\\|[ik]\\|ir\\)\\|print\\(ks\\|s\\)\\|t\\(free\\|loadk?\\|morf\\|savek?\\)\\)\\|goto\\|hvs[123]\\|i\\(goto\\|hold\\|mage\\(free\\|save\\)\\|n\\(itc\\(14\\|21\\|7\\)\\|rg\\|z\\)\\)\\|jacktransport\\|k\\(goto\\|tableseg\\)\\|l\\(o\\(op_\\(g[et]\\|l[et]\\)\\|ris\\(morph\\|read\\)\\)\\|p\\(interp\\|slot\\)\\)\\|m\\(a\\(ssign\\|xa\\(bsaccum\\|ccum\\|lloc\\)\\)\\|clock\\|delay\\|i\\(di\\(c\\(hannelaftertouch\\|ontrolchange\\)\\|default\\|noteo\\(ff\\|n\\(cps\\|key\\|oct\\|pch\\)\\)\\|o\\(n2?\\|ut\\)\\|p\\(itchbend\\|olyaftertouch\\|rogramchange\\)\\)\\|na\\(bsaccum\\|ccum\\)\\)\\|oscil\\|rtmsg\\|ute\\)\\|n\\(oteo\\(ff\\|n\\(\\|dur2?\\)\\)\\|rpn\\)\\|out\\(\\|[choqsxz]\\|32\\|ch\\|i\\(at\\|c\\(\\|14\\)\\|p\\([bc]\\|at\\)\\)\\|k\\(at\\|c\\(\\|14\\)\\|p\\([bc]\\|at\\)\\)\\|q[1234]\\|rg\\|s[12]\\|value\\)\\|p\\(gmassign\\|r\\(ealloc\\|int\\(\\|[ks]\\|k[2s]\\)\\)\\|set\\|u\\(sh\\(\\|_f\\)\\|ts\\)\\|v\\(bufread\\|s\\(disp\\|f\\(tr\\|write\\)\\|out\\)\\)\\)\\|r\\(e\\(init\\|mo\\(teport\\|ve\\)\\|windscore\\)\\|i\\(goto\\|return\\)\\)\\|s\\(c\\(an\\(hammer\\|u\\)\\|hed\\(kwhen\\(\\|named\\)\\|ule\\|when\\)\\|oreline\\(\\|_i\\)\\)\\|e\\(ed\\|t\\(ctrl\\|ksmps\\|scorepos\\)\\)\\|f\\(ilist\\|p\\(assign\\|list\\)\\)\\|ndload\\|o\\(cksend\\|undouts?\\)\\|p\\(at3dt\\|ecdisp\\|litrig\\)\\|t\\(ack\\|rset\\)\\)\\|t\\(ab\\(le\\(copy\\|gpw\\|i\\(copy\\|gpw\\|mix\\|w\\)\\|mix\\|seg\\|w\\(\\|kt\\)\\|xseg\\)\\|play\\|rec\\)\\|empo\\|i\\(goto\\|mout\\)\\|rigseq\\|urno\\(ff2?\\|n\\)\\)\\|v\\(a\\(dd\\(\\|_i\\|v\\(\\|_i\\)\\)\\|set\\)\\|bap\\(lsinit\\|z\\(\\|move\\)\\)\\|c\\(ella\\|opy\\(\\|_i\\)\\)\\|divv\\(\\|_i\\)\\|e\\(cdelay\\|xp\\(\\|_i\\|seg\\|v\\(\\|_i\\)\\)\\)\\|incr\\|li\\(mit\\|nseg\\)\\|m\\(ap\\|irror\\|ult\\(\\|_i\\|v\\(\\|_i\\)\\)\\)\\|p\\(haseseg\\|o\\(rt\\|w\\(\\|_i\\|v\\(\\|_i\\)\\)\\)\\)\\|rand[hi]\\|s\\(t\\(bankload\\|edit\\|info\\|midiout\\|note\\|progset\\)\\|ubv\\(\\|_i\\)\\)\\|tab\\([aik]\\|le\\([aik]\\|1k\\|w[aik]\\)\\|w[aik]\\)\\|wrap\\)\\|wiirange\\|x\\(out\\|scan\\(smap\\|u\\)\\|tratim\\)\\|z\\(a\\(cl\\|kinit\\|wm?\\)\\|iwm?\\|k\\(cl\\|wm?\\)\\)\\)\\>"))
(setq csdoc-undocumented-opcodes (quote ("0dbfs" "fluidControl" "hrtfer" "printf" "printf_i" "subinstrinit" "tab" "tabw" "tabw_i")))
(setq csound-control-flow-opcodes (quote ("cggoto" "cigoto" "ckgoto" "cngoto" "else" "elseif" "endif" "goto" "if" "igoto" "init" "kgoto" "nstrnum" "p" "pset" "reinit" "rigoto" "rireturn" "setksmps" "tigoto" "timout" "tival")))
(setq csound-regexp-control-flow (quote "\\<\\(c\\(ggoto\\|igoto\\|kgoto\\|ngoto\\)\\|e\\(lse\\(\\|if\\)\\|ndif\\)\\|goto\\|i\\(f\\|goto\\|nit\\)\\|kgoto\\|nstrnum\\|p\\(\\|set\\)\\|r\\(einit\\|i\\(goto\\|return\\)\\)\\|setksmps\\|ti\\(goto\\|mout\\|val\\)\\)\\>"))
(setq csound-IO-opcodes (quote ("aftouch" "chanctrl" "chn" "chnclear" "chnexport" "chnmix" "chnparams" "clear" "ctrl14" "ctrl21" "ctrl7" "ctrlinit" "diskin" "diskin2" "dispfft" "display" "dumpk" "dumpk2" "dumpk3" "dumpk4" "ficlose" "filelen" "filenchnls" "filepeak" "filesr" "fin" "fini" "fink" "fiopen" "flashtxt" "fout" "fouti" "foutir" "foutk" "fprintks" "fprints" "in" "in32" "inch" "inh" "initc14" "initc21" "initc7" "ino" "inq" "inrg" "ins" "invalue" "inx" "inz" "massign" "mclock" "mdelay" "midic14" "midic21" "midic7" "midictrl" "midiin" "midion" "midion2" "midiout" "monitor" "moscil" "mp3in" "mrtmsg" "noteoff" "noteon" "noteondur" "noteondur2" "notnum" "nrpn" "out" "out32" "outc" "outch" "outh" "outiat" "outic" "outic14" "outipat" "outipb" "outipc" "outkat" "outkc" "outkc14" "outkpat" "outkpb" "outkpc" "outo" "outq" "outq1" "outq2" "outq3" "outq4" "outrg" "outs" "outs1" "outs2" "outvalue" "outx" "outz" "pchbend" "pgmassign" "polyaft" "print" "printf" "printk" "printk2" "printks" "prints" "readk" "readk2" "readk3" "readk4" "s16b14" "s32b14" "slider16" "slider16f" "slider16table" "slider16tablef" "slider32" "slider32f" "slider32table" "slider32tablef" "slider64" "slider64f" "slider64table" "slider64tablef" "slider8" "slider8f" "slider8table" "slider8tablef" "sliderKawai" "soundin" "soundout" "soundouts" "veloc" "vincr" "xin" "xout")))
(setq csound-regexp-IO (quote "\\<\\(aftouch\\|c\\(h\\(anctrl\\|n\\(\\|clear\\|export\\|mix\\|params\\)\\)\\|lear\\|trl\\(14\\|21\\|7\\|init\\)\\)\\|d\\(is\\(kin2?\\|p\\(fft\\|lay\\)\\)\\|umpk\\(\\|[234]\\)\\)\\|f\\(i\\(close\\|le\\(len\\|nchnls\\|peak\\|sr\\)\\|n\\(\\|[ik]\\)\\|open\\)\\|lashtxt\\|out\\(\\|[ik]\\|ir\\)\\|print\\(ks\\|s\\)\\)\\|in\\(\\|[hoqsxz]\\|32\\|ch\\|itc\\(14\\|21\\|7\\)\\|rg\\|value\\)\\|m\\(assign\\|clock\\|delay\\|idi\\(c\\(14\\|21\\|7\\|trl\\)\\|in\\|o\\(n2?\\|ut\\)\\)\\|o\\(nitor\\|scil\\)\\|p3in\\|rtmsg\\)\\|n\\(ot\\(eo\\(ff\\|n\\(\\|dur2?\\)\\)\\|num\\)\\|rpn\\)\\|out\\(\\|[choqsxz]\\|32\\|ch\\|i\\(at\\|c\\(\\|14\\)\\|p\\([bc]\\|at\\)\\)\\|k\\(at\\|c\\(\\|14\\)\\|p\\([bc]\\|at\\)\\)\\|q[1234]\\|rg\\|s[12]\\|value\\)\\|p\\(chbend\\|gmassign\\|olyaft\\|rint\\(\\|[fks]\\|k[2s]\\)\\)\\|readk\\(\\|[234]\\)\\|s\\(16b14\\|32b14\\|lider\\(16\\(\\|f\\|tablef?\\)\\|32\\(\\|f\\|tablef?\\)\\|64\\(\\|f\\|tablef?\\)\\|8\\(\\|f\\|tablef?\\)\\|Kawai\\)\\|ound\\(in\\|outs?\\)\\)\\|v\\(eloc\\|incr\\)\\|x\\(in\\|out\\)\\)\\>"))
(setq csound-special-opcodes (quote ("!=" "%" "&" "*" "+" "/" "==" "ATSbufread" "FLcolor" "FLcolor2" "FLgroup" "FLhide" "FLlabel" "FLloadsnap" "FLpack" "FLpackEnd" "FLpanel" "FLpanelEnd" "FLprintk" "FLprintk2" "FLrun" "FLsavesnap" "FLscroll" "FLscrollEnd" "FLsetAlign" "FLsetBox" "FLsetColor" "FLsetColor2" "FLsetFont" "FLsetPosition" "FLsetSize" "FLsetSnapGroup" "FLsetText" "FLsetTextColor" "FLsetTextSize" "FLsetTextType" "FLsetVal" "FLsetVal_i" "FLshow" "FLslidBnk" "FLslidBnk2" "FLslidBnk2Set" "FLslidBnk2Setk" "FLslidBnkSet" "FLslidBnkSetk" "FLtabs" "FLtabsEnd" "FLupdate" "FLvkeybd" "FLvslidBnk" "FLvslidBnk2" "MixerClear" "MixerSend" "MixerSetLevel" "OSCsend" "^" "a" "abs" "aftouch" "ampdb" "ampdbfs" "birnd" "ceil" "cent" "cggoto" "cggoto" "chanctrl" "chano" "chn" "chnclear" "chnclear" "chnexport" "chnmix" "chnmix" "chnparams" "chnset" "cigoto" "cigoto" "ckgoto" "ckgoto" "clear" "clear" "clockoff" "clockon" "cngoto" "cngoto" "cos" "cosh" "cosinv" "cpsmidinn" "cpsoct" "cpspch" "cpuprc" "ctrl14" "ctrl21" "ctrl7" "ctrlinit" "ctrlinit" "db" "dbamp" "dbfsamp" "delayw" "deltapxw" "denorm" "diskin" "diskin2" "dispfft" "dispfft" "display" "display" "dssiactivate" "dssictls" "dssilist" "dumpk" "dumpk" "dumpk2" "dumpk2" "dumpk3" "dumpk3" "dumpk4" "dumpk4" "else" "else" "elseif" "endif" "endif" "endin" "endin" "endop" "endop" "event" "event_i" "exitnow" "exp" "ficlose" "ficlose" "filelen" "filenchnls" "filepeak" "filesr" "fin" "fin" "fini" "fini" "fink" "fink" "fiopen" "flashtxt" "flashtxt" "floor" "fluidCCi" "fluidCCk" "fluidControl" "fluidNote" "fluidProgramSelect" "fluidSetInterpMethod" "fout" "fout" "fouti" "fouti" "foutir" "foutir" "foutk" "foutk" "fprintks" "fprintks" "fprints" "fprints" "frac" "ftchnls" "ftfree" "ftlen" "ftload" "ftloadk" "ftlptim" "ftmorf" "ftsave" "ftsavek" "ftsr" "goto" "goto" "hvs1" "hvs2" "hvs3" "i" "if" "igoto" "igoto" "ihold" "imagefree" "imagesave" "in" "in32" "inch" "inh" "init" "initc14" "initc14" "initc21" "initc21" "initc7" "initc7" "ino" "inq" "inrg" "inrg" "ins" "instr" "int" "invalue" "inx" "inz" "inz" "jacktransport" "k" "kgoto" "kgoto" "kr" "ksmps" "ktableseg" "log" "log10" "logbtwo" "loop_ge" "loop_gt" "loop_le" "loop_lt" "lorismorph" "lorisread" "lpinterp" "lpslot" "massign" "massign" "maxabsaccum" "maxaccum" "maxalloc" "mclock" "mclock" "mdelay" "mdelay" "midic14" "midic21" "midic7" "midichannelaftertouch" "midicontrolchange" "midictrl" "mididefault" "midiin" "midinoteoff" "midinoteoncps" "midinoteonkey" "midinoteonoct" "midinoteonpch" "midion" "midion" "midion2" "midion2" "midiout" "midiout" "midipitchbend" "midipolyaftertouch" "midiprogramchange" "minabsaccum" "minaccum" "monitor" "moscil" "moscil" "mp3in" "mrtmsg" "mrtmsg" "mute" "nchnls" "noteoff" "noteoff" "noteon" "noteon" "noteondur" "noteondur" "noteondur2" "noteondur2" "notnum" "nrpn" "nrpn" "nsamp" "nstrnum" "octave" "octcps" "octmidinn" "octpch" "opcode" "out" "out" "out32" "out32" "outc" "outc" "outch" "outch" "outh" "outh" "outiat" "outiat" "outic" "outic" "outic14" "outic14" "outipat" "outipat" "outipb" "outipb" "outipc" "outipc" "outkat" "outkat" "outkc" "outkc" "outkc14" "outkc14" "outkpat" "outkpat" "outkpb" "outkpb" "outkpc" "outkpc" "outo" "outo" "outq" "outq" "outq1" "outq1" "outq2" "outq2" "outq3" "outq3" "outq4" "outq4" "outrg" "outrg" "outs" "outs" "outs1" "outs1" "outs2" "outs2" "outvalue" "outvalue" "outx" "outx" "outz" "outz" "p" "p" "pchbend" "pchmidinn" "pchoct" "pgmassign" "pgmassign" "polyaft" "powoftwo" "prealloc" "print" "print" "printf" "printk" "printk" "printk2" "printk2" "printks" "printks" "prints" "prints" "pset" "pset" "push" "push_f" "puts" "pvbufread" "pvsdisp" "pvsftr" "pvsfwrite" "pvsout" "readk" "readk2" "readk3" "readk4" "reinit" "reinit" "remoteport" "remove" "rewindscore" "rigoto" "rigoto" "rireturn" "rireturn" "rnd" "round" "s16b14" "s32b14" "scanhammer" "scanu" "schedkwhen" "schedkwhennamed" "schedule" "schedwhen" "scoreline" "scoreline_i" "seed" "semitone" "setctrl" "setksmps" "setksmps" "setscorepos" "sfilist" "sfpassign" "sfplist" "sin" "sinh" "sininv" "slider16" "slider16f" "slider16table" "slider16tablef" "slider32" "slider32f" "slider32table" "slider32tablef" "slider64" "slider64f" "slider64table" "slider64tablef" "slider8" "slider8f" "slider8table" "slider8tablef" "sliderKawai" "sndload" "socksend" "soundin" "soundout" "soundout" "soundouts" "soundouts" "spat3dt" "specdisp" "splitrig" "sqrt" "sr" "stack" "strset" "tablecopy" "tablegpw" "tableicopy" "tableigpw" "tableimix" "tableiw" "tablemix" "tableseg" "tablew" "tablewkt" "tablexseg" "tabplay" "tabrec" "tan" "tanh" "taninv" "tempo" "tigoto" "tigoto" "timout" "timout" "tival" "trigseq" "turnoff" "turnoff2" "turnon" "urd" "vadd" "vadd_i" "vaddv" "vaddv_i" "vaset" "vbaplsinit" "vbapz" "vbapzmove" "vcella" "vcopy" "vcopy_i" "vdivv" "vdivv_i" "vecdelay" "veloc" "vexp" "vexp_i" "vexpseg" "vexpv" "vexpv_i" "vincr" "vincr" "vlimit" "vlinseg" "vmap" "vmirror" "vmult" "vmult_i" "vmultv" "vmultv_i" "vphaseseg" "vport" "vpow" "vpow_i" "vpowv" "vpowv_i" "vrandh" "vrandi" "vstbankload" "vstedit" "vstinfo" "vstmidiout" "vstnote" "vstprogset" "vsubv" "vsubv_i" "vtaba" "vtabi" "vtabk" "vtable1k" "vtablea" "vtablei" "vtablek" "vtablewa" "vtablewi" "vtablewk" "vtabwa" "vtabwi" "vtabwk" "vwrap" "wiirange" "xin" "xout" "xout" "xscansmap" "xscanu" "xtratim" "zacl" "zakinit" "zaw" "zawm" "ziw" "ziwm" "zkcl" "zkw" "zkwm" "|" "||" "~")))
(setq csdoc-opcodes (quote ("!=" "%" "&" "*" "+" "/" "=" "==" "ATSadd" "ATSaddnz" "ATSbufread" "ATScross" "ATSinfo" "ATSinterpread" "ATSpartialtap" "ATSread" "ATSreadnz" "ATSsinnoi" "FLbox" "FLbutBank" "FLbutton" "FLcloseButton" "FLcolor" "FLcolor2" "FLcount" "FLexecButton" "FLgetsnap" "FLgroup" "FLhide" "FLhvsBox" "FLjoy" "FLkeyIn" "FLknob" "FLlabel" "FLloadsnap" "FLmouse" "FLpack" "FLpackEnd" "FLpanel" "FLpanelEnd" "FLprintk" "FLprintk2" "FLroller" "FLrun" "FLsavesnap" "FLscroll" "FLscrollEnd" "FLsetAlign" "FLsetBox" "FLsetColor" "FLsetColor2" "FLsetFont" "FLsetPosition" "FLsetSize" "FLsetSnapGroup" "FLsetText" "FLsetTextColor" "FLsetTextSize" "FLsetTextType" "FLsetVal" "FLsetVal_i" "FLsetsnap" "FLshow" "FLslidBnk" "FLslidBnk2" "FLslidBnk2Set" "FLslidBnk2Setk" "FLslidBnkGetHandle" "FLslidBnkSet" "FLslidBnkSetk" "FLslider" "FLtabs" "FLtabsEnd" "FLtext" "FLupdate" "FLvalue" "FLvkeybd" "FLvslidBnk" "FLvslidBnk2" "FLxyin" "MixerClear" "MixerGetLevel" "MixerReceive" "MixerSend" "MixerSetLevel" "OSCinit" "OSClisten" "OSCsend" "^" "a" "abs" "active" "adsr" "adsyn" "adsynt" "adsynt2" "aftouch" "alpass" "ampdb" "ampdbfs" "ampmidi" "areson" "aresonk" "atone" "atonek" "atonex" "babo" "balance" "bamboo" "barmodel" "bbcutm" "bbcuts" "betarand" "bexprnd" "bformdec" "bformdec1" "bformenc" "bformenc1" "binit" "biquad" "biquada" "birnd" "bqrez" "butbp" "butbr" "buthp" "butlp" "butterbp" "butterbr" "butterhp" "butterlp" "button" "buzz" "cabasa" "cauchy" "ceil" "cent" "cggoto" "chanctrl" "changed" "chani" "chano" "chebyshevpoly" "checkbox" "chn" "chnclear" "chnexport" "chnget" "chnmix" "chnparams" "chnset" "chuap" "cigoto" "ckgoto" "clear" "clfilt" "clip" "clockoff" "clockon" "cngoto" "comb" "compress" "control" "convolve" "cos" "cosh" "cosinv" "cps2pch" "cpsmidi" "cpsmidib" "cpsmidinn" "cpsoct" "cpspch" "cpstmid" "cpstun" "cpstuni" "cpsxpch" "cpuprc" "cross2" "crunch" "ctrl14" "ctrl21" "ctrl7" "ctrlinit" "cuserrnd" "dam" "date" "dates" "db" "dbamp" "dbfsamp" "dcblock" "dcblock2" "dconv" "delay" "delay1" "delayk" "delayr" "delayw" "deltap" "deltap3" "deltapi" "deltapn" "deltapx" "deltapxw" "denorm" "diff" "diskgrain" "diskin" "diskin2" "dispfft" "display" "distort" "distort1" "divz" "downsamp" "dripwater" "dssiactivate" "dssiaudio" "dssictls" "dssiinit" "dssilist" "dumpk" "dumpk2" "dumpk3" "dumpk4" "duserrnd" "else" "endif" "endin" "endop" "envlpx" "envlpxr" "eqfil" "event" "event_i" "exitnow" "exp" "expcurve" "expon" "exprand" "expseg" "expsega" "expsegr" "ficlose" "filelen" "filenchnls" "filepeak" "filesr" "filter2" "fin" "fini" "fink" "fiopen" "flanger" "flashtxt" "flooper" "flooper2" "floor" "fluidAllOut" "fluidCCi" "fluidCCk" "fluidControl" "fluidEngine" "fluidLoad" "fluidNote" "fluidOut" "fluidProgramSelect" "fluidSetInterpMethod" "fmb3" "fmbell" "fmmetal" "fmpercfl" "fmrhode" "fmvoice" "fmwurlie" "fof" "fof2" "fofilter" "fog" "fold" "follow" "follow2" "foscil" "foscili" "fout" "fouti" "foutir" "foutk" "fprintks" "fprints" "frac" "freeverb" "ftchnls" "ftconv" "ftfree" "ftgen" "ftgentmp" "ftlen" "ftload" "ftloadk" "ftlptim" "ftmorf" "ftsave" "ftsavek" "ftsr" "gain" "gainslider" "gauss" "gbuzz" "getcfg" "gogobel" "goto" "grain" "grain2" "grain3" "granule" "guiro" "harmon" "harmon2" "hilbert" "hrtfmove" "hrtfmove2" "hrtfstat" "hsboscil" "hvs1" "hvs2" "hvs3" "i" "igoto" "ihold" "imagecreate" "imagefree" "imagegetpixel" "imageload" "imagesave" "imagesize" "in" "in32" "inch" "inh" "init" "initc14" "initc21" "initc7" "ino" "inq" "inrg" "ins" "insglobal" "insremot" "int" "integ" "interp" "invalue" "inx" "inz" "jacktransport" "jitter" "jitter2" "jspline" "k" "kgoto" "ktableseg" "lfo" "limit" "line" "linen" "linenr" "lineto" "linrand" "linseg" "linsegr" "locsend" "locsig" "log" "log10" "logbtwo" "logcurve" "loop_ge" "loop_gt" "loop_le" "loop_lt" "loopseg" "loopsegp" "lorenz" "lorismorph" "lorisplay" "lorisread" "loscil" "loscil3" "loscilx" "lowpass2" "lowres" "lowresx" "lpf18" "lpfreson" "lphasor" "lpinterp" "lposcil" "lposcil3" "lposcila" "lposcilsa" "lposcilsa2" "lpread" "lpreson" "lpshold" "lpsholdp" "lpslot" "mac" "maca" "madsr" "mandel" "mandol" "marimba" "massign" "max" "max_k" "maxabs" "maxabsaccum" "maxaccum" "maxalloc" "mclock" "mdelay" "metro" "midic14" "midic21" "midic7" "midichannelaftertouch" "midichn" "midicontrolchange" "midictrl" "mididefault" "midiin" "midinoteoff" "midinoteoncps" "midinoteonkey" "midinoteonoct" "midinoteonpch" "midion" "midion2" "midiout" "midipitchbend" "midipolyaftertouch" "midiprogramchange" "miditempo" "min" "minabs" "minabsaccum" "minaccum" "mirror" "mode" "monitor" "moog" "moogladder" "moogvcf" "moogvcf2" "moscil" "mp3in" "mpulse" "mrtmsg" "multitap" "mute" "mxadsr" "nestedap" "nlfilt" "noise" "noteoff" "noteon" "noteondur" "noteondur2" "notnum" "nreverb" "nrpn" "nsamp" "nstrnum" "ntrpol" "octave" "octcps" "octmidi" "octmidib" "octmidinn" "octpch" "oscbnk" "oscil" "oscil1" "oscil1i" "oscil3" "oscili" "oscilikt" "osciliktp" "oscilikts" "osciln" "oscils" "out" "out32" "outc" "outch" "outh" "outiat" "outic" "outic14" "outipat" "outipb" "outipc" "outkat" "outkc" "outkc14" "outkpat" "outkpb" "outkpc" "outo" "outq" "outq1" "outq2" "outq3" "outq4" "outrg" "outs" "outs1" "outs2" "outvalue" "outx" "outz" "p" "pan" "pan2" "pareq" "partials" "partikkel" "partikkelsync" "pcauchy" "pchbend" "pchmidi" "pchmidib" "pchmidinn" "pchoct" "pconvolve" "pcount" "pdclip" "pdhalf" "pdhalfy" "peak" "pgmassign" "phaser1" "phaser2" "phasor" "phasorbnk" "pindex" "pinkish" "pitch" "pitchamdf" "planet" "pluck" "poisson" "polyaft" "polynomial" "pop" "pop_f" "port" "portk" "poscil" "poscil3" "pow" "powershape" "powoftwo" "prealloc" "prepiano" "print" "printk" "printk2" "printks" "prints" "product" "pset" "ptrack" "push" "push_f" "puts" "pvadd" "pvbufread" "pvcross" "pvinterp" "pvoc" "pvread" "pvsadsyn" "pvsanal" "pvsarp" "pvsbandp" "pvsbandr" "pvsbin" "pvsblur" "pvsbuffer" "pvsbufread" "pvscale" "pvscent" "pvscross" "pvsdemix" "pvsdisp" "pvsfilter" "pvsfread" "pvsfreeze" "pvsftr" "pvsftw" "pvsfwrite" "pvshift" "pvsifd" "pvsin" "pvsinfo" "pvsinit" "pvsmaska" "pvsmix" "pvsmooth" "pvsmorph" "pvsosc" "pvsout" "pvspitch" "pvstencil" "pvsvoc" "pvsynth" "rand" "randh" "randi" "random" "randomh" "randomi" "rbjeq" "readclock" "readk" "readk2" "readk3" "readk4" "reinit" "release" "remoteport" "remove" "repluck" "reson" "resonk" "resonr" "resonx" "resonxk" "resony" "resonz" "resyn" "reverb" "reverb2" "reverbsc" "rewindscore" "rezzy" "rigoto" "rireturn" "rms" "rnd" "rnd31" "round" "rspline" "rtclock" "s16b14" "s32b14" "samphold" "sandpaper" "scale" "scanhammer" "scans" "scantable" "scanu" "schedkwhen" "schedkwhennamed" "schedule" "schedwhen" "scoreline" "scoreline_i" "seed" "sekere" "semitone" "sensekey" "seqtime" "seqtime2" "setctrl" "setksmps" "setscorepos" "sfilist" "sfinstr" "sfinstr3" "sfinstr3m" "sfinstrm" "sfload" "sflooper" "sfpassign" "sfplay" "sfplay3" "sfplay3m" "sfplaym" "sfplist" "sfpreset" "shaker" "sin" "sinh" "sininv" "sinsyn" "sleighbells" "slider16" "slider16f" "slider16table" "slider16tablef" "slider32" "slider32f" "slider32table" "slider32tablef" "slider64" "slider64f" "slider64table" "slider64tablef" "slider8" "slider8f" "slider8table" "slider8tablef" "sliderKawai" "sndload" "sndloop" "sndwarp" "sndwarpst" "sockrecv" "socksend" "soundin" "soundout" "soundouts" "space" "spat3d" "spat3di" "spat3dt" "spdist" "specaddm" "specdiff" "specdisp" "specfilt" "spechist" "specptrk" "specscal" "specsum" "spectrum" "splitrig" "sprintf" "sprintfk" "spsend" "sqrt" "stack" "statevar" "stix" "strcat" "strcatk" "strchar" "strchark" "strcmp" "strcmpk" "strcpy" "strcpyk" "streson" "strget" "strindex" "strindexk" "strlen" "strlenk" "strlower" "strlowerk" "strrindex" "strrindexk" "strset" "strsub" "strsubk" "strtod" "strtodk" "strtol" "strtolk" "strupper" "strupperk" "sum" "svfilter" "syncgrain" "syncloop" "syncphasor" "system" "table" "table3" "tablecopy" "tablegpw" "tablei" "tableicopy" "tableigpw" "tableikt" "tableimix" "tableiw" "tablekt" "tablemix" "tableng" "tablera" "tableseg" "tablew" "tablewa" "tablewkt" "tablexkt" "tablexseg" "tabmorph" "tabmorpha" "tabmorphak" "tabmorphi" "tabplay" "tabrec" "tabsum" "tambourine" "tan" "tanh" "taninv" "taninv2" "tbvcf" "tempest" "tempo" "tempoval" "tigoto" "timedseq" "timeinstk" "timeinsts" "timek" "times" "timout" "tival" "tlineto" "tone" "tonek" "tonex" "tradsyn" "trandom" "transeg" "trcross" "trfilter" "trhighest" "trigger" "trigseq" "trirand" "trlowest" "trmix" "trscale" "trshift" "trsplit" "turnoff" "turnoff2" "turnon" "unirand" "upsamp" "urd" "vadd" "vadd_i" "vaddv" "vaddv_i" "vaget" "valpass" "vaset" "vbap16" "vbap16move" "vbap4" "vbap4move" "vbap8" "vbap8move" "vbaplsinit" "vbapz" "vbapzmove" "vcella" "vco" "vco2" "vco2ft" "vco2ift" "vco2init" "vcomb" "vcopy" "vcopy_i" "vdelay" "vdelay3" "vdelayk" "vdelayx" "vdelayxq" "vdelayxs" "vdelayxw" "vdelayxwq" "vdelayxws" "vdivv" "vdivv_i" "vecdelay" "veloc" "vexp" "vexp_i" "vexpseg" "vexpv" "vexpv_i" "vibes" "vibr" "vibrato" "vincr" "vlimit" "vlinseg" "vlowres" "vmap" "vmirror" "vmult" "vmult_i" "vmultv" "vmultv_i" "voice" "vosim" "vphaseseg" "vport" "vpow" "vpow_i" "vpowv" "vpowv_i" "vpvoc" "vrandh" "vrandi" "vstbankload" "vstedit" "vstinfo" "vstinit" "vstmidiout" "vstnote" "vstprogset" "vsubv" "vsubv_i" "vtaba" "vtabi" "vtabk" "vtable1k" "vtablea" "vtablei" "vtablek" "vtablewa" "vtablewi" "vtablewk" "vtabwa" "vtabwi" "vtabwk" "vwrap" "waveset" "weibull" "wgbow" "wgbowedbar" "wgbrass" "wgclar" "wgflute" "wgpluck" "wgpluck2" "wguide1" "wguide2" "wiiconnect" "wiidata" "wiirange" "wiisend" "wrap" "wterrain" "xadsr" "xin" "xout" "xscanmap" "xscans" "xscansmap" "xscanu" "xtratim" "xyin" "zacl" "zakinit" "zamod" "zar" "zarg" "zaw" "zawm" "zfilter2" "zir" "ziw" "ziwm" "zkcl" "zkmod" "zkr" "zkw" "zkwm" "|" "||" "~")))
(setq csdoc-general-opcodes (quote ("0dbfs" "=" "ATSadd" "ATSaddnz" "ATScross" "ATSinfo" "ATSinterpread" "ATSpartialtap" "ATSread" "ATSreadnz" "ATSsinnoi" "FLbox" "FLbutBank" "FLbutton" "FLcloseButton" "FLcount" "FLexecButton" "FLgetsnap" "FLhvsBox" "FLjoy" "FLkeyIn" "FLknob" "FLmouse" "FLroller" "FLsetsnap" "FLslidBnkGetHandle" "FLslider" "FLtext" "FLvalue" "FLxyin" "MixerGetLevel" "MixerReceive" "OSCinit" "OSClisten" "active" "adsr" "adsyn" "adsynt" "adsynt2" "alpass" "ampmidi" "areson" "aresonk" "atone" "atonek" "atonex" "babo" "balance" "bamboo" "barmodel" "bbcutm" "bbcuts" "betarand" "bexprnd" "bformdec" "bformdec1" "bformenc" "bformenc1" "binit" "biquad" "biquada" "bqrez" "butbp" "butbr" "buthp" "butlp" "butterbp" "butterbr" "butterhp" "butterlp" "button" "buzz" "cabasa" "cauchy" "changed" "chani" "chebyshevpoly" "checkbox" "chnget" "chuap" "clfilt" "clip" "comb" "compress" "control" "convolve" "cps2pch" "cpsmidi" "cpsmidib" "cpstmid" "cpstun" "cpstuni" "cpsxpch" "cross2" "crunch" "cuserrnd" "dam" "date" "dates" "dcblock" "dcblock2" "dconv" "delay" "delay1" "delayk" "delayr" "deltap" "deltap3" "deltapi" "deltapn" "deltapx" "diff" "diskgrain" "distort" "distort1" "divz" "downsamp" "dripwater" "dssiaudio" "dssiinit" "duserrnd" "envlpx" "envlpxr" "eqfil" "expcurve" "expon" "exprand" "expseg" "expsega" "expsegr" "filter2" "flanger" "flooper" "flooper2" "fluidAllOut" "fluidEngine" "fluidLoad" "fluidOut" "fmb3" "fmbell" "fmmetal" "fmpercfl" "fmrhode" "fmvoice" "fmwurlie" "fof" "fof2" "fofilter" "fog" "fold" "follow" "follow2" "foscil" "foscili" "freeverb" "ftconv" "ftgen" "ftgentmp" "gain" "gainslider" "gauss" "gbuzz" "getcfg" "gogobel" "grain" "grain2" "grain3" "granule" "guiro" "harmon" "harmon2" "hilbert" "hrtfer" "hrtfmove" "hrtfmove2" "hrtfstat" "hsboscil" "imagecreate" "imagegetpixel" "imageload" "imagesize" "insglobal" "insremot" "integ" "interp" "jitter" "jitter2" "jspline" "lfo" "limit" "line" "linen" "linenr" "lineto" "linrand" "linseg" "linsegr" "locsend" "locsig" "logcurve" "loopseg" "loopsegp" "lorenz" "lorisplay" "loscil" "loscil3" "loscilx" "lowpass2" "lowres" "lowresx" "lpf18" "lpfreson" "lphasor" "lposcil" "lposcil3" "lposcila" "lposcilsa" "lposcilsa2" "lpread" "lpreson" "lpshold" "lpsholdp" "mac" "maca" "madsr" "mandel" "mandol" "marimba" "max" "max_k" "maxabs" "metro" "midichn" "miditempo" "min" "minabs" "mirror" "mode" "moog" "moogladder" "moogvcf" "moogvcf2" "mpulse" "multitap" "mxadsr" "nestedap" "nlfilt" "noise" "nreverb" "ntrpol" "octmidi" "octmidib" "oscbnk" "oscil" "oscil1" "oscil1i" "oscil3" "oscili" "oscilikt" "osciliktp" "oscilikts" "osciln" "oscils" "pan" "pan2" "pareq" "partials" "partikkel" "partikkelsync" "pcauchy" "pchmidi" "pchmidib" "pconvolve" "pcount" "pdclip" "pdhalf" "pdhalfy" "peak" "phaser1" "phaser2" "phasor" "phasorbnk" "pindex" "pinkish" "pitch" "pitchamdf" "planet" "pluck" "poisson" "polynomial" "pop" "pop_f" "port" "portk" "poscil" "poscil3" "pow" "powershape" "prepiano" "printf_i" "product" "ptrack" "pvadd" "pvcross" "pvinterp" "pvoc" "pvread" "pvsadsyn" "pvsanal" "pvsarp" "pvsbandp" "pvsbandr" "pvsbin" "pvsblur" "pvsbuffer" "pvsbufread" "pvscale" "pvscent" "pvscross" "pvsdemix" "pvsfilter" "pvsfread" "pvsfreeze" "pvsftw" "pvshift" "pvsifd" "pvsin" "pvsinfo" "pvsinit" "pvsmaska" "pvsmix" "pvsmooth" "pvsmorph" "pvsosc" "pvspitch" "pvstencil" "pvsvoc" "pvsynth" "rand" "randh" "randi" "random" "randomh" "randomi" "rbjeq" "readclock" "release" "repluck" "reson" "resonk" "resonr" "resonx" "resonxk" "resony" "resonz" "resyn" "reverb" "reverb2" "reverbsc" "rezzy" "rms" "rnd31" "rspline" "rtclock" "samphold" "sandpaper" "scale" "scans" "scantable" "sekere" "sensekey" "seqtime" "seqtime2" "sfinstr" "sfinstr3" "sfinstr3m" "sfinstrm" "sfload" "sflooper" "sfplay" "sfplay3" "sfplay3m" "sfplaym" "sfpreset" "shaker" "sinsyn" "sleighbells" "sndloop" "sndwarp" "sndwarpst" "sockrecv" "space" "spat3d" "spat3di" "spdist" "specaddm" "specdiff" "specfilt" "spechist" "specptrk" "specscal" "specsum" "spectrum" "sprintf" "sprintfk" "spsend" "statevar" "stix" "strcat" "strcatk" "strchar" "strchark" "strcmp" "strcmpk" "strcpy" "strcpyk" "streson" "strget" "strindex" "strindexk" "strlen" "strlenk" "strlower" "strlowerk" "strrindex" "strrindexk" "strsub" "strsubk" "strtod" "strtodk" "strtol" "strtolk" "strupper" "strupperk" "subinstrinit" "sum" "svfilter" "syncgrain" "syncloop" "syncphasor" "system" "tab" "table" "table3" "tablei" "tableikt" "tablekt" "tableng" "tablera" "tablewa" "tablexkt" "tabmorph" "tabmorpha" "tabmorphak" "tabmorphi" "tabsum" "tabw" "tabw_i" "tambourine" "taninv2" "tbvcf" "tempest" "tempoval" "timedseq" "timeinstk" "timeinsts" "timek" "times" "tlineto" "tone" "tonek" "tonex" "tradsyn" "trandom" "transeg" "trcross" "trfilter" "trhighest" "trigger" "trirand" "trlowest" "trmix" "trscale" "trshift" "trsplit" "unirand" "upsamp" "vaget" "valpass" "vbap16" "vbap16move" "vbap4" "vbap4move" "vbap8" "vbap8move" "vco" "vco2" "vco2ft" "vco2ift" "vco2init" "vcomb" "vdelay" "vdelay3" "vdelayk" "vdelayx" "vdelayxq" "vdelayxs" "vdelayxw" "vdelayxwq" "vdelayxws" "vibes" "vibr" "vibrato" "vlowres" "voice" "vosim" "vpvoc" "vstinit" "waveset" "weibull" "wgbow" "wgbowedbar" "wgbrass" "wgclar" "wgflute" "wgpluck" "wgpluck2" "wguide1" "wguide2" "wiiconnect" "wiidata" "wiisend" "wrap" "wterrain" "xadsr" "xscanmap" "xscans" "xyin" "zamod" "zar" "zarg" "zfilter2" "zir" "zkmod" "zkr")))
(setq csound-regexp-general-opcodes (quote "\\<\\(0dbfs\\|=\\|ATS\\(add\\(\\|nz\\)\\|cross\\|in\\(fo\\|terpread\\)\\|partialtap\\|read\\(\\|nz\\)\\|sinnoi\\)\\|FL\\(b\\(ox\\|ut\\(Bank\\|ton\\)\\)\\|c\\(loseButton\\|ount\\)\\|execButton\\|getsnap\\|hvsBox\\|joy\\|k\\(eyIn\\|nob\\)\\|mouse\\|roller\\|s\\(etsnap\\|lid\\(BnkGetHandle\\|er\\)\\)\\|text\\|value\\|xyin\\)\\|Mixer\\(GetLevel\\|Receive\\)\\|OSC\\(init\\|listen\\)\\|a\\(ctive\\|ds\\(r\\|yn\\(\\|t2?\\)\\)\\|lpass\\|mpmidi\\|resonk?\\|tone\\(\\|[kx]\\)\\)\\|b\\(a\\(bo\\|lance\\|mboo\\|rmodel\\)\\|bcut[ms]\\|e\\(tarand\\|xprnd\\)\\|form\\(dec1?\\|enc1?\\)\\|i\\(nit\\|quada?\\)\\|qrez\\|u\\(t\\(b[pr]\\|hp\\|lp\\|t\\(er\\(b[pr]\\|hp\\|lp\\)\\|on\\)\\)\\|zz\\)\\)\\|c\\(a\\(basa\\|uchy\\)\\|h\\(an\\(ged\\|i\\)\\|e\\(byshevpoly\\|ckbox\\)\\|nget\\|uap\\)\\|l\\(filt\\|ip\\)\\|o\\(m\\(b\\|press\\)\\|n\\(trol\\|volve\\)\\)\\|ps\\(2pch\\|midib?\\|t\\(mid\\|uni?\\)\\|xpch\\)\\|r\\(oss2\\|unch\\)\\|userrnd\\)\\|d\\(a\\(m\\|tes?\\)\\|c\\(block2?\\|onv\\)\\|el\\(ay\\(\\|[1kr]\\)\\|tap\\(\\|[3inx]\\)\\)\\|i\\(ff\\|s\\(kgrain\\|tort1?\\)\\|vz\\)\\|ownsamp\\|ripwater\\|ssi\\(audio\\|init\\)\\|userrnd\\)\\|e\\(nvlpxr?\\|qfil\\|xp\\(curve\\|on\\|rand\\|seg\\(\\|[ar]\\)\\)\\)\\|f\\(ilter2\\|l\\(anger\\|ooper2?\\|uid\\(AllOut\\|Engine\\|Load\\|Out\\)\\)\\|m\\(b\\(3\\|ell\\)\\|metal\\|percfl\\|rhode\\|voice\\|wurlie\\)\\|o\\([fg]\\|f\\(2\\|ilter\\)\\|l\\(d\\|low2?\\)\\|scili?\\)\\|reeverb\\|t\\(conv\\|gen\\(\\|tmp\\)\\)\\)\\|g\\(a\\(in\\(\\|slider\\)\\|uss\\)\\|buzz\\|etcfg\\|ogobel\\|ra\\(in\\(\\|[23]\\)\\|nule\\)\\|uiro\\)\\|h\\(armon2?\\|ilbert\\|rtf\\(er\\|move2?\\|stat\\)\\|sboscil\\)\\|i\\(mage\\(create\\|getpixel\\|load\\|size\\)\\|n\\(s\\(global\\|remot\\)\\|te\\(g\\|rp\\)\\)\\)\\|j\\(itter2?\\|spline\\)\\|l\\(fo\\|i\\(mit\\|n\\(e\\(\\|nr?\\|to\\)\\|rand\\|segr?\\)\\)\\|o\\(cs\\(end\\|ig\\)\\|gcurve\\|opsegp?\\|r\\(enz\\|isplay\\)\\|scil\\(\\|[3x]\\)\\|w\\(pass2\\|resx?\\)\\)\\|p\\(f\\(18\\|reson\\)\\|hasor\\|oscil\\(\\|[3a]\\|sa2?\\)\\|re\\(ad\\|son\\)\\|sholdp?\\)\\)\\|m\\(a\\([cx]\\|ca\\|dsr\\|nd\\(el\\|ol\\)\\|rimba\\|x\\(_k\\|abs\\)\\)\\|etro\\|i\\(di\\(chn\\|tempo\\)\\|n\\(\\|abs\\)\\|rror\\)\\|o\\(de\\|og\\(\\|ladder\\|vcf2?\\)\\)\\|pulse\\|ultitap\\|xadsr\\)\\|n\\(estedap\\|lfilt\\|oise\\|reverb\\|trpol\\)\\|o\\(ctmidib?\\|sc\\(bnk\\|il\\(\\|[13ins]\\|1i\\|ikt\\(\\|[ps]\\)\\)\\)\\)\\|p\\(a\\(n2?\\|r\\(eq\\|ti\\(als\\|kkel\\(\\|sync\\)\\)\\)\\)\\|c\\(auchy\\|hmidib?\\|o\\(nvolve\\|unt\\)\\)\\|d\\(clip\\|halfy?\\)\\|eak\\|has\\(er[12]\\|or\\(\\|bnk\\)\\)\\|i\\(n\\(dex\\|kish\\)\\|tch\\(\\|amdf\\)\\)\\|l\\(anet\\|uck\\)\\|o\\([pw]\\|isson\\|lynomial\\|p_f\\|rtk?\\|scil3?\\|wershape\\)\\|r\\(epiano\\|intf_i\\|oduct\\)\\|track\\|v\\(add\\|cross\\|interp\\|oc\\|read\\|s\\(a\\(dsyn\\|nal\\|rp\\)\\|b\\(and[pr]\\|in\\|lur\\|uf\\(fer\\|read\\)\\)\\|c\\(ale\\|ent\\|ross\\)\\|demix\\|f\\(ilter\\|re\\(ad\\|eze\\)\\|tw\\)\\|hift\\|i\\(fd\\|n\\(\\|fo\\|it\\)\\)\\|m\\(aska\\|ix\\|o\\(oth\\|rph\\)\\)\\|osc\\|pitch\\|tencil\\|voc\\|ynth\\)\\)\\)\\|r\\(and\\(\\|[hi]\\|om\\(\\|[hi]\\)\\)\\|bjeq\\|e\\(adclock\\|lease\\|pluck\\|s\\(on\\(\\|[krxyz]\\|xk\\)\\|yn\\)\\|verb\\(\\|2\\|sc\\)\\|zzy\\)\\|ms\\|nd31\\|spline\\|tclock\\)\\|s\\(a\\(mphold\\|ndpaper\\)\\|ca\\(le\\|n\\(s\\|table\\)\\)\\|e\\(kere\\|nsekey\\|qtime2?\\)\\|f\\(instr\\(\\|[3m]\\|3m\\)\\|lo\\(ad\\|oper\\)\\|p\\(lay\\(\\|[3m]\\|3m\\)\\|reset\\)\\)\\|haker\\|insyn\\|leighbells\\|nd\\(loop\\|warp\\(\\|st\\)\\)\\|ockrecv\\|p\\(a\\(ce\\|t3di?\\)\\|dist\\|ec\\(addm\\|diff\\|filt\\|hist\\|ptrk\\|s\\(cal\\|um\\)\\|trum\\)\\|rintfk?\\|send\\)\\|t\\(atevar\\|ix\\|r\\(c\\(atk?\\|hark?\\|mpk?\\|pyk?\\)\\|eson\\|get\\|indexk?\\|l\\(enk?\\|owerk?\\)\\|rindexk?\\|subk?\\|to\\([dl]\\|dk\\|lk\\)\\|upperk?\\)\\)\\|u\\(binstrinit\\|m\\)\\|vfilter\\|y\\(nc\\(grain\\|loop\\|phasor\\)\\|stem\\)\\)\\|t\\(a\\(b\\(\\|le\\(\\|[3i]\\|ikt\\|kt\\|ng\\|ra\\|wa\\|xkt\\)\\|morph\\(\\|[ai]\\|ak\\)\\|sum\\|w\\(\\|_i\\)\\)\\|mbourine\\|ninv2\\)\\|bvcf\\|emp\\(est\\|oval\\)\\|ime\\([ks]\\|dseq\\|inst[ks]\\)\\|lineto\\|one\\(\\|[kx]\\)\\|r\\(a\\(dsyn\\|n\\(dom\\|seg\\)\\)\\|cross\\|filter\\|highest\\|i\\(gger\\|rand\\)\\|lowest\\|mix\\|s\\(cale\\|hift\\|plit\\)\\)\\)\\|u\\(nirand\\|psamp\\)\\|v\\(a\\(get\\|lpass\\)\\|bap\\([48]\\|16\\(\\|move\\)\\|4move\\|8move\\)\\|co\\(\\|2\\(\\|ft\\|i\\(ft\\|nit\\)\\)\\|mb\\)\\|delay\\(\\|[3kx]\\|x\\([qsw]\\|w[qs]\\)\\)\\|ib\\(es\\|r\\(\\|ato\\)\\)\\|lowres\\|o\\(ice\\|sim\\)\\|pvoc\\|stinit\\)\\|w\\(aveset\\|eibull\\|g\\(b\\(ow\\(\\|edbar\\)\\|rass\\)\\|clar\\|flute\\|pluck2?\\|uide[12]\\)\\|ii\\(connect\\|data\\|send\\)\\|rap\\|terrain\\)\\|x\\(adsr\\|scan\\(map\\|s\\)\\|yin\\)\\|z\\(a\\(mod\\|rg?\\)\\|filter2\\|ir\\|k\\(mod\\|r\\)\\)\\)\\>"))
(setq csdoc-irregular-opcodes (quote ("$NAME" "&&" ">" ">=" "<" "<=" "-" "0dbfs" "<<" ">>" "abetarand" "abexprnd" "acauchy" "aexprand" "agauss" "agogobel" "alinrand" "apcauchy" "apoisson" "apow" "atrirand" "aunirand" "aweibull" "clock" "convle" "elseif" "ephasor" "FLgroupEnd" "FLhvsBoxSetValue" "FLpack_end" "FLpanel_end" "FLscroll_end" "FLtabs_end" "hrtfer" "ibetarand" "ibexprnd" "icauchy" "ictrl14" "ictrl21" "ictrl7" "iexprand" "if" "igauss" "ilinrand" "imagesetpixel" "imidic14" "imidic21" "imidic7" "instimek" "instimes" "instr" "ioff" "ion" "iondur" "iondur2" "ioutat" "ioutc" "ioutc14" "ioutpat" "ioutpb" "ioutpc" "ipcauchy" "ipoisson" "ipow" "is16b14" "is32b14" "islider16" "islider32" "islider64" "islider8" "itablecopy" "itablegpw" "itablemix" "itablew" "itrirand" "iunirand" "iweibull" "kbetarand" "kbexprnd" "kcauchy" "kdump" "kdump2" "kdump3" "kdump4" "kexprand" "kfilter2" "kgauss" "klinrand" "kon" "koutat" "koutc" "koutc14" "koutpat" "koutpb" "koutpc" "kpcauchy" "kpoisson" "kpow" "kr" "kread" "kread2" "kread3" "kread4" "ksmps" "ktrirand" "kunirand" "kweibull" "midremot" "midglobal" "nchnls" "opcode" "oscilx" "peakk" "printf" "pvsdiskin" "pyassign Opcodes" "pycall Opcodes" "pyeval Opcodes" "pyexec Opcodes" "pyinit Opcodes" "pyrun Opcodes" "sense" "sr" "subinstr" "subinstrinit" "tb" "tab" "vstaudio, vstaudiog" "vstparamset,vstparamget")))
(setq csdoc-deprecated-opcodes (quote (("abetarand" "betarand") ("abexprnd" "bexprnd") ("acauchy" "cauchy") ("aexprand" "exprand") ("agauss" "gauss") ("agogobel" "gogobel") ("alinrand" "linrand") ("apcauchy" "pcauchy") ("apoisson" "poisson") ("apow" "pow") ("atrirand" "trirand") ("aunirand" "unirand") ("aweibull" "weibull") ("bformenc" "bformenc1") ("bformdec" "bformdec1") ("butbp" "butterbp") ("butbr" "butterbr") ("buthp" "butterhp") ("butlp" "butterlp") ("clock" "rtclock") ("convle" "convolve") ("diskin" "GEN01") ("FLupdate" "FLrun") ("ibetarand" "betarand") ("ibexprnd" "bexprnd") ("icauchy" "cauchy") ("ictrl14" "ctrl14") ("ictrl21" "ctrl21") ("ictrl7" "ctrl7") ("iexprand" "exprand") ("igauss" "gauss") ("ilinrand" "linrand") ("imidic14" "midic14") ("imidic21" "midic21") ("imidic7" "midic7") ("instimek" "timeinstk") ("instimes" "timeinsts") ("ioff" "noteoff") ("ion" "noteon") ("iondur" "noteondur") ("iondur2" "noteondur2") ("ioutat" "outiat") ("ioutc" "outic") ("ioutc14" "outic14") ("ioutpat" "outipat") ("ioutpb" "outipb") ("ioutpc" "outipc") ("ipcauchy" "pcauchy") ("ipoisson" "poisson") ("ipow" "pow") ("is16b14" "s16b14") ("is32b14" "s32b14") ("islider16" "slider16") ("islider32" "slider32") ("islider64" "slider64") ("islider8" "slider8") ("itablecopy" "tableicopy") ("itablegpw" "tableigpw") ("itablemix" "tableimix") ("itablew" "tableiw") ("itrirand" "trirand") ("iunirand" "unirand") ("iweibull" "weibull") ("kbetarand" "betarand") ("kbexprnd" "bexprnd") ("kcauchy" "cauchy") ("kdump" "dumpk") ("kdump2" "dumpk2") ("kdump3" "dumpk3") ("kdump4" "dumpk4") ("kexprand" "exprand") ("kfilter2" "filter2") ("kgauss" "gauss") ("klinrand" "linrand") ("kon" "midion") ("koutat" "outkat") ("koutc" "outkc") ("koutc14" "outkc14") ("koutpat" "outkpat") ("koutpb" "outkpb") ("koutpc" "outkpc") ("kpcauchy" "pcauchy") ("kpoisson" "poisson") ("kpow" "pow") ("kread" "readk") ("kread2" "readk2") ("kread3" "readk3") ("kread4" "readk4") ("ktableseg" "tableseg") ("ktrirand" "trirand") ("kunirand" "unirand") ("kweibull" "weibull") ("oscilx" "osciln") ("peakk" "peak") ("reverb2" "nreverb") ("sense" "sensekey") ("soundout" "fout") ("soundouts" "fout"))))
(provide (quote csound-opcode-typology))