#Problem 1
XADDRCHK
    read !,"Address:",addr
    if addr?.E5N do
    . w !,"VALID ZIP CODE"
    else  do
    . w !,"INVALID ZIP CODE

#Problem 2
#Use translate

loadmozart
	set ^XA(1)="ONCE UPON A TIME A COMPOSER NAMED MOZART WROTE"
	set ^XA(2)="THE 'MOZART PIANO CONCERTO NUMBER ONE'. MOZART,"
	set ^XA(3)="HAPPILY EVER AFTER"

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
	
	for i=$ascii("A"):1:$ascii("Z") do
	. w $char(i),":",xcount(i),!

    
