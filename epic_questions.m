xproblem1
	Read !,"Address:",addr
	If addr?.E5N do
	. w !,addr," is Valid"
	Else  do
	. w !,addr," is invalid"

xloadmozart
	set ^XA(1)="ONCE UPON A TIME A COMPOSER NAMED MOZART WROTE"
	set ^XA(2)="THE 'MOZART PIANO CONCERTO NUMBER ONE'. MOZART,"
	set ^XA(3)="HAPPILY EVER AFTER"
	set ^XN=3

xproblem2
	for i=1:1:^XN  do
	. w x,":BEFORE:",^XA(i),!
	. set ^XA(i)=$replace(^XA(i),"MOZART","BACH")
	;. w x,":AFTER:",^XA(i),!

xproblem3
	for i=$ascii("A"):1:$ascii("Z") do
	. set xcount(i)=0
	
	set x = "^XA"
	set x = $query(@x)
	set f=0
	for  do  quit:f=1
	. write x,":",$length($get(@x)),":",$get(@x),!
	. for j=1:1:$length($get(@x))  do
	.. set char=$extract($get(@x),j)
	.. set xcount($Ascii(char))=xcount($Ascii(char))+1
	. set x = $query(@x)
	. if $length(x)=0 set f=1
	
	for i=$ascii("!"):1:$ascii("~") do ; 33, 126
	. w $char(i),":",$get(xcount(i),0),!
