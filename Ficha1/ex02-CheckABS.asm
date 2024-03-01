.text
.global CheckABS

# a0 = valor "limite" X
# a1 = tamanho do vetor
# a2 = endere�o do vetor
     
CheckABS:
       li   t0, 0        # Contador de ocorr�ncias
       beq  a1, zero, fim
iter:  lw   t1, 0(a2)    # L� elemento do vetor
       bgt  t1, zero, pos
       neg  t1, t1       # Valor absoluto do elemento lido
pos:   bleu t1, a0, prox
       sw   zero, 0(a2)  # Como |elemento|>a0 ent�o elemento torna-se 0
       addi t0, t0, 1	 # Atualiza o contador
prox:  addi a2, a2, 4    # Atualiza endere�o   
       addi a1, a1, -1   # Atualiza itera��es em falta
       bne  a1, zero, iter 
fim:   mv   a0, t0       # Coloca resultado em a0
       ret
       