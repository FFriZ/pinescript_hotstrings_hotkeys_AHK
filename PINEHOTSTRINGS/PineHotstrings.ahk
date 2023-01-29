;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                 :
;     hotstrings and hotkeys                      ;
;     FFrizz | frizlabz                           ;
;     Language: AHK                               ;
;     Uses: PineScript                            ;
;                                                 ;
;   - hotstrings                                  ; 
;   to be used with pinescript					  ;										
;   hotstring unlike hotkeys are sequences of	  ;														
;   keys that are pressed in order to trigger	  ;														
;   a hotstring. hotstrings are not limited to	  ;														
;   a single key press. hotstrings are used		  ;													
;   to insert text into the current window.		  ;													
;                                                 ;
;   when the sequence is completed it will		  ;													
;   remove the sequence and insert the text		  ;													
;   editor into the current window.				  ;											
;												  ;
;   in the code hotstrings are denoted by		  ;													
;   the *: prefix. hotstrings are triggered		  ;													
;   by the :: suffix. the text to be inserted	  ;														
;   is denoted by the .... suffix. the text		  ;													
;   to be inserted is the text between the		  ;													
;   .... suffix and the :: suffix.				  ;											
;												  ; 												
;   - hotkeys								  	  ;																
;   are not denoted by a :: or :*:				  ;											
;   they only have the suffix, ::				  ;											
;   and are triggered when the specified		  ;													
;   hotkey is pressed. hotkeys are used			  ;												
;   to trigger a script or a function			  ;												
;   in the script.								  ;							
;                                                 ;
;   for example in this script the left alt		  ;													
;   and the j,k,l,i keys are used to move		  ;													
;   the cursor left, down, right, and up		  ;													
;                                                 ;
;   or                                            ;
;                                                 ;
;   the left alt and space is a backspace		  ;													
;                                                 ;
; you can type a built in prefix followed by	  ;														
; help.. to have a pop up show you the options	  ;														
; for that prefix or type help.help.. to see	  ;														
; 	options for avalible prefixes.				  ;											
;                                                 ;
; once you have compiled it you should be able    ;
; to start using it.. you can also add it to	  ;
; the start up directory and you wont have to	  ;
; ever mess with it	                              ;							
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#SingleInstance, Force
#InstallKeybdHook
#NoEnv
CoordMode, Screen

;|    !{Alt}     |     +{Shift}    |    #{Win}    |    ^{Ctrl}   |
;|	< or L {LButton} |     > or R {RButton}  |   

;------------------- HotKeys ---------------------
; Win Shift Enter [Debug Key Console]
#e::listhotkeys

	
; if the keys seem stuck happens(rarly) reset keys
:*:reset....::
	send {shift up}{ctrl up}{alt up}{win up}
return
		
; LALT jlki [Move Cursor]		
; Left
<!j::
	sendinput, {left}
return
<+<!j::
	sendinput, {shift down}{ctrl down}{left}{shift up}{ctrl up}
return
<+<!<^j::
	sendinput, {shift down}{left}{shift up}
return

; Right
<!l::
	sendinput, {right}
return
<+<!l::
	sendinput, {shift down}{ctrl down}{right}{shift up}{ctrl up}
return
<+<!<^l::
	sendinput, {shift down}{right}{shift up}
return

; Down
<!k::
	sendinput, {down}
return
<+<!k::
	sendinput, {shift down}{down}{shift up}
return
<^<!k::
	sendinput, {shift down}{alt down}{down}{shift up}{alt up}
return
<+<!<^k::
	sendinput, {alt down}{ctrl down}{down}{alt up}{ctrl up}
return

; Up
<!i::
	sendinput, {up}
return
<+<!i::
	sendinput, {shift down}{up}{shift up}
return
<^<!i::
	sendinput, {shift down}{alt down}{up}{shift up}{alt up}
return
<+<!<^i::
	sendinput, {alt down}{ctrl down}{up}{alt up}{ctrl up}
return




; Auto Numbers
; Numbers
LCtrl & Numpad0::
	Send {space}{ctrl down}{backspace}{ctrl up}{0}{down}
return

LCtrl & Numpad1::
	Send {space}{ctrl down}{backspace}{ctrl up}{1}{down}
return

LCtrl & Numpad2::
	Send {space}{ctrl down}{backspace}{ctrl up}{2}{down}
return

LCtrl & Numpad3::
	Send {space}{ctrl down}{backspace}{ctrl up}{3}{down}
return

LCtrl & Numpad4::
	Send {space}{ctrl down}{backspace}{ctrl up}{4}{down}
return

LCtrl & Numpad5::
	Send {space}{ctrl down}{backspace}{ctrl up}{5}{down}
return

LCtrl & Numpad6::
	Send {space}{ctrl down}{backspace}{ctrl up}{6}{down}
return

LCtrl & Numpad7::
	Send {space}{ctrl down}{backspace}{ctrl up}{7}{down}
return

LCtrl & Numpad8::
	Send {space}{ctrl down}{backspace}{ctrl up}{8}{down}
return

LCtrl & Numpad9::
	Send {space}{ctrl down}{backspace}{ctrl up}{9}{down}
return
	


; next error
!n::
	send {Alt Down}{F8}{Alt Up}
return
; previous error
!+n::
	send {Alt Down}{Shift Down}{F8}{Alt Up}{Shift Up}
Return


; [brackets and indents]
;left paraentheses
<!h::Send {(}
;left bracket
<!u::Send {[}
;left curly bracket
<!y::Send {{}

;right paraentheses
<!<+h::Send {)}
;right bracket
<!<+u::Send {]}
;right curly bracket
<!<+y::Send {}}

;undent 
<^n::Send ^{[}
;indent
<^'::Send ^{]}


; Win f start debuging
#f::
	Send {Ctrl}{F5}
return

; Fold regions
:*:foldr...::{ctrl down}{k}{-}{ctrl up}
:*:fold...::{ctrl down}{k}{0}{ctrl up}
:*:fold1...::{ctrl down}{k}{1}{ctrl up}
:*:fold2...::{ctrl down}{k}{2}{ctrl up}
:*:fold3...::{ctrl down}{k}{3}{ctrl up}
:*:fold4...::{ctrl down}{k}{4}{ctrl up}
:*:fold5...::{ctrl down}{k}{5}{ctrl up}
:*:fold6...::{ctrl down}{k}{6}{ctrl up}
:*:fold7...::{ctrl down}{k}{7}{ctrl up}
:*:foldall...::{ctrl down}{k}{8}{ctrl up}
:*:unfold...::{ctrl down}{k}{j}{ctrl up}


!+u::
	send {ctrl down}{shift down}]{ctrl up}{shift up}
return
!+f::
	send {ctrl down}{shift down}[{ctrl up}{shift up}
return


;-------------------- Hotstrings ------------------

:*:help.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Arrays] = array.help..
[Matrixs] = matrix.help..

[Box Functions] = box.help..
[Line Functions] = line.help..
[Label Functions] = label.help..
[Table Functions] = table.help..
[LineFill Function] = linefill.help..

[Strategy Functions and Series] = strategy.help..
[For Loop] = for.help..
[Text] = text.help..
[Strings] = str.help..
[Syminfo] = syminfo.help..
[Input Functions] = input.help..
[Color Functions] = color.help..
[Barstate] = bar.help..
[TimeFrames] = tf.help..
[Var & ids] = var.help..
[xy loc] = xyloc.help..
[Misc] = misc.help..
[Position] = position.help..
)
return

:*:array.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Array Functions]
[a.nlf..][va.linef..][a.linef..] = array.new<linefill()
[a.ni..][va.int..][a.int..] = array.new<int>()
[a.nf..][va.float..][a.float..] = array.new<float>()
[a.nbool[va.bool..][a.bool..] = array.new<bool>()
[a.nl..][va.line..][a.line..] = array.new<line>()
[a.nb..][va.box..][a.box..] = array.new<box>()
[a.nt..][va.table..][a.table..] = array.new<table>()
[a.nlbl..][va.label..][a.label..] = array.new<label>()
[a.nc..][va.color..][a.color..] = array.new<color>()
[a.ns..][va.string[a.string..] = array.new<string>()

[a.avg..] = array.avg()
[a.bis..] = array.binary_search()
[a.bisl..] = array.binary_search_leftmost()
[a.bisr..] = array.binary_search_rightmost()
[a.clear..] = array.clear()
[a.concat..] = array.concat()
[a.copy..] = array.copy()
[a.covar..] = array.covariance()
[a.fill..] = array.fill()
[a.from..] = array.from()
[a.get..] = array.get()
[a.includes..] = array.includes()
[a.indexof..] = array.indexof()
[a.insert..] = array.insert()
[a.join..] = array.join()
[a.liof..] = array.lastindexof()
[a.max..] = array.max()
[a.median..] = array.median()
[a.min..] = array.min()
[a.mode..] = array.mode()
[a.pr..] = array.percentrank()
[a.pnr..] = array.percentile_nearest_rank()
[a.pli..] = array.percentile_linear_interpolation()
[a.pop..] = array.pop()
[a.push..] = array.push()
[a.range..] = array.range()
[a.remove..] = array.remove()
[a.reverse..] = array.reverse()
[a.set..] = array.set()
[a.shift..] = array.shift()
[a.size..] = array.size()
[a.slice..] = array.slice()
[a.sort..] = array.sort()
[a.sorti..] = array.sort_indices()
[a.stand..] = array.standardize()
[a.std..] = array.stdev()
[a.sum..] = array.sum()
[a.unshift..] = array.unshift()
[a.var..] = array.variance()
)
return

:*:matrix.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Matrix Functions]
[m.nlf..] [vm.linef..] [m.linef..] = matrix.new<linefill>()
[m.ni..] [vm.int..] [m.int..] = matrix.new<int>()
[m.nf..] [vm.float..] [m.float..] = matrix.new<float>()
[m.nbool [vm.bool..] [m.bool..] = matrix.new<bool>()
[m.nl..] [vm.line..] [m.line..] = matrix.new<line>()
[m.nb..] [vm.box..] [m.box..] = matrix.new<box>()
[m.nt..] [vm.table..] [m.table..] = matrix.new<table>()
[m.nlbl..] [vm.label..] [m.label..] = matrix.new<label>()
[m.nc..] [vm.color..] [m.color..] = matrix.new<color>()
[m.ns..] [vm.string [m.string..] = matrix.new<string>()

[m.acol..] = matrix.add_col()
[m.arow..] = matrix.add_row()
[m.avg..] = matrix.avg()
[m.col..] = matrix.col()
[m.cols..] = matrix.columns()
[m.concat..] = matrix.concat()
[m.copy..] = matrix.copy()
[m.det..] = matrix.det()
[m.diff..] = matrix.diff()
[m.evals..] = matrix.eigenvalues()
[m.evecs..] = matrix.eigenvectors()
[m.isadiag..] = matrix.is_antidiagonal()
[m.ecount..] = matrix.elements_count()
[m.fill..] = matrix.fill()
[m.get..] = matrix.get()
[m.inv..] = matrix.inv()
[m.iasym..] = matrix.is_antisymmetric()
[m.ibinary = matrix.is_binary()
[m.diag..] = matrix.is_diagonal()
[m.iid..] = matrix.is_identity()
[m.isquare..] = matrix.is_square()
[m.istoch..] = matrix.is_stochastic()
[m.isym..] = matrix.is_symmetric()
[m.itri..] = matrix.is_triangular()
[m.izero..] = matrix.is_zero()
[m.kron..] = matrix.kron()
[m.max..] = matrix.max()
[m.median..] = matrix.median()
[m.min..] = matrix.min()
[m.mode..] = matrix.mode()
[m.mult..] = matrix.mult()
[m.pinv..] = matrix.pinv()
[m.pow..] = matrix.pow()
[m.rank..] = matrix.rank()
[m.reshape..] = matrix.reshape()
[m.rcol..] = matrix.remove_col()
[m.rrow..] = matrix.remove_row()
[m.reverse..] = matrix.reverse()
[m.row..] = matrix.row()
[m.rows..] = matrix.rows()
[m.set..] = matrix.set()
[m.sort..] = matrix.sort()
[m.submatrix..] = matrix.submatrix()
[m.sum..] = matrix.sum()
[m.scols..] = matrix.swap_columns()
[m.srows..] = matrix.swap_rows()
[m.trace..] = matrix.trace()
[m.trans..] = matrix.transpose()
[m.rif..] = if matrix.rows() > 0
[m.cif..] = if matrix.cols() > 0
)
return

:*:box.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Box Functions]
[v.bnew..] = var box Box = box.new()
[b.sex..] = box.set_extend()
[b.del..] = box.delete()
[b.copy..] = box.copy()
[b.gbottom..] = box.get_bottom()
[b.gleft..] = box.get_left()
[b.gright..] = box.get_right()
[b.gtop..] = box.get_top()
[b.new..] = box Box = box.new()
[b.sc..] = box.set_bgcolor()
[b.sbc..] = box.set_border_color()
[b.sbs..] = box.set_border_style()
[b.sbw..] = box.set_border_width()
[b.st..] = box.set_text()
[b.stc..] = box.set_text_color()
[b.sth..] = box.set_text_halign()
[b.sts..] = box.set_text_size()
[b.stv..] = box.set_text_valign()
[b.stw..] = box.set_text_wrap()
[b.stop..] = box.set_top()
[b.srb..] = box.set_rightbottom()
[b.sl..] = box.set_left()
[b.sbot..] = box.set_bottom()
[b.sr..] = box.set_right()
[b.slt..] = box.set_lefttop()
)
return

:*:line.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Line Functions]
[l.new..] = line.new()
[l.copy..] = line.copy()
[l.del..] = line.delete()
[l.gp..] = line.get_price()
[l.gx1..] = line.get_x1()
[l.gx2..] = line.get_x2()
[l.gy1..] = line.get_y1()
[l.gy2..] = line.get_y2()
[l.sc..] = line.set_color()
[l.se..] = line.set_extend()
[l.ss..] = line.set_style()
[l.sw..] = line.set_width()
[l.sx1..] = line.set_x1()
[l.sx2..] = line.set_x2()
[l.sxloc..] = line.set_xloc()
[l.sxy1..] = line.set_xy1()
[l.sxy2..] = line.set_xy2()
[l.sy1..] = line.set_y1()
[l.sy2..] = line.set_y2()
)
return

:*:str.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[String Functions]
[s.con..] = str.contains()
[s.ewith..] = str.endswith()
[s.for..] = str.format()
[s.len..] = str.length()
[s.lower..] = str.lower()
[s.match..] = str.match()
[s.pos..] = str.pos()
[s.r..] = str.replace()
[s.rall..] = str.replace_all()
[s.split..] = str.split()
[s.swith..] = str.startswith()
[s.sstr..] = str.substring()
[s.upper..] = str.upper()

[s.tnumber..] = str.tonumber()
[s.tn..]

[s.tstring..] = str.tostring()
[s.ts..]
)
return

:*:linefill.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[LineFill Function]
[lf.del..] = linefill.delete()
[lf.gl1..] = linefill.get_line1()
[lf.gl2..] = linefill.get_line2()
[lf.new..] = linefill.new()
[lf.sc..] = linefill.set_color()
)
return

:*:label.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Label Functions]
[vlb.new..] = var label lbl = label.new()
[lb.new..] = label lbl = label.new()
[lb.copy..] = label.copy()
[lb.del..] = label.delete()
[lb.gt..] = label.get_text()
[lb.gx..] = label.get_x()
[lb.gy..] = label.get_y()
[lb.sc..] = label.set_color()
[lb.ssize..] = label.set_size()
[lb.ss..] = label.set_style()
[lb.st..] = label.set_text()
[lb.sta..] = label.set_textalign()
[lb.stc..] = label.set_textcolor()
[lb.stt..] = label.set_tooltip()
[lb.sx..] = label.set_x()
[lb.sxloc..] = label.set_xloc()
[lb.sxy..] = label.set_xy()
[lb.sy..] = label.set_y()
[lb.syloc..] = label.set_yloc()

[Styles]
[lb.adown..] = label.style_arrowdown
[lb.aup..] = label.style_arrowup
[lb.circle..] = label.style_circle
[lb.cross..] = label.style_cross
[lb.diamond..] = label.style_diamond
[lb.flag..] = label.style_flag
[lb.center..] = label.style_label_center
[lb.down..] = label.style_label_down
[lb.left..] = label.style_label_left
[lb.left..] = label.style_label_lower_left
[lb.right..] = label.style_label_lower_right
[lb.right..] = label.style_label_right
[lb.up..] = label.style_label_up
[lb.left..] = label.style_label_upper_left
[lb.right..] = label.style_label_upper_right
[lb.none..] = label.style_none
[lb.square..] = label.style_square
[lb.tdown..] = label.style_triangledown
[lb.tup..] = label.style_triangleup
[lb.xcross..] = label.style_xcross
)"
return

:*:table.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Table Functions]
[tc.new..] = table Tbl = table.new(
--- position, columns = $,rows = $,color.new(),
--- color.new(), frame_width ,
--- color.new(), border_width)

[vtc.lnew..] = var table Tbl = table.new(
--- position, columns = $,rows = $,color.new(),
--- color.new(), frame_width ,
--- color.new(), border_width)

[t.cell..] = table.cell()
[t.csbgc..] = table.cell_set_bgcolor()
[t.csh..] = table.cell_set_height()
[t.cst..] = table.cell_set_text()
[t.cstc..] = table.cell_set_text_color()
[t.csth..] = table.cell_set_text_halign()
[t.csts..] = table.cell_set_text_size()
[t.cstv..] = table.cell_set_text_valign()
[t.cst..] = table.cell_set_tooltip()
[t.csw..] = table.cell_set_width()
[t.clear..] = table.clear()
[t.del..] = table.delete()
[t.mc..] = table.merge_cells()
[t.sbgc..] = table.set_bgcolor()
[t.sbc..] = table.set_border_color()
[t.sbw..] = table.set_border_width()
[t.sfc..] = table.set_frame_color()
[t.sfw..] = table.set_frame_width()
[t.sp..] = table.set_position()
)
return

:*:input.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Input Functions]
[i.bool..] = input.bool(true,'')
[i.color..] = input.color(color.white,'')
[i.float..] = input.float(0.0,'')
[i.int..] = input.int(0,'')
[i.price..] = input.price(0,'')
[i.session..] = input.session('','')
[i.source..] = input.source(close,'')
[i.string..] = input.string('','')
[i.symbol..] = input.symbol('','')
[i.text..] = input.text_area('','')
[i.time..] = input.time('')
[i.tf..] = input.timeframe('240','')
)
return

:*:color.help..::
Msgbox,16416,"Color Hotstrings",
(
[Colors]

indianred 	plum 	darkgreen 	darkblue	lightcoral 	violet 	yellowgreen 	navy
salmon 	orchid 	olivedrab 	midnightblue	darksalmon 	fuchsia 	olive 	wheat
lightsalmo 	magenta 	darkolivegreen 	tan	crimson 	mediumorchid 	mediumaquamar 	rosybrown
red 	mediumpurple 	darkseagreen 	sandybrown	firebrick 	blueviolet 	lightseagreen 	goldenrod
darkred 	darkviolet 	darkcyan 	darkgoldenrod	pink 	darkorchid 	teal 	peru
lightpink 	darkmagenta 	aqua 	chocolate	hotpink 	purple 	 cyan 	 saddlebrown
deeppink 	indigo 	lightcyan 	brown	coral 	slateblue 	aquamarine 	maroon	tomato 	darkslateblue
turquoise 	white	orangered 	mediumslateblue 	mediumturquoise 	ghostwhite	darkorange
greenyellow darkturquoise 	whitesmoke 	orange 	lawngreen 	cadetblue 	beige	gold 	lime
steelblue 	floralwhite yellow 	limegreen 	lightsteelblue 	ivory	lightyellow 	palegreen
lightblue 	lavenderblush 	moccasin 	lightgreen 	skyblue 	silver	peachpuff 	mediumspringgreen
deepskyblue 	gray	palegoldenrod 	springgreen 	dodgerblue 	dimgray	khaki 	mediumseagreen
mediumslateblue 	lightslategray	darkkhaki 	seagreen 	royalblue 	slategray	lavender
forestgreen 	blue 	darkslategray	thistle 	green 	mediumblue 	black

[c.random_..] = randomc(trasp = 0) =>
color.rgb(math.random(0, 255), math.random(0, 255), math.random(0, 255),transp)

[c.random..] = randomc(0)
)
return

:*:text.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Text Positions/Size]
[t.abottom..] = text.align_bottom
[t.acenter..] = text.align_center
[t.aleft..] = text.align_left
[t.aright..] = text.align_right
[t.atop..] = text.align_top
[t.wauto..] = text.wrap_auto
[t.wnone..] = text.wrap_none
[auto..] = size.auto
[huge..] = size.huge
[large..] = size.large
[normal..] = size.normal
[small..] = size.small
[tiny..] = size.tiny
)
return

:*:syminfo.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Syminfo Constants]
[sym.bcurrency..] = syminfo.basecurrency
[sym.currency..] = syminfo.currency
[sym.desc..] = syminfo.description
[sym.mtick..] = syminfo.mintick
[sym.pvalue..] = syminfo.pointvalue
[sym.pfix..] = syminfo.prefix
[sym.root..] = syminfo.root
[sym.session..] = syminfo.session
[sym.ticker..] = syminfo.ticker
[sym.tid..] = syminfo.tickerid
[sym.tzone..] = syminfo.timezone
[sym.type..] = syminfo.type
[sym.vtype..] = syminfo.volumetype
)
return

:*:bar.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Barstate and Request.security]
[Functions]
[(i)bs.il..] = (if) barstate.islast
[(i)bs.in..] = (if) barstate.isnew
[(i)bs.if..] = (if) barstate.isfirst
[(i)bs.ic..] = (if) barstate.isconfirmed
[(i)bs.ich..] = (if) barstate.confirmedhistory
[(i)bs.irt..] = (if) barstate.realtime

[r.s..] 	= request.security()
[r.sltf..] = request.security_lower_tf()
[rt.e..] = runtime.error()
[rt.es..] = switch
=> runtime.error()
)
return

:*:for.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[For Loops and Functions]

[mrfor..]
if matrix.rows(m) > 0
	--- for i = 0 to matrix.rows(m) - 1

[mcfor..]
if matrix.columns(m) > 0
	--- for i = 0 to matrix.columns(m) - 1

[afor..]
if array.size(a) > 0
	--- for i = 0 to array.size(a) - 1

[for..]
	--- for i = 0 to

[fun..]
= _() =>
output =
output

[funt..]
_() =>
a = , b=
[a,b]
)
return

:*:tf.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[TimeFrames Functions]
[tf.isd..] = timeframe.isdaily
[tf.isdwm..] = timeframe.isdwm
[tf.isint..] = timeframe.isintraday
[tf.ismin..] = timeframe.isminutes
[tf.ismon..] = timeframe.ismonthly
[tf.issec..] = timeframe.isseconds
[tf.isweek..] = timeframe.isweekly
[tf.multi..] = timeframe.multiplier
[tf.period..] = timeframe.period
[tf.insec..] = timeframe.isseconds
)
return

:*:var.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Var Misc]
[int..] = int * = na
[float..] = float * = na
[bool..] = bool * = na
[line..] = line * = na
[box..] = box * = na
[table..] = table * = na
[label..] = label * = na
[color..] = color * = na
[vint..] = var int * = na
[vfloat..] = var float * = na
[vbool..] = var bool * = na
[vline..] = var line * = na
[vbox..] = var box * = na
[vtable..] = var table * = na
[vlabel..] = var label * = na
[vcolor..] = var color * = na
)
return

:*:xyloc.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[xy loc Constants]
[xl.bi..] = xloc.bar_index
[xl.bt..] = xloc.bar_time
[yl.ab..] = yloc.abovebar
[yl.bb..] = yloc.belowbar
[yl.p..] = yloc.price
)
return

:*:misc.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Misc Functions]
[htfdata..] = [o,h,l,c,vol,otime,ctime] = request.security(syminfo.tickerid, tf,
[open, high, low, close, volume, time, time_close])

[indicator..] = indicator('[FrizLabz]','[FrizLabz]',true,max_lines_count = 500,max_boxes_count = 500,max_labels_count = 500,explicit_plot_zorder = true)
)
return

:*:strategy.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Strategy Functions]
[s.entry..] = strategy.entry()
[s.exit..] = strategy.exit()
[s.order..] = strategy.order()
[s.cancel..] = strategy.cancel()
[s.cancelall..] = strategy.cancel_all()
[s.close..] = strategy.close()
[s.closeall..] = strategy.close_all()
[s.ct.comm..] = strategy.closedtrades.commission()
[s.ct.ebindex..] = strategy.closedtrades.entry_bar_index()
[s.ct.size..] = strategy.closedtrades.size()
[s.ct.eid..] = strategy.closedtrades.entry_id()
[s.ct.eprice..] = strategy.closedtrades.entry_price()
[s.ct.etime..] = strategy.closedtrades.entry_time()
[s.ct.ebindex..] = strategy.closedtrades.exit_bar_index()
[s.ct.eid..] = strategy.closedtrades.exit_id()
[s.ct.eprice..] = strategy.closedtrades.exit_price()
[s.ct.ettime..] = strategy.closedtrades.exit_time()
[s.ct.mddown..] = strategy.closedtrades.max_drawdown()
[s.ct.mrunup..] = strategy.closedtrades.max_runup()
[s.ct.profit..] = strategy.closedtrades.profit()
[s.ot.comm..] = strategy.opentrades.commission()
[s.ot.ebindex..] = strategy.opentrades.entry_bar_index()
[s.ot.eid..] = strategy.opentrades.entry_id()
[s.ot.eprice..] = strategy.opentrades.entry_price()
[s.ot.etime..] = strategy.opentrades.entry_time()
[s.ot.mddown..] = strategy.opentrades.max_drawdown()
[s.ot.mrup..] = strategy.opentrades.max_runup()
[s.ot.profit..] = strategy.opentrades.profit()
[s.ot.size..] = strategy.opentrades.size()
[s.r.aein..] = strategy.risk.allow_entry_in()
[s.r.mcldays..] = strategy.risk.max_cons_loss_days()
[s.r.mddown..] = strategy.risk.max_drawdown()
[s.r.miforders..] = strategy.risk.max_intraday_filled_orders()
[s.r.miloss..] = strategy.risk.max_intraday_loss()
[s.r.mpsize..] = strategy.risk.max_position_size()
[s.ctaccount..] = strategy.convert_to_account()
[s.ctsymbol..] = strategy.convert_to_symbol()

##############################################################

[s.acurrency..] = strategy.account_currency
[s.cash..] = strategy.cash
[s.ctrades..] = strategy.closedtrades
[s.ccpcontract..] = strategy.commission.cash_per_contract
[s.ccporder..] = strategy.commission.cash_per_order
[s.cpercent..] = strategy.commission.percent
[s.dall..] = strategy.direction.all
[s.dlong..] = strategy.direction.long
[s.dshort..] = strategy.direction.short
[s.equity..] = strategy.equity
[s.etrades..] = strategy.eventrades
[s.fixed..] = strategy.fixed
[s.gloss..] = strategy.grossloss
[s.gprofit..] = strategy.grossprofit
[s.iccapital..] = strategy.initial_capital
[s.long..] = strategy.long
[s.ltrades..] = strategy.losstrades
[s.mchall..] = strategy.max_contracts_held_all
[s.mchlong..] = strategy.max_contracts_held_long
[s.mchshort..] = strategy.max_contracts_held_short
[s.mddown..] = strategy.max_drawdown
[s.mrup..] = strategy.max_runup
[s.netprofit..] = strategy.netprofit
[s.oca.cancel..] = strategy.oca.cancel
[s.oca.none..] = strategy.oca.none
[s.oca.reduce..] = strategy.oca.reduce
[s.oprofit..] = strategy.openprofit
[s.otrades..] = strategy.opentrades
[s.poequity..] = strategy.percent_of_equity
[s.paprice..] = strategy.position_avg_price
[s.pename..] = strategy.position_entry_name
[s.psize..] = strategy.position_size
[s.wtrades..] = strategy.wintrades
[s.short..] = strategy.short
)
return

:*:positon.help..::
Msgbox,16416,"Pinescript Hotstrings Help",
(
[Position]
[p.bc..] = position.bottom_center
[p.bl..] = position.bottom_left
[p.br..] = position.bottom_right
[p.mc..] = position.middle_center
[p.ml..] = position.middle_left
[p.mr..] = position.middle_right
[p.tc..] = position.top_center
[p.tl..] = position.top_left
[p.tr..] = position.top_right
[p.bcenter..] = position.bottom_center
[p.bleft..]	 = position.bottom_left
[p.bright..] = position.bottom_right
[p.mcenter..] = position.middle_center
[p.mleft..]	 = position.middle_left
[p.mright..] = position.middle_right
[p.tcenter..] = position.top_center
[p.tleft..]	 = position.top_left
[p.tright..] = position.top_right
)
return

; obj hotstrings

:*:box.new.bar..::@{left}box{.}new{(}bar_index{,} high{,} last_bar_index{,} low{,} xloc{.}bar_index{,} color{.}new{(}{#}000000{,} 50{)}{,} 1{,} line{.}style_solid{,} extend{.}none{,} color{.}new{(}{#}000000{,} 50{)}{)}{right}{backspace}
:*:box.new.time..::@{left}box{.}new{(}time{,} high{,} last_bar_time{,} low{,} xloc{.}bar_time{,} color{.}new{(}{#}000000{,} 50{)}{,} 1{,} line{.}style_solid{,} extend{.}none {,} color{.}new{(}{#}000000{,} 50{)}{)}{right}{backspace}
:*:line.new.bar.h..::@{left}line{.}new{(}bar_index{,} high{,} last_bar_index{,} high{,} xloc{.}bar_index{,} extend{.}none{,} color{.}new{(}{#}000000{,} 50{)}{,} line{.}style_solid{,} 1{)}{right}{backspace}
:*:line.new.bar.h..::@{left}line{.}new{(}bar_index{,} low{,} last_bar_index{,} low{,} xloc{.}bar_index{,} extend{.}none{,} color{.}new{(}{#}000000{,} 50{)}{,} line{.}style_solid{,} 1{)}{right}{backspace}
:*:line.new.bar..::@{left}line{.}new{(}bar_index{,} close{,} last_bar_index{,} close{,} xloc{.}bar_index{,} extend{.}none{,} color{.}new{(}{#}000000{,} 50{)}{,} line{.}style_solid{,} 1{)}{right}{backspace}
:*:line.new.time..::@{left}line{.}new{(}time{,} close{,} last_bar_time{,} close{,} xloc{.}bar_time{,} extend{.}none{,} color{.}new{(}{#}000000{,} 50{)}{,} line{.}style_solid{,} 1{)}{right}{backspace}
:*:line.new.time.h..::@{left}line{.}new{(}time{,} high{,} last_bar_time{,} high{,} xloc{.}bar_time{,} extend{.}none{,} color{.}new{(}{#}000000{,} 50{)}{,} line{.}style_solid{,} 1{)}{right}{backspace}
:*:line.new.time.l..::@{left}line{.}new{(}time{,} low{,} last_bar_time{,} low{,} xloc{.}bar_time{,} extend{.}none{,} color{.}new{(}{#}000000{,} 50{)}{,} line{.}style_solid{,} 1{)}{right}{backspace}
:*:label.new.bar..::@{left}label{.}new{(}bar_index{,} high{,} ''{,} xloc{.}bar_index{,} yloc{.}price{,} color{.}new{(}{#}000000{,} 0{)}{,} label{.}style_label_down{,} color{.}new{(}{#}00ff00{,} 0{)}{,} size{.}normal{)}{right}{backspace}
:*:label.new.time..::@{left}label{.}new{(}bar_index{,} low{,} ''{,} xloc{.}bar_time{,} yloc{.}price{,} color{.}new{(}{#}000000{,} 0{)}{,} label{.}style_label_up{,} color{.}new{(}{#}00ff00{,} 0{)}{,} size{.}normal{)}{right}{backspace}


;--------------------- MATRIXs --------------------
	;	Matrix.new
:*:m.nf..::#{left}matrix.new<float>(){backspace}{left}
:*:m.ni..::#{left}matrix.new<int>(){backspace}{left}
:*:m.nbool..::#{left}matrix.new<bool>(){backspace}{left}
:*:m.nl..::#{left}matrix.new<line>(){backspace}{left}
:*:m.nb..::#{left}matrix.new<box>(){backspace}{left}
:*:m.nlbl..::#{left}matrix.new<label>(){backspace}{left}
:*:m.nlf..::#{left}matrix.new<linefill>(){backspace}{left}
:*:m.nc..::#{left}matrix.new<color>(){backspace}{left}
:*:m.ns..::#{left}matrix.new<string>(){backspace}{left}
:*:m.nt..::#{left}matrix.new<table>(){backspace}{left}
	
; new Matrix
:*:m.nlinef..::#{left}matrix.new<linefill>(){backspace}{left}
:*:m.nint..::#{left}matrix.new<int>(){backspace}{left}
:*:m.nfloat..::#{left}matrix.new<float>(){backspace}{left}
:*:m.nbool..::#{left}matrix.new<bool>(){backspace}{left}
:*:m.nline..::#{left}matrix.new<line>(){backspace}{left}
:*:m.nbox..::#{left}matrix.new<box>(){backspace}{left}
:*:m.nlabel..::#{left}matrix.new<label>(){backspace}{left}
:*:m.nstring..::#{left}matrix.new<string>(){backspace}{left}
:*:m.ntable..::#{left}matrix.new<table>(){backspace}{left}
:*:m.ncolor..::#{left}matrix.new<color>(){backspace}{left}

	
	;	Matrix Bulit-ins Functions
:*:m.acol..::#{left}matrix.add_col(){backspace}{Left}
:*:m.afrom..::#{left}matrix.add_row(,0,0,array.from()){backspace 2}{left 2}
:*:m.arow..::#{left}matrix.add_row(){backspace}{Left}
:*:m.avg..::#{left}matrix.avg(){backspace}{Left}
:*:m.col..::#{left}matrix.col(){backspace}{Left}
:*:m.cols..::#{left}matrix.columns(){backspace}{Left}
:*:m.concat..::#{left}matrix.concat(){backspace}{Left}
:*:m.copy..::#{left}matrix.copy(){backspace}{Left}
:*:m.det..::#{left}matrix.det(){backspace}{Left}
:*:m.diff..::#{left}matrix.diff(){backspace}{Left}
:*:m.evals..::#{left}matrix.eigenvalues(){backspace}{Left}
:*:m.evecs..::#{left}matrix.eigenvectors(){backspace}{Left}
:*:m.isadiag..::#{left}matrix.is_antidiagonal(){backspace}{Left}
:*:m.count..::#{left}matrix.elements_count(){backspace}{Left}
:*:m.fill..::#{left}matrix.fill(){backspace}{Left}
:*:m.get..::#{left}matrix.get(){backspace}{Left}
:*:m.inv..::#{left}matrix.inv(){backspace}{Left}
:*:m.ias..::#{left}matrix.is_antisymmetric(){backspace}{Left}
:*:m.ibinary..::#{left}matrix.is_binary(){backspace}{Left}
:*:m.idiag..::#{left}matrix.is_diagonal(){backspace}{Left}
:*:m.iid..::#{left}matrix.is_identity(){backspace}{Left}
:*:m.isquare..::#{left}matrix.is_square(){backspace}{Left}
:*:m.istoch..::#{left}matrix.is_stochastic(){backspace}{Left}
:*:m.isym..::#{left}matrix.is_symmetric(){backspace}{Left}
:*:m.itri..::#{left}matrix.is_triangular(){backspace}{Left}
:*:m.izero..::#{left}matrix.is_zero(){backspace}{Left}
:*:m.kron..::#{left}matrix.kron(){backspace}{Left}
:*:m.max..::#{left}matrix.max(){backspace}{Left}
:*:m.median..::#{left}matrix.median(){backspace}{Left}
:*:m.min..::#{left}matrix.min(){backspace}{Left}
:*:m.mode..::#{left}matrix.mode(){backspace}{Left}
:*:m.mult..::#{left}matrix.mult(){backspace}{Left}
:*:m.pinv..::#{left}matrix.pinv(){backspace}{Left}
:*:m.pow..::#{left}matrix.pow(){backspace}{Left}
:*:m.rank..::#{left}matrix.rank(){backspace}{Left}
:*:m.reshape..::#{left}matrix.reshape(){backspace}{Left}
:*:m.rcol..::#{left}matrix.remove_col(){backspace}{Left}
:*:m.rrow..::#{left}matrix.remove_row(){backspace}{Left} 
:*:m.reverse..::#{left}matrix.reverse(){backspace}{Left}
:*:m.row..::#{left}matrix.row(){backspace}{Left}
:*:m.rows..::#{left}matrix.rows(){backspace}{Left}
:*:m.set..::#{left}matrix.set(){backspace}{Left}
:*:m.sort..::#{left}matrix.sort(){backspace}{Left}
:*:m.submatrix..::#{left}matrix.submatrix(){backspace}{Left}
:*:m.sum..::#{left}matrix.sum(){backspace}{Left}
:*:m.scols..::#{left}matrix.swap_columns(){backspace}{Left}
:*:m.srows..::#{left}matrix.swap_rows(){backspace}{Left}
:*:m.trace..::#{left}matrix.trace(){backspace}{Left}
:*:m.trans..::#{left}matrix.transpose(){backspace}{Left}
:*:if.mc..::#{left}m_cols = matrix.columns(m){backspace}`n`tif m_cols`n{space 4}
:*:if.mr..::#{left}m_rows = matrix.rows(m){backspace}`n`tif m_rows`n{space 4}


;---------------------- ARRAYs --------------------
;	Array.new
:*:a.nf..::#{left}array.new<float>(){backspace}{Left}     
:*:a.ni..::#{left}array.new<int>(){backspace}{Left}
:*:a.nbool..::#{left}array.new<bool>(){backspace}{Left}
:*:a.nstr..::#{left}array.new<string>(){backspace}{Left}
:*:a.nc..::#{left}array.new<color>(){backspace}{Left}
:*:a.nlf..::#{left}array.new<linefill>(){backspace}{Left}
:*:a.nt..::#{left}array.new<table>(){backspace}{Left}
:*:a.nl..::#{left}array.new<line>(){backspace}{Left}
:*:a.nlbl..::#{left}array.new<label>(){backspace}{Left}
:*:a.nb..::#{left}array.new<box>(){backspace}{Left}
					
;	Array.new identifier

:*:a.linef..::= array.new<linefill>(){right}{backspace}
:*:a.int..::= array.new<int>(){right}{backspace}
:*:a.float..::= array.new<float>(){right}{backspace}
:*:a.bool..::= array.new<bool>(){right}{backspace}
:*:a.line..::= array.new<line>(){right}{backspace}
:*:a.box..::= array.new<box>(){right}{backspace}
:*:a.table..::= array.new<table>(){right}{backspace}
:*:a.label..::= array.new<label>(){right}{backspace}
:*:a.color..::= array.new<color>(){right}{backspace}
:*:a.string..::= array.new<string>(){right}{backspace}
					
;	Array Bulit-ins Functiona_
:*:a.avg..::#{left}array.avg(){backspace}{Left}
:*:a.bis..::#{left}array.binary_search(){backspace}{Left}
:*:a.bisl..::#{left}array.binary_search_leftmost(){backspace}{Left}
:*:a.bisr..::#{left}array.binary_search_rightmost(){backspace}{Left}
:*:a.clear..::#{left}array.clear(){backspace}{Left}
:*:a.concat..::#{left}array.concat(){backspace}{Left}
:*:a.copy..::#{left}array.copy(){backspace}{Left}
:*:a.covar..::#{left}array.covariance(){backspace}{Left}
:*:a.fill..::#{left}array.fill(){backspace}{Left}
:*:a.from..::#{left}array.from(){backspace}{Left}
:*:a.get..::#{left}array.get(){backspace}{Left}
:*:a.includes..::#{left}array.includes(){backspace}{Left}
:*:a.indexof..::#{left}array.indexof(){backspace}{Left}
:*:a.insert..::#{left}array.insert(){backspace}{Left}
:*:a.join..::#{left}array.join(){backspace}{Left}
:*:a.liof..::#{left}array.lastindexof(){backspace}{Left}
:*:a.max..::#{left}array.max(){backspace}{Left}
:*:a.median..::#{left}array.median(){backspace}{Left}
:*:a.min..::#{left}array.min(){backspace}{Left}
:*:a.mode..::#{left}array.mode(){backspace}{Left}
:*:a.pr..::#{left}array.percentrank(){backspace}{Left}
:*:a.pnr..::#{left}array.percentile_nearest_rank(){backspace}{Left}
:*:a.pli..::#{left}array.percentile_linear_interpolation(){backspace}{Left}
:*:a.pop..::#{left}array.pop(){backspace}{Left}
:*:a.push..::#{left}array.push(){backspace}{Left}
:*:a.range..::#{left}array.range(){backspace}{Left}
:*:a.remove..::#{left}array.remove(){backspace}{Left}
:*:a.rev..::#{left}array.reverse(){backspace}{Left}
:*:a.set..::#{left}array.set(){backspace}{Left}
:*:a.shift..::#{left}array.shift(){backspace}{Left}
:*:a.size..::#{left}array.size(){backspace}{Left}
:*:a.slice..::#{left}array.slice(){backspace}{Left}
:*:a.sort..::#{left}array.sort(){backspace}{Left}
:*:a.sindices..::#{left}array.sort_indices(){backspace}{Left}
:*:a.stand..::#{left}array.standardize(){backspace}{Left}
:*:a.std..::#{left}array.stdev(){backspace}{Left}
:*:a.sum..::#{left}array.sum(){backspace}{Left}
:*:a.un..::#{left}array.unshift(){backspace}{Left}
:*:a.var..::#{left}array.variance(){backspace}{Left}
:*:if.as..::#{left}a_size = array.size(a){backspace}`n`tif a_size`n{space 4}


;	Color Functions
:*:c.b..::#{left}color.b(){backspace}{left}
:*:c.fg..::#{left}color.from_gradient(){backspace}{left}
:*:c.g..::#{left}color.g(){backspace}{left}
:*:c.r..::#{left}color.r(){backspace}{left}
:*:c.rgb..::#{left}color.rgb(){backspace}{left}
:*:c.t..::#{left}color.t(){backspace}{left}
:*:c.n#{left}..::#{left}color.new(,50){backspace}{left}{shift doweft 3}{shift up}
:*:indianred..::{#}cd5c5c
:*:lightcoral..::{#}f08080
:*:salmon..::{#}fa8072
:*:darksalmon..::{#}e9967a
:*:lightsalmon..::{#}ffa07a
:*:crimson..::{#}dc143c
:*:red..::{#}ff0000
:*:firebrick..::{#}b22222
:*:darkred..::{#}8b0000
:*:pink..::{#}ffc0cb
:*:lightpink..::{#}ffb6c1
:*:hotpink..::{#}ff69b4
:*:deeppink..::{#}ff1493
:*:coral..::{#}ff7f50
:*:tomato..::{#}ff6347
:*:orangered..::{#}ff4500
:*:darkorange..::{#}ff8c00
:*:orange..::{#}ffa500
:*:gold..::{#}ffd700
:*:yellow..::{#}ffff00
:*:lightyellow..::{#}ffffe0
:*:moccasin..::{#}ffe4b5
:*:peachpuff..::{#}ffdab9
:*:palegoldenrod..::{#}eee8aa
:*:khaki..::{#}f0e68c
:*:darkkhaki..::{#}bdb76b
:*:lavender..::{#}e6e6fa
:*:thistle..::{#}d8bfd8
:*:plum..::{#}dda0dd
:*:violet..::{#}ee82ee
:*:orchid..::{#}da70d6
:*:fuchsia..::{#}ff00ff
:*:magenta..::{#}ff00ff
:*:mediumorchid..::{#}ba55d3
:*:mediumpurple..::{#}9370db
:*:blueviolet..::{#}8a2be2
:*:darkviolet..::{#}9400d3
:*:darkorchid..::{#}9932cc
:*:darkmagenta..::{#}8b008b
:*:purple..::{#}800080
:*:indigo..::{#}4b0082
:*:slateblue..::{#}6a5acd
:*:darkslateblue..::{#}483d8b
:*:mediumslateblue..::{#}7b68ee
:*:greenyellow..::{#}adff2f
:*:lawngreen..::{#}7cfc00
:*:lime..::{#}00ff00
:*:limegreen..::{#}32cd32
:*:palegreen..::{#}98fb98
:*:lightgreen..::{#}90ee90
:*:mediumspringgreen..::{#}00fa9a
:*:springgreen..::{#}00ff7f
:*:mediumseagreen..::{#}3cb371
:*:seagreen..::{#}2e8b57
:*:forestgreen..::{#}228b22
:*:green..::{#}008000
:*:darkgreen..::{#}006400
:*:yellowgreen..::{#}9acd32
:*:olivedrab..::{#}6b8e23
:*:olive..::{#}808000
:*:darkolivegreen..::{#}556b2f
:*:mediumaquamarine..::{#}66cdaa
:*:darkseagreen..::{#}8fbc8b
:*:lightseagreen..::{#}20b2aa
:*:darkcyan..::{#}008b8b
:*:teal..::{#}008080
:*:aqua..::{#}00ffff
:*:cyan..::{#}00ffff
:*:lightcyan..::{#}e0ffff
:*:aquamarine..::{#}7fffd4
:*:turquoise..::{#}40e0d0
:*:mediumturquoise..::{#}48d1cc
:*:darkturquoise..::{#}00ced1
:*:cadetblue..::{#}5f9ea0
:*:steelblue..::{#}4682b4
:*:lightsteelblue..::{#}b0c4de
:*:lightblue..::{#}add8e6
:*:skyblue..::{#}87ceeb
:*:deepskyblue..::{#}00bfff
:*:dodgerblue..::{#}1e90ff
:*:mediumslateblue..::{#}7b68ee
:*:royalblue..::{#}4169e1
:*:blue..::{#}0000ff
:*:mediumblue..::{#}0000cd
:*:darkblue..::{#}00008b
:*:navy..::{#}000080
:*:midnightblue..::{#}191970
:*:wheat..::{#}f5deb3
:*:tan..::{#}d2b48c
:*:rosybrown..::{#}bc8f8f
:*:sandybrown..::{#}f4a460
:*:goldenrod..::{#}daa520
:*:darkgoldenrod..::{#}b8860b
:*:peru..::{#}cd853f
:*:chocolate..::{#}d2691e
:*:saddlebrown..::{#}8b4513
:*:brown..::{#}a52a2a
:*:maroon..::{#}800000
:*:white..::{#}ffffff
:*:ghostwhite..::{#}f8f8ff
:*:whitesmoke..::{#}f5f5f5
:*:beige..::{#}f5f5dc
:*:floralwhite..::{#}fffaf0
:*:ivory..::{#}fffff0
:*:linen..::{#}faf0e6
:*:lavenderblush..::{#}fff0f5
:*:silver..::{#}c0c0c0
:*:gray..::{#}808080
:*:dimgray..::{#}696969
:*:lightslategray..::{#}778899
:*:slategray..::{#}708090
:*:darkslategray..::{#}2f4f4f
:*:black..::{#}000000
:*:f.c.random..::randomc(trasp = 0){right}{backspace} => color.rgb(math.random(0, 255){right}{backspace}){right}{backspace}, math.random(0, 255){right}{backspace}, math.random(0, 255){right}{backspace},transp){right}{backspace}`n
:*:c.random..::#{left}randomc(0){backspace}{left}
:*:c.fg..::chart.fg_color
:*:c.bg..::chart.bg_color



;	Box Functions
:*:b.sextend..::#{left}box.set_extend(){backspace}{Left}
:*:b.delete..::#{left}box.delete(){backspace}{Left}
:*:b.copy..::#{left}box.copy(){backspace}{Left}
:*:b.gbot..::#{left}box.get_bottom(){backspace}{Left}
:*:b.gleft..::#{left}box.get_left(){backspace}{Left}
:*:b.gright..::#{left}box.get_right(){backspace}{Left}
:*:b.gtop..::#{left}box.get_top(){backspace}{Left}
:*:b.sbgcolor..::#{left}box.set_bgcolor(){backspace}{Left}
:*:b.sbcolor..::#{left}box.set_border_color(){backspace}{Left}
:*:b.sbstyle..::#{left}box.set_border_style(){backspace}{Left}
:*:b.sbwidth..::#{left}box.set_border_width(){backspace}{Left}
:*:b.stext..::#{left}box.set_text(){backspace}{Left}
:*:b.stcolor..::#{left}box.set_text_color(){backspace}{Left}
:*:b.sthalign..::#{left}box.set_text_halign(){backspace}{Left}
:*:b.stsize..::#{left}box.set_text_size(){backspace}{Left}
:*:b.stvalign..::#{left}box.set_text_valign(){backspace}{Left}
:*:b.stwrap..::#{left}box.set_text_wrap(){backspace}{Left}
:*:b.stop..::#{left}box.set_top(){backspace}{Left}
:*:b.srbottom..::#{left}box.set_rightbottom(){backspace}{Left}
:*:b.sleft..::#{left}box.set_left(){backspace}{Left}
:*:b.sbot..::#{left}box.set_bottom(){backspace}{Left}
:*:b.sright..::#{left}box.set_right(){backspace}{Left}
:*:b.sltop..::#{left}box.set_lefttop(){backspace}{Left}
					

;	Input Functions
:*:i.bool..::@{left}input.bool(true,'',group='',inline=''){right}{backspace}{left 21}
:*:i.color..::@{left}input.color(#000000,'',group='',inline=''){right}{backspace}{left 21}
:*:i.float..::@{left}input.float(0.0,'',group='',inline=''){right}{backspace}{left 21}
:*:i.int..::@{left}input.int(0,'',group='',inline=''){right}{backspace}{left 21}
:*:i.price..::@{left}input.price(0.0,'',group='',inline=''){right}{backspace}{left 21}
:*:i.session..::@{left}input.session('1200-0000','',group='',inline=''){right}{backspace}{left 21}
:*:i.source..::@{left}input.source(close,'',group='',inline=''){right}{backspace}{left 21}
:*:i.string..::@{left}input.string('','',group='',inline=''){right}{backspace}{left 21}
:*:i.symbol..::@{left},input.symbol('btcusdt.p',''group='',inline=''){right}{backspace}{left 21}
:*:i.text..::@{left}input.text_area('Text,'',group='',inline=''){right}{backspace}{left 21}
:*:i.time..::@{left}input.time('1600','',group='',inline=''){right}{backspace}{left 21}
:*:i.tf..::@{left}input.timeframe('60','',group='',inline=''){right}{backspace}{left 21}




;	Label Functions
:*:lbl.copy..::#{left}label.copy(){backspace}{Left}
:*:lbl.delete..::#{left}label.delete(){backspace}{Left}
:*:lbl.gtext..::#{left}label.get_text(){backspace}{Left}
:*:lbl.gx..::#{left}label.get_x(){backspace}{Left}
:*:lbl.gy..::#{left}label.get_y(){backspace}{Left}
:*:lbl.scolor..::#{left}label.set_color(){backspace}{Left}
:*:lbl.ssize..::#{left}label.set_size(){backspace}{Left}
:*:lbl.sstyle..::#{left}label.set_style(){backspace}{Left}
:*:lbl.stext..::#{left}label.set_text(){backspace}{Left}
:*:lbl.stalign..::#{left}label.set_textalign(){backspace}{Left}
:*:lbl.stcolor..::#{left}label.set_textcolor(){backspace}{Left}
:*:lbl.sttip..::#{left}label.set_tooltip(){backspace}{Left}
:*:lbl.sx..::#{left}label.set_x(){backspace}{Left}
:*:lbl.sxloc..::#{left}label.set_xloc(){backspace}{Left}
:*:lbl.sxy..::#{left}label.set_xy(){backspace}{Left}
:*:lbl.sy..::#{left}label.set_y(){backspace}{Left}
:*:lbl.syloc..::#{left}label.set_yloc(){backspace}{Left}
:*:lbl.adown..::label.style_arrowdown
:*:lbl.aup..::label.style_arrowup
:*:lbl.scircle..::label.style_circle
:*:lbl.scross..::label.style_cross
:*:lbl.sdiamond..::label.style_diamond
:*:lbl.sflag..::label.style_flag
:*:lbl.slcenter..::label.style_label_center
:*:lbl.sldown..::label.style_label_down
:*:lbl.slleft..::label.style_label_left
:*:lbl.sllleft..::label.style_label_lower_left
:*:lbl.sllright..::label.style_label_lower_right
:*:lbl.slright..::label.style_label_right
:*:lbl.slup..::label.style_label_up
:*:lbl.sluleft..::label.style_label_upper_left
:*:lbl.sluright..::label.style_label_upper_right
:*:lbl.snone..::label.style_none
:*:lbl.ssquare..::label.style_square
:*:lbl.stdown..::label.style_triangledown
:*:lbl.stup..::label.style_triangleup
:*:lbl.sxcross..::label.style_xcross
					
;	Line Functions
:*:l.copy..::#{left}line.copy(){backspace}{Left}
:*:l.delete..::#{left}line.delete(){backspace}{Left}
:*:l.gprice..::#{left}line.get_price(){backspace}{Left}
:*:l.gx1..::#{left}line.get_x1(){backspace}{Left}
:*:l.gx2..::#{left}line.get_x2(){backspace}{Left}
:*:l.gy1..::#{left}line.get_y1(){backspace}{Left}
:*:l.gy2..::#{left}line.get_y2(){backspace}{Left}
:*:l.sccolor..::#{left}line.set_color(){backspace}{Left}
:*:l.sextend..::#{left}line.set_extend(){backspace}{Left}
:*:l.sstyle..::#{left}line.set_style(){backspace}{Left}
:*:l.swidth..::#{left}line.set_width(){backspace}{Left}
:*:l.sx1..::#{left}line.set_x1(){backspace}{Left}
:*:l.sx2..::#{left}line.set_x2(){backspace}{Left}
:*:l.sxloc..::#{left}line.set_xloc(){backspace}{Left}
:*:l.sxy1..::#{left}line.set_xy1(){backspace}{Left}
:*:l.sxy2..::#{left}line.set_xy2(){backspace}{Left}
:*:l.sy1..::#{left}line.set_y1(){backspace}{Left}
:*:l.sy2..::#{left}line.set_y2(){backspace}{Left}

					
;	LineFill Functions
:*:lf.del..::#{left}linefill.delete(){backspace}{Left}
:*:lf.gl1..::#{left}linefill.get_line1(){backspace}{Left}
:*:lf.gl2..::#{left}linefill.get_line2(){backspace}{Left}
:*:lf.new..::#{left}linefill.new(){backspace}{Left}
:*:lf.sc..::#{left}linefill.set_color(){backspace}{Left}
					
;	Barstate.is*****
:*:ifbs.il..::if barstate.islast`n`t
:*:ifbs.in..::if barstate.isnew`n`t
:*:ifbs.if..::if barstate.isfirst`n`t
:*:ifbs.ih..::if barstate.ishistory`n`t
:*:ifbs.ic..::if barstate.isconfirmed`n`t
:*:ifbs.ilch..::if barstate.islastconfirmedhistory`n`t
:*:ifbs.irt..::if barstate.realtime`n`t
:*:bs.il..::barstate.islast
:*:bs.in..::barstate.isnew
:*:bs.if..::barstate.isfirst
:*:bs.ic..::barstate.isconfirmed
:*:bs.ilch..::barstate.islastconfirmedhistory
:*:bs.irt..::barstate.realtime
					
; Request.Security / Runtime.Error
:*:r.s#{left}..::request.security(){backspace}{Left}
:*:r.sltf..::#{left}request.security_lower_tf(){backspace}{Left}
:*:rt.e#{left}..::runtime.error(){backspace}{Left}
:*:rt.es..::#{left}switch`n`t {=}{>} runtime.error(){backspace}{Left}
					
;	Strings
:*:s.con..::#{left}str.contains(){backspace}{Left}
:*:s.ewith..::#{left}str.endswith(){backspace}{Left}
:*:s.for..::#{left}str.format(){backspace}{Left}
:*:s.for..::#{left}str.format_time(){backspace}{Left}
:*:s.len..::#{left}str.length(){backspace}{Left}
:*:s.lower..::#{left}str.lower(){backspace}{Left}
:*:s.match..::#{left}str.match(){backspace}{Left}
:*:s.pos..::#{left}str.pos(){backspace}{Left}
:*:s.re..::#{left}str.replace(){backspace}{Left}
:*:s.rall..::#{left}str.replace_all(){backspace}{Left}
:*:s.split..::#{left}str.split(){backspace}{Left}
:*:s.swith..::#{left}str.startswith(){backspace}{Left}
:*:s.sstr..::#{left}str.substring(){backspace}{Left}
:*:s.tn..::#{left}str.tonumber(){backspace}{Left}
:*:s.tn..::#{left}str.tonumber(){backspace}{Left}
:*:s.tstr..::#{left}str.tostring(){backspace}{Left}
:*:s.ts..::#{left}str.tostring(){backspace}{Left}
:*:s.up..::#{left}str.upper(){backspace}{Left}
					
;	Strategy Series
:*:s.acurrency..::strategy.account_currency
:*:s.cash..::strategy.cash
:*:s.ctrades..::strategy.closedtrades
:*:s.ccpcontract..::strategy.commission.cash_per_contract
:*:s.ccporder..::strategy.commission.cash_per_order
:*:s.cpercent..::strategy.commission.percent
:*:s.dall..::strategy.direction.all
:*:s.dlong..::strategy.direction.long
:*:s.dshort..::strategy.direction.short
:*:s.equity..::strategy.equity
:*:s.etrades..::strategy.eventrades
:*:s.fixed..::strategy.fixed
:*:s.gloss..::strategy.grossloss
:*:s.gprofit..::strategy.grossprofit
:*:s.iccapital..::strategy.initial_capital
:*:s.long..::strategy.long
:*:s.ltrades..::strategy.losstrades
:*:s.mchall..::strategy.max_contracts_held_all
:*:s.mchlong..::strategy.max_contracts_held_long
:*:s.mchshort..::strategy.max_contracts_held_short
:*:s.mddown..::strategy.max_drawdown
:*:s.mrup..::strategy.max_runup
:*:s.nprofit..::strategy.netprofit
:*:s.oca.cancel..::strategy.oca.cancel
:*:s.oca.none..::strategy.oca.none
:*:s.oca.reduce..::strategy.oca.reduce
:*:s.oprofit..::strategy.openprofit
:*:s.otrades..::strategy.opentrades
:*:s.poequity..::strategy.percent_of_equity
:*:s.paprice..::strategy.position_avg_price
:*:s.pename..::strategy.position_entry_name
:*:s.psize..::strategy.position_size
:*:s.short..::strategy.short
:*:s.wtrades..::strategy.wintrades
					
;	Strategy Funs
:*:s.entry..::#{left}strategy.entry(){backspace}{Left}
:*:s.exit..::#{left}strategy.exit(){backspace}{Left}
:*:s.order..::#{left}strategy.order(){backspace}{Left}
:*:s.cancel..::#{left}strategy.cancel(){backspace}{Left}
:*:s.cancelall..::#{left}strategy.cancel_all()
:*:s.close..::#{left}strategy.close(){backspace}{Left}
:*:s.closeall..::#{left}strategy.close_all(){backspace}{Left}
:*:s.ctcomm..::#{left}strategy.closedtrades.commission(){backspace}{Left}
:*:s.ct.ebindex..::#{left}strategy.closedtrades.entry_bar_index(){backspace}{Left}
:*:s.ct.size..::#{left}strategy.closedtrades.size(){backspace}{Left}
:*:s.ct.eid..::#{left}strategy.closedtrades.entry_id(){backspace}{Left}
:*:s.ct.eprice..::#{left}strategy.closedtrades.entry_price(){backspace}{Left}
:*:s.ct.etime..::#{left}strategy.closedtrades.entry_time(){backspace}{Left}
:*:s.ct.ebindex..::#{left}strategy.closedtrades.exit_bar_index(){backspace}{Left}
:*:s.ct.eid..::#{left}strategy.closedtrades.exit_id(){backspace}{Left}
:*:s.ct.eprice..::#{left}strategy.closedtrades.exit_price(){backspace}{Left}
:*:s.ct.ettime..::#{left}strategy.closedtrades.exit_time(){backspace}{Left}
:*:s.ct.mddown..::#{left}strategy.closedtrades.max_drawdown(){backspace}{Left}
:*:s.ct.mrunup..::#{left}strategy.closedtrades.max_runup(){backspace}{Left}
:*:s.ct.profit..::#{left}strategy.closedtrades.profit(){backspace}{Left}
:*:s.ot.comm..::#{left}strategy.opentrades.commission(){backspace}{Left}
:*:s.ot.ebindex..::#{left}strategy.opentrades.entry_bar_index(){backspace}{Left}
:*:s.ot.eid..::#{left}strategy.opentrades.entry_id(){backspace}{Left}
:*:s.ot.eprice..::#{left}strategy.opentrades.entry_price(){backspace}{Left}
:*:s.ot.etime..::#{left}strategy.opentrades.entry_time(){backspace}{Left}
:*:s.ot.mddown..::#{left}strategy.opentrades.max_drawdown(){backspace}{Left}
:*:s.ot.mrunup..::#{left}strategy.opentrades.max_runup(){backspace}{Left}
:*:s.ot.profit..::#{left}strategy.opentrades.profit(){backspace}{Left}
:*:s.ot.size..::#{left}strategy.opentrades.size(){backspace}{Left}
:*:s.r.aeid..::#{left}strategy.risk.allow_entry_in(){backspace}{Left}
:*:s.r.mcldays..::#{left}strategy.risk.max_cons_loss_days(){backspace}{Left}
:*:s.r.mddown..::#{left}strategy.risk.max_drawdown(){backspace}{Left}
:*:s.r.miforders..::#{left}strategy.risk.max_intraday_filled_orders(){backspace}{Left}
:*:s.r.miloss..::#{left}strategy.risk.max_intraday_loss(){backspace}{Left}
:*:s.r.mpsize..::#{left}strategy.risk.max_position_size(){backspace}{Left}
:*:s.ctaccount..::#{left}strategy.convert_to_account(){backspace}{Left}
:*:s.ctsymbol..::#{left}strategy.convert_to_symbol(){backspace}{Left}

					
;	Syminfo
:*:sym.bc..::syminfo.basecurrency
:*:sym.cur..::syminfo.currency
:*:sym.des..::syminfo.description
:*:sym.mt..::syminfo.mintick
:*:sym.pv..::syminfo.pointvalue
:*:sym.pf..::syminfo.prefix
:*:sym.root..::syminfo.root
:*:sym.ses..::syminfo.session
:*:sym.tick..::syminfo.ticker
:*:sym.tid..::syminfo.tickerid
:*:sym.tz..::syminfo.timezone
:*:sym.t..::syminfo.type
:*:sym.vt..::syminfo.volumetype
					
;	Text
:*:t.abot..::text.align_bottom
:*:t.acenter..::text.align_center
:*:t.aleft..::text.align_left
:*:t.aright..::text.align_right
:*:t.atop..::text.align_top
:*:t.wauto..::text.wrap_auto
:*:t.wnone..::text.wrap_none
:*:auto..::size.auto
:*:huge..::size.huge
:*:large..::size.large
:*:normal..::size.normal
:*:small..::size.small
:*:tiny..::size.tiny
					
;	Position
:*:p.bc..::position.bottom_center
:*:p.bl..::position.bottom_left
:*:p.br..::position.bottom_right
:*:p.mc..::position.middle_center
:*:p.ml..::position.middle_left
:*:p.mr..::position.middle_right
:*:p.tc..::position.top_center
:*:p.tl..::position.top_left
:*:p.tr..::position.top_right
:*:p.bcenter..::position.bottom_center
:*:p.bleft..::position.bottom_left
:*:p.bright..::position.bottom_right
:*:p.mcenter..::position.middle_center
:*:p.mleft..::position.middle_left
:*:p.mright..::position.middle_right
:*:p.tcenter..::position.top_center
:*:p.tleft..::position.top_left
:*:p.tright..::position.top_right
					
;	TimeFrames
:*:tf.isd..::timeframe.isdaily
:*:tf.isdwm..::timeframe.isdwm
:*:tf.isint..::timeframe.isintraday
:*:tf.ismin..::timeframe.isminutes
:*:tf.imon..::timeframe.ismonthly
:*:tf.issec..::timeframe.isseconds
:*:tf.insec..::#{left}timeframe.in_seconds(){backspace}{Left}
:*:tf.isweek..::timeframe.isweekly
:*:tf.multi..::timeframe.multiplier
:*:tf.period..::timeframe.period
					
;	xy loc
:*:xl=bi..::xloc = xloc.bar_index
:*:xl=bt..::xloc = xloc.bar_time
:*:yl=ab..::yloc = yloc.abovebar
:*:yl=bb..::yloc = yloc.belowbar
:*:yl=p..::yloc = yloc.price
:*:xl.bi..::xloc.bar_index
:*:xl.bt..::xloc.bar_time
:*:yl.ab..::yloc.abovebar
:*:yl.bb..::yloc.belowbar
:*:yl.p..::yloc.price
					
;	Tables
:*:t.cell..::#{left}table.cell(table,0,0,''){backspace}{left}
:*:t.csbgc..::#{left}table.cell_set_bgcolor(){backspace}{left}
:*:t.csh..::#{left}table.cell_set_height(){backspace}{left}
:*:t.cstext..::#{left}table.cell_set_text(){backspace}{left}
:*:t.cstc..::#{left}table.cell_set_text_color(){backspace}{left}
:*:t.cstha..::#{left}table.cell_set_text_halign(){backspace}{left}
:*:t.csts..::#{left}table.cell_set_text_size(){backspace}{left}
:*:t.cstva..::#{left}table.cell_set_text_valign(){backspace}{left}
:*:t.cstt..::#{left}table.cell_set_tooltip(){backspace}{left}
:*:t.csw..::#{left}table.cell_set_width(){backspace}{left}
:*:t.clear..::#{left}table.clear(){backspace}{left}
:*:t.del..::#{left}table.delete(){backspace}{left}
:*:t.mcells..::#{left}table.merge_cells(){backspace}{left}
:*:t.sbgc..::#{left}table.set_bgcolor(){backspace}{left}
:*:t.sbc..::#{left}table.set_border_color(){backspace}{left}
:*:t.sbw..::#{left}table.set_border_width(){backspace}{left}
:*:t.sfc..::#{left}table.set_frame_color(){backspace}{left}
:*:t.sfw..::#{left}table.set_frame_width(){backspace}{left}
:*:t.spos..::#{left}table.set_position(){backspace}{left}
:*:table.new..::var table table= table.new(position.top_right,columns = 1,rows = 1,color.new(chart.bg_color,40),`ncolor.new(chart.fg_color,40),1,color.new(chart.fg_color,40),1)`n

;	For Loop
:*:mr.for..::@{left}m_rows = matrix.rows(m)`n`tfor i = 0 to m_rows ? m_rows-1 : na`n`t{backspace}
:*:mc.for..::@{left}m_cols = matrix.columns(m)`n`tfor i = 0 to m_cols ? m_cols-1 : na`n`t{backspace}
:*:a.for..::@{left}a_size = array.size(a)`n`tfor i = 0 to a_size ? a_size-1 : na`n`t{backspace}
:*:mc.for.in..::@{left}m_cols = matrix.columns(m)`nif m_cols`nfor i = 0 to m_cols-1{ctrl down}{]}{ctrl up}`nfor {[}index,n{]} in matrix.col(m,i){right}{backspace}{ctrl down}{]}{ctrl up}`n{space 4}
:*:mr.for.in..::@{left}m_rows = matrix.rows(m)`nif m_rows`nfor i = 0 to m_rows-1{ctrl down}{]}{ctrl up}`nfor {[}index,n{]} in matrix.row(m,i){right}{backspace}{ctrl down}{]}{ctrl up}`n{space 4}
:*:a.for.in..::for {[}i,n{]} in{ }
:*:for..::for i = 0 to`n`t
							
;	Misc
:*:htf.ohlct..::[o,h,l,c,vol,otime,ctime] = request.security('', '', [open, high, low, close, volume, time, time_close])
:*:htf.ohlc..::[o,h,l,c] = request.security('', '', [open, high, low, close])
:*:ltf.ohlct..::[o,h,l,c,vol,otime,ctime] = request.security_lower_tf('', '', [open, high, low, close, volume, time, time_close])
:*:ltf.ohlc..::[o,h,l,c] = request.security_lower_tf('', '', [open, high, low, close, time])
:*:indicator..::indicator('<title>',overlay=true,max_boxes_count = 500,max_labels_count = 500,max_bars_back = 500,explicit_plot_zorder = true)`n


:*:new.indicator..::{/}{/} This source code is subject to the terms of the Mozilla Public License 2.0 at https:{/}{/}mozilla.org{/}MPL{/}2.0{/}`n{/}{/} © {<}name here{>}{home}{right 4}{backspace}{end}`n`n{/}{/}{@}version=5}`nindicator("<title>",overlay=true,max_boxes_count = 500,max_labels_count = 500,max_bars_back = 500,explicit_plot_zorder = true{)}{right}{backspace}`n`n
:*:new.strategy..::{/}{/} This source code is subject to the terms of the Mozilla Public License 2.0 at https:{/}{/}mozilla.org{/}MPL{/}2.0{/}`n{/}{/} © {<}name here{>}{home}{right 4}{backspace}{end}`n`n{/}{/}{@}version=5}`nstrategy("<title>",overlay=true,max_boxes_count = 500,max_labels_count = 500,max_bars_back = 500,explicit_plot_zorder = true{)}{right}{backspace}`n`n
:*:new.library..::{/}{/} This source code is subject to the terms of the Mozilla Public License 2.0 at https:{/}{/}mozilla.org{/}MPL{/}2.0{/}`n{/}{/} © {<}name here{>}{home}{right 4}{backspace}{end}`n`n{/}{/}{@}version=5}`nlibrary("}{<}title{>}{"},overlay = true{)}{right}{backspace}`n`n

;;	print
:*:print..::bug.print{space}{left}(){right}{backspace 2}{right}{backspace}{ctrl down}{right}{ctrl up}{)}{left}{shift down}{right}{shift up}


:*:==...::
	send {= 80}{ctrl down}{/}{ctrl up}{home}
return

:*:===...::
	send {= 80}{ctrl down}{/}{ctrl up}`n{= 80}{ctrl down}{/}{ctrl up}{home}
return

