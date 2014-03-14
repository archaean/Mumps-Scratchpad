S ^XA(1)="ONCE UPON A TIME A COMPOSER NAMED MOZART WROTE"
S ^XA(2)="THE 'MOZART PIANO CONCERTO NUMBER ONE'. MOZART,"
S ^XA(3)="HAPPILY EVER AFTER"

#Problem 1
XADDRCHK
    read !,"Address:",addr
    if addr?.E5N do
    . w !,"VALID ZIP CODE"
    else  do
    . w !,"INVALID ZIP CODE

#Problem 2
#Use translate

#Problem 3
for i in $length(^XA) do
. if 'col($Ascii(^XA(i))) do
.. s col($Ascii(^XA(i)))=1
. else  do
.. s col($Ascii(^XA(i)))+=1
for i in $length(col) do
. write !,$Char(i),":",col(i)

    
