 #grupo daniel,luis,blandon;
  .data

menosuno: .float -1.0
n: .float 0.0
uno: .float 1.0
dos: .float 2.0

    .global tang

    .text
sen:
    xor %rax, %rax
    leaq menosuno(%rip), %rax
    mulss (%rax), %xmm4 
    xor %rax, %rax
    leaq uno(%rip), %rax
    addss (%rax), %xmm3
    
    ucomiss %xmm5,%xmm3     
    jb sen                  

    xor %rax, %rax
    leaq dos(%rip), %rax
    movss (%rax), %xmm6   
    mulss %xmm5, %xmm6  
xor %rax, %rax
    leaq uno(%rip), %rax
    addss (%rax), %xmm6    
    
    xor %rax, %rax
    leaq uno(%rip), %rax
    movss (%rax), %xmm3 

    ucomiss %xmm6, %xmm3    
    je finexponentesen         

finexponentesen:
    xor %rax, %rax
    leaq n(%rip), %rax
    movss (%rax), %xmm3     
    xor %rax, %rax
    leaq uno(%rip), %rax
    movss (%rax), %xmm7   


denominadorsen:
    xor %rax, %rax
    leaq uno(%rip), %rax
    addss (%rax), %xmm3    
    mulss %xmm3, %xmm7  

    ucomiss %xmm6,%xmm3 
    jb denominadorsen   

    divss %xmm7, %xmm2  
    mulss %xmm4, %xmm2  
    addss %xmm2, %xmm1  
    
    xor %rax, %rax
    leaq menosuno(%rip), %rax
    movss (%rax), %xmm3  
    movss %xmm0, %xmm2     

    xor %rax, %rax
    leaq uno(%rip), %rax
    addss (%rax), %xmm5    

    xor %rax, %rax
    leaq menosuno(%rip), %rax
    movss (%rax), %xmm4 

    ucomiss %xmm0, %xmm5    
    jb sen     
    
tanres:
    divss %xmm2, %xmm1     
     movss %xmm1, %xmm0     
    
fin:
    ret             
