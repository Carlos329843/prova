algoritmo "cadastrodecarrosCORRIGIDO1.0"
// Disciplina   : [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi

var
   modelo, marca, placa, cor: vetor[1..100] de caractere
   ano, estoque, qtd_comprada: vetor[1..100] de inteiro
   preco: vetor[1..100] de real
   N, i, opcao, carro_escolhido, qtd,total_carros_comprados: inteiro
   total_compra, desconto, imposto,valor_parcial,desconto_ano,valor_final,subtotal: real
   ano_atual: inteiro
   continuar: caractere
inicio

      ano_atual <- 2025 // Atualize conforme o ano atual

      // Cadastro dos carros
      escreva("Quantos carros deseja cadastrar? ")
      leia(N)

      para i de 1 ate N faca
         escreval("--- Cadastro do carro ", i, " ---")

         escreva("Modelo: ")
         leia(modelo[i])

         escreva("Marca: ")
         leia(marca[i])

         repita
            escreva("Ano (entre 1990 e ", ano_atual, "): ")
            leia(ano[i])
            se (ano[i] < 1990) ou (ano[i] > ano_atual) entao
               escreval("Ano inválido! Digite um ano entre 1990 e ", ano_atual)
            fimse
         ate (ano[i] >= 1990) e (ano[i] <= ano_atual)

         repita
            escreva("Preço (R$ 10.000 ou mais): R$ ")
            leia(preco[i])
            se preco[i] < 10000 entao
               escreval("Preço inválido! O valor mínimo é R$ 10.000")
            fimse
         ate preco[i] >= 10000

         escreva("Placa: ")
         leia(placa[i])

         escreva("Cor: ")
         leia(cor[i])

         escreva("Estoque: ")
         leia(estoque[i])

         escreval("Carro ", i, " cadastrado com sucesso!!")
         escreval("-------------------------------")
      fimpara

      escreval("Todos os ", N, " carros foram cadastrados com sucesso!")

      // Sistema de compras
      total_compra <- 0
      continuar <- "S"

      escreval("=== SISTEMA DE VENDAS ===")

      enquanto (continuar = "S") ou (continuar = "s") faca
         // Listar carros disponíveis
         escreval("Carros disponíveis:")
         escreval("-------------------------------------------------------------")
         escreval("| # | Modelo    | Marca   | Ano  | Preço     | Estoque |")
         escreval("-------------------------------------------------------------")

         para i de 1 ate N faca
            se estoque[i] > 0 entao
               escreval("| ", i, " | ", modelo[i], " | ", marca[i], " | ", ano[i], " | R$ ", preco[i]:8:2, " | ", estoque[i]:7, " |")
            fimse
         fimpara
         escreval("-------------------------------------------------------------")

         // Selecionar carro
         repita
            escreva("Digite o número do carro que deseja comprar (1-", N, "): ")
            leia(carro_escolhido)
            se (carro_escolhido < 1) ou (carro_escolhido > N) entao
               escreval("Opção inválida! Digite um número entre 1 e ", N)
            fimse
         ate (carro_escolhido >= 1) e (carro_escolhido <= N)

         // Verificar estoque
         repita
            escreva("Quantidade desejada (estoque disponível: ", estoque[carro_escolhido], "): ")
            leia(qtd)
            se qtd > estoque[carro_escolhido] entao
               escreval("Quantidade indisponível! Estoque atual: ", estoque[carro_escolhido])
            fimse
         ate qtd <= estoque[carro_escolhido]

         // Atualizar estoque e registrar compra
         estoque[carro_escolhido] <- estoque[carro_escolhido] - qtd
         qtd_comprada[carro_escolhido] <- qtd_comprada[carro_escolhido] + qtd

         // Calcular valor parcial
         valor_parcial <- preco[carro_escolhido] + qtd
         total_compra <- total_compra + valor_parcial

         escreval("Adicionado ao carrinho: ", qtd, "x ", modelo[carro_escolhido], " - R$ ", valor_parcial:8:2)
         escreval("Total parcial: R$ ", total_compra:8:2)

         // Perguntar se deseja continuar
         escreva("Deseja continuar comprando? (S/N): ")
         leia(continuar)
      fimenquanto

      // Aplicar descontos
      desconto <- 0

      // Desconto por quantidade (5% se comprar mais de 2 carros)
      total_carros_comprados <- 0
      para i de 1 ate N faca
         total_carros_comprados <- total_carros_comprados + qtd_comprada[i]
      fimpara

      se total_carros_comprados > 2 entao
         desconto <- desconto + (total_compra * 0.05)
         escreval("Desconto de 5% por comprar mais de 2 carros: R$ ", desconto:8:2)
      fimse

      // Desconto adicional de 10% para carros com ano anterior
      desconto_ano <- 0
      para i de 1 ate N faca
         se (qtd_comprada[i] > 0) e (ano[i] < ano_atual) entao
            desconto_ano <- desconto_ano + (preco[i] * qtd_comprada[i] * 0.10)
         fimse
      fimpara

      se desconto_ano > 0 entao
         desconto <- desconto + desconto_ano
         escreval("Desconto adicional de 10% para carros com ano anterior: R$ ", desconto_ano:8:2)
      fimse

      // Aplicar imposto de luxo (8% se total > 100.000)
      imposto <- 0
      se (total_compra - desconto) > 100000 entao
         imposto <- (total_compra - desconto) * 0.08
         escreval("Imposto de luxo (8%): R$ ", imposto:8:2)
      fimse

      // Calcular valor final
      valor_final <- total_compra - desconto + imposto

      // Listagem completa da compra
      escreval("=== RESUMO DA COMPRA ===")
      escreval("---------------------------------------------------------------")
      escreval("| Modelo    | Marca   | Ano  | Qtd | Preço Uni | Subtotal   |")
      escreval("---------------------------------------------------------------")

      para i de 1 ate N faca
         se qtd_comprada[i] > 0 entao
            subtotal <- preco[i] * qtd_comprada[i]
            escreval("| ", modelo[i], " | ", marca[i], " | ", ano[i], " | ", qtd_comprada[i]:3, " | R$ ", preco[i]:8:2, " | R$ ", subtotal:8:2, " |")
         fimse
      fimpara

      escreval("---------------------------------------------------------------")
      escreval("TOTAL BRUTO: R$ ", total_compra:10:2)
      escreval("DESCONTOS: R$ ", desconto:10:2)
      escreval("IMPOSTOS: R$ ", imposto:10:2)
      escreval("TOTAL A PAGAR: R$ ", valor_final:10:2)
      escreval("---------------------------------------------------------------")

fimalgoritmo