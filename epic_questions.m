xloadmozart
	set ^XA(1)="ONCE UPON A TIME A COMPOSER NAMED MOZART WROTE"
	set ^XA(2)="THE 'MOZART PIANO CONCERTO NUMBER ONE'. MOZART,"
	set ^XA(3)="HAPPILY EVER AFTER"
	

xproblem1
	Read !,"Enter an Address:",addr
	If addr?.E5N do ;any letter followed by 5 numbers
	. w !,addr," is Valid"
	Else  do
	. w !,addr," is Invalid"
		

xproblem2
	set key = $order(^XA(""))
	while (key '= ""){
		w key,":BEFORE:",^XA(key),!
		set ^XA(key)=$replace(^XA(key),"MOZART","BACH")
		w key,":AFTER:",^XA(key),!
		set key = $order(^XA(key))
	}
	

xproblem3
	set x = "^XA"
	set x = $query(@x)
	set f=0
	for  do  quit:f=1
	. write x,":",$length($get(@x)),":",$get(@x),!
	. for j=1:1:$length($get(@x))  do
	.. set char=$extract($get(@x),j)
	.. set xcount($Ascii(char))=$get(xcount($Ascii(char)),0)+1
	. set x = $query(@x)
	. if $length(x)=0 set f=1
	
	for i=$ascii("!"):1:$ascii("~") do ; 33, 126
	. w $char(i),":",$get(xcount(i),0),!
	
xproblem4
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
	
xproblem5
	read !,"Find names (starting with):",name
	set key = $order(^XNAMES(""))
	while (key '= ""){
		if (key[name){
			w !,key
		}
		set key = $order(^XNAMES(key))
	}