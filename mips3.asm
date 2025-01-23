#pcount=$a0   Tcount=$a1  multi=$s0  total=$s1 
# wtime=$t0  pcount+Tcount-1=$s2
addi $a0,$0,3  #pcount=3
addi $a1,$0,2  #Tcount=2
addi $s0 ,$0,3 #multi=3
addi $s1,$0,0   #total=0
addi $t0,$0,0   #wtime=0
add $s2,$a0,$a1  #pcount+Tcount
addi $s2,$s2,-1  # pcount+Tcount-1
beq $a0,$0,done  #if (pcount=0) 


j multi

multi:
beq $s0,$0,divide #while (Multi != 0)
add $s1,$s1,$s2 #total=total+pcount+Tcount-1
addi $s0,$s0,-1 # Multi=Multi-1
j multi


divide:
beq $s1,$a1,next #if (total==Tcount)
slt $t1,$a1,$s1 #while (total > Tcount)
beq $t1,$0,done
next:
sub $s1,$s1,$a1  #total=total-Tcount
addi $t0,$t0,1   #wtime=wtime+1
j divide         



done:
sw $t0,8($0)
