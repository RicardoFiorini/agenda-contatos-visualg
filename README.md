# 📔 Agenda de Contatos em Portugol

Este é um projeto de console completo em Portugol que simula uma agenda de contatos. Ele implementa todas as operações **CRUD** (Create, Read, Update, Delete - Criar, Ler, Atualizar, Remover).

Este algoritmo foi reescrito (refatorado) para usar as melhores práticas de programação estruturada, focando em **modularização** e, o mais importante, no uso de **`registros`** (structs) para garantir a integridade dos dados.

## ✨ Funcionalidades

* **1. Adicionar Contato:** Adiciona um novo registro (nome, telefone, e-mail) à agenda.
* **2. Editar Contato:** Permite ao usuário **buscar um contato pelo nome** e, se encontrado, atualizar seus dados.
* **3. Remover Contato:** Permite ao usuário **buscar um contato pelo nome** e, após confirmação, removê-lo da agenda.
* **4. Listar Contatos:** Exibe todos os contatos cadastrados, mostrando nome, telefone e e-mail de forma organizada.
* **5. Sair:** Encerra o programa.

## 🛠️ A "Melhoria Máxima": `Registro` vs. Vetores Paralelos

A mudança mais importante neste código é a **estrutura de dados**.

### A Abordagem Frágil (Original)

O código original usava **três vetores paralelos**:

```portugol
contatos : vetor[1..100] de caractere
telefones : vetor[1..100] de caractere
emails : vetor[1..100] de caractere
