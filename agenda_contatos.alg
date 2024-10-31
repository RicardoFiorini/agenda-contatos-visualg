algoritmo "Agenda de Contatos"
variáveis
    nome : caractere[50]
    telefone : caractere[15]
    email : caractere[50]
    contatos : vetor[1..100] de caractere[50] // Vetor para nomes
    telefones : vetor[1..100] de caractere[15] // Vetor para telefones
    emails : vetor[1..100] de caractere[50] // Vetor para e-mails
    opcao, i, totalContatos : inteiro
início
    totalContatos ← 0

    enquanto verdadeiro faça
        escreva("\n=== Agenda de Contatos ===\n")
        escreva("1 - Adicionar Contato\n")
        escreva("2 - Editar Contato\n")
        escreva("3 - Remover Contato\n")
        escreva("4 - Listar Contatos\n")
        escreva("5 - Sair\n")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha opcao
            caso 1: // Adicionar Contato
                se totalContatos < 100 então
                    escreva("Digite o nome: ")
                    leia(nome)
                    escreva("Digite o telefone: ")
                    leia(telefone)
                    escreva("Digite o e-mail: ")
                    leia(email)

                    // Armazenar os dados nos vetores
                    contatos[totalContatos + 1] ← nome
                    telefones[totalContatos + 1] ← telefone
                    emails[totalContatos + 1] ← email
                    totalContatos ← totalContatos + 1
                    escreva("Contato adicionado com sucesso!\n")
                senão
                    escreva("Agenda cheia! Não é possível adicionar mais contatos.\n")
                fimse
            caso 2: // Editar Contato
                escreva("Digite o número do contato a editar (1 a ", totalContatos, "): ")
                leia(i)
                se i >= 1 e i <= totalContatos então
                    escreva("Digite o novo nome: ")
                    leia(nome)
                    escreva("Digite o novo telefone: ")
                    leia(telefone)
                    escreva("Digite o novo e-mail: ")
                    leia(email)

                    // Atualiza os dados
                    contatos[i] ← nome
                    telefones[i] ← telefone
                    emails[i] ← email
                    escreva("Contato atualizado com sucesso!\n")
                senão
                    escreva("Número de contato inválido!\n")
                fimse
            caso 3: // Remover Contato
                escreva("Digite o número do contato a remover (1 a ", totalContatos, "): ")
                leia(i)
                se i >= 1 e i <= totalContatos então
                    // Move os contatos para "remover" o contato
                    para j de i até totalContatos - 1 faça
                        contatos[j] ← contatos[j + 1]
                        telefones[j] ← telefones[j + 1]
                        emails[j] ← emails[j + 1]
                    fimpara
                    totalContatos ← totalContatos - 1
                    escreva("Contato removido com sucesso!\n")
                senão
                    escreva("Número de contato inválido!\n")
                fimse
            caso 4: // Listar Contatos
                escreva("=== Lista de Contatos ===\n")
                se totalContatos = 0 então
                    escreva("Nenhum contato cadastrado.\n")
                senão
                    para i de 1 até totalContatos faça
                        escreva(i, " - Nome: ", contatos[i], ", Telefone: ", telefones[i], ", E-mail: ", emails[i], "\n")
                    fimpara
                fimse
            caso 5: // Sair
                escreva("Saindo da agenda. Até logo!\n")
                pare
            de outro modo:
                escreva("Opção inválida! Tente novamente.\n")
        fimse
    fimenquanto
fimenquanto
