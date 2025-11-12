algoritmo "Agenda_de_Contatos_Melhorada"
// Autor: Ricardo Fiorini Cuato (Baseado no código original)
// Data: 12/11/2025
// Descrição: Agenda CRUD completa usando 'registro' para
//            encapsular dados e procedimentos para modularizar.

// --- 1. Definindo a Estrutura de Dados ---
// Em vez de 3 vetores, criamos 1 tipo "Contato"
tipo
   TipoContato = registro
      nome: caractere[50]
      telefone: caractere[15]
      email: caractere[50]
   fimregistro

var
   // Agora temos SÓ UM VETOR do nosso tipo novo
   agenda: vetor[1..100] de TipoContato
   
   opcao, totalContatos: inteiro

// --- 2. Procedimento de Pausa (UX) ---
procedimento pausar()
var
   qualquerTecla: caractere
inicio
   escreval
   escreva("Pressione [ENTER] para continuar...")
   leia(qualquerTecla)
fimprocedimento

// --- 3. Função de Busca (Melhoria de UX) ---
// Busca um contato pelo nome e retorna seu ÍNDICE (posição)
funcao buscarPorNome(nomeBusca: caractere; total: inteiro): inteiro
var
   i: inteiro
inicio
   para i de 1 ate total faca
      se (agenda[i].nome = nomeBusca) entao
         retorne i // Encontrou! Retorna a posição (ex: 5)
      fimse
   fimpara
   retorne -1 // Não encontrou
fimfuncao

// --- 4. Procedimentos para cada Ação (Modularização) ---

procedimento adicionarContato(porRef total: inteiro)
inicio
   se (total < 100) entao
      // Adicionamos no próximo índice vago
      total := total + 1
      
      limpatela()
      escreval("--- Adicionar Novo Contato ---")
      escreva("Digite o nome: ")
      leia(agenda[total].nome) // Agora acessamos com ".nome"
      escreva("Digite o telefone: ")
      leia(agenda[total].telefone)
      escreva("Digite o e-mail: ")
      leia(agenda[total].email)
      
      escreval("Contato adicionado com sucesso!")
   senao
      escreval("Agenda cheia! Não é possível adicionar mais.")
   fimse
   pausar()
fimprocedimento

procedimento listarContatos(total: inteiro)
var
   i: inteiro
inicio
   limpatela()
   escreval("--- Lista de Contatos (", total, ") ---")
   se total = 0 entao
      escreval("Nenhum contato cadastrado.")
   senao
      para i de 1 ate total faca
         escreval("ID: ", i)
         escreval("  Nome: ", agenda[i].nome)
         escreval("  Telefone: ", agenda[i].telefone)
         escreval("  E-mail: ", agenda[i].email)
         escreval("-----------------------------")
      fimpara
   fimse
   pausar()
fimprocedimento

procedimento editarContato(total: inteiro)
var
   nomeBusca: caractere[50]
   indice: inteiro
inicio
   limpatela()
   escreval("--- Editar Contato ---")
   escreva("Digite o nome do contato a editar: ")
   leia(nomeBusca)
   
   indice := buscarPorNome(nomeBusca, total)
   
   se (indice = -1) entao
      escreval("Contato '", nomeBusca, "' não encontrado.")
   senao
      // Encontrou! 'indice' guarda a posição (ex: 5)
      escreval("Editando contato: ", agenda[indice].nome)
      escreval("Deixe em branco para não alterar.")
      
      escreva("Digite o novo nome (", agenda[indice].nome, "): ")
      leia(agenda[indice].nome) // Simplesmente sobrescreve
      
      escreva("Digite o novo telefone (", agenda[indice].telefone, "): ")
      leia(agenda[indice].telefone)
      
      escreva("Digite o novo e-mail (", agenda[indice].email, "): ")
      leia(agenda[indice].email)
      
      escreval("Contato atualizado com sucesso!")
   fimse
   pausar()
fimprocedimento

procedimento removerContato(porRef total: inteiro)
var
   nomeBusca: caractere[50]
   indice, i: inteiro
   confirmacao: caractere
inicio
   limpatela()
   escreval("--- Remover Contato ---")
   escreva("Digite o nome do contato a remover: ")
   leia(nomeBusca)
   
   indice := buscarPorNome(nomeBusca, total)
   
   se (indice = -1) entao
      escreval("Contato '", nomeBusca, "' não encontrado.")
   senao
      // Confirmação
      escreval("Tem certeza que deseja remover ", agenda[indice].nome, "? (S/N)")
      leia(confirmacao)
      
      se (maiusc(confirmacao) = "S") entao
         // Lógica do "arrasta-para-a-esquerda"
         // Puxa todos os contatos da frente para uma posição atrás
         para i de indice ate (total - 1) faca
            agenda[i] := agenda[i+1] // Copia o registro inteiro!
         fimpara
         
         total := total - 1 // Diminui o contador total
         escreval("Contato removido com sucesso!")
      senao
         escreval("Operação cancelada.")
      fimse
   fimse
   pausar()
fimprocedimento

// --- 5. Bloco Principal (Menu) ---
inicio
   totalContatos := 0

   // Usando 'repita' fica mais limpo que 'enquanto verdadeiro'
   repita
      limpatela()
      escreval("=== Agenda de Contatos ===")
      escreval("Total de contatos: ", totalContatos)
      escreval("--------------------------")
      escreval("1 - Adicionar Contato")
      escreval("2 - Editar Contato (por nome)")
      escreval("3 - Remover Contato (por nome)")
      escreval("4 - Listar Todos os Contatos")
      escreval("5 - Sair")
      escreva("Escolha uma opção: ")
      leia(opcao)

      // O menu agora é limpo e só chama os procedimentos
      escolha opcao
         caso 1:
            adicionarContato(totalContatos)
         caso 2:
            editarContato(totalContatos)
         caso 3:
            removerContato(totalContatos)
         caso 4:
            listarContatos(totalContatos)
         caso 5:
            escreval("Saindo da agenda. Até logo!")
         caso contrario:
            escreval("Opção inválida! Tente novamente.")
            pausar()
      fimescolha
      
   ate (opcao = 5)

fimalgoritmo
