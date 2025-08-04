algoritmo "Cadastrodeclientecorrigido."
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Antonio Carlos Nicolodi 
var
   nomeCompleto, usuario, email, senha, confirmarSenha, cpf, telefone,Arroba: caractere
   cadastroSucesso: logico
   posArroba: inteiro

inicio
   escreval("Bem vindo!!!")
   escreval("Cadastro de novo usuário")
   escreval("------------------------")

   // Solicitação dos dados do usuário
   escreva("Nome completo: ")
   leia(nomeCompleto)

   escreva("Crie seu usuário: ")
   leia(usuario)

      repita
       escreva("E-mail: ")
       leia(email)
       posArroba <- pos("@", email)  // Corrigido: sem espaço
       se posArroba = 0 entao
           escreval("Erro: E-mail deve conter o caractere '@'!")
       fimse
   ate posArroba > 0

   repita
       escreva("Senha (Coloque 8 caracteres com números e sem símbolos): ")
       leia(senha)
       se compr(senha) <> 8 entao
           escreval("A senha deve ter exatamente 8 caracteres!")
       fimse
   ate compr(senha) = 8

   escreva("Confirme sua senha: ")
   leia(confirmarSenha)

   escreva("CPF (apenas números): ")
   leia(cpf)

   escreva("Número de telefone (com DDD): ")
   leia(telefone)

   // Validação dos dados
   cadastroSucesso <- verdadeiro

   se senha <> confirmarSenha entao
       escreval("Erro: As senhas não coincidem!")
       cadastroSucesso <- falso
   fimse

   se (email = "") ou (usuario = "") ou (nomeCompleto = "") ou (cpf = "") ou (telefone = "") entao
       escreval("Erro: Todos os campos são obrigatórios!")
       cadastroSucesso <- falso
   fimse

   se compr(cpf) <> 11 entao
       escreval("Erro: CPF deve ter 11 dígitos!")
       cadastroSucesso <- falso
   fimse

   // Resultado do cadastro
   se cadastroSucesso entao
       escreval("------------------------")
       escreval("Cadastro concluído com sucesso!!")
       escreval("------------------------")
       escreval("Dados cadastrados:")
       escreval("Nome: " + nomeCompleto)
       escreval("Usuário: " + usuario)
       escreval("E-mail: " + email)
       escreval("CPF: " + cpf)
       escreval("Telefone: " + telefone)
   senao
       escreval("------------------------")
       escreval("Cadastro não foi concluído com sucesso.")
       escreval("Por favor, tente novamente!")
   fimse
fimalgoritmo