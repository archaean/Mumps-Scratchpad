; debug mode on
set debug = 1

; xloadmozart
zr
	set ^XA(1)="ONCE UPON A TIME A COMPOSER NAMED MOZART WROTE"
	set ^XA(2)="THE 'MOZART PIANO CONCERTO NUMBER ONE'. MOZART,"
	set ^XA(3)="MOZART, MOMOZART  MOZARTMOZART, MOZART."
	set ^XA(4)="HAPPILY EVER AFTER"
zs xloadmozart

; xproblem1
zr
	Read !,"Enter an Address:",addr
	If addr?.E1" "5N do ;any # of letters followed by " " and 5 numbers
	. w !,"'",addr,"' - has a valid zipcode"
	Else  do
	. w !,"'",addr,"' - has an invalid zipcode"
zs xproblem1
d ^xproblem1


; xproblem2
zr
	set key = $order(^XA(""))
	while (key '= ""){
		if $get(debug,0) {w !,key,":BEFORE:",^XA(key),!}
		
		set x = ^XA(key)
		set offset = $length("MOZART") - $length("BACH")
		set offsetcnt = 0
		set cursorstr = 1
		set cursorend = 1
		while(cursorend <= $length(x)){
			set cursorspan = $extract(x,cursorstr,cursorend)
			if $get(debug,0)  w !,"Cursor Char:",cursorstr,":",cursorend,":`",cursorspan,"`"
			if $get(debug,0)  w (cursorspan?1P),"|",(cursorstr=cursorend),"|",(cursorspan?1P)&(cursorstr=cursorend)
			if ((cursorspan?1P)&(cursorstr=cursorend)){
				if $get(debug,0) w "->(Setting End)"
				set cursorstr = cursorstr + 1
				set cursorend = cursorend + 1
			}
			else {
				if ($extract(x,cursorstr,cursorend)?.A1P){
					set word = $extract(x,cursorstr,cursorend-1)
					if $get(debug,0)  {w "->(word)"}
					if word="MOZART"{
						set cursorstrjst = cursorstr - (offset*offsetcnt)
						set cursorendjst = cursorend - (offset*offsetcnt)
						set left = $extract(^XA(key),1,cursorstrjst-1)
						set mid = "BACH"
						set right = $extract(^XA(key),cursorendjst,$length(^XA(key)))
						if $get(debug,0) w !,left_mid_right
						set ^XA(key) = left_mid_right
						set offsetcnt = offsetcnt + 1
					}
					set cursorstr = cursorend
				}
				else{
					set cursorend = cursorend + 1
				}
			}
		}		
		if $get(debug,0)  w !,key,":AFTER:",^XA(key),!
		set key = $order(^XA(key))
	}
zs xproblem2
; Load test data and run 
d ^xloadmozart
d ^xproblem2


;xproblem3
zr
	set ct = $order(xcount(""))
	while(ct '= ""){
		set xcount(ct) = 0
		set ct = $order(xcount(ct)) 
	}

	set x = "^XA"
	set x = $query(@x)
	set f=0
	for  do  quit:f=1
	. if $get(debug,0) write x,":",$length($get(@x)),":",$get(@x),!
	. for j=1:1:$length($get(@x))  do
	.. set char=$extract($get(@x),j)
	.. set xcount($Ascii(char))=$get(xcount($Ascii(char)),0)+1
	. set x = $query(@x)
	. if $length(x)=0 set f=1
	
	set ct = $order(xcount(""))
	while(ct '= ""){
		set charcount = $get(xcount(ct),0)
		if charcount > 0 w $char(ct),":",charcount,!
		set ct = $order(xcount(ct)) 
	}
	w "(All other character count are '0')",!,!
zs xproblem3
; Load test data and run 
; d ^xloadmozart
; d ^xproblem3


;xproblem4
zr
	kill ^XNAMES
	set x="start"
	for  do  quit:x=""
	. read !,"Enter a name ("" to quit) :",x
	. if x?.A1",".A1" ".A do
	.. set ^XNAMES(x) = ""
	. else  do
	.. if x="" do
	... quit
	.. else  do
	... w !,"Invalid Name, Format: (LASTNAME,FIRSTNAME INITAL(S)"
	set key = $order(^XNAMES(""))
	while (key '= ""){
		write !,key
		set key = $order(^XNAMES(key))
	}
zs xproblem4
;d ^xproblem4


;xproblem5
zr
	read !,"Find names (starting with):",name
	set key = $order(^XNAMES(""))
	w !,"List of Matching Names",!,"==========="
	while (key '= ""){
		if (key[name){
			w !,key
		}
		set key = $order(^XNAMES(key))
	}
zs xproblem5
; Load run names and then run name find
;d ^xproblem4
;d ^xproblem5
