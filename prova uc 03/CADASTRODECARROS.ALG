Algoritmo "cadastrodecarros"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Antonio Carlos Nicolodi 

Var
   modelo,marca,placa,cor:caractere
   ano,i,N:inteiro
Inicio

      escreva("quantos carros deseja cadastra?")
      leia (N)

      i <- 1
      

      enquanto i <= N faca
         escreval ("---cadastro do carro---")
         

         escreva ("modelo: ")
         leia (modelo)
         escreva ("marca: ")
         leia (marca)
         escreva ("ano")
         leia (ano)
         escreva ("placa")
         leia (placa)
         escreva("cor")
         leia (cor)
         
         escreva("carro",i,"cadastro com sucesso!!")
         escreva("!")
         
         i <- i + 1
       fimenquanto
       
       escreval("/ntodos os ",N,"carros foram  casdastrados!")


Fimalgoritmo