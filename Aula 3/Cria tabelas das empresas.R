library(tidyverse)

# Inicialize a lista vazia.
Cadastro <- tibble(id = as.numeric(NA),
                   Endereco = as.character(NA),
                   Abertura = as.Date(NA),
                   QtdFuncinarios = as.integer(NA),
                   .rows = 150)

Receitas <- tibble(id = as.numeric(NA),
                   Receita_de_vendas = as.numeric(NA),
                   Qtd_Vendas = as.integer(NA),
                   Custo_Produto_Vendido = as.numeric(NA),
                   .rows = 150)

Despesas <- tibble(id = as.numeric(NA),
                   Aluguel = as.numeric(NA),
                   Administrativo = as.numeric(NA),
                   Funcionarios = as.integer(NA),
                   .rows = 150)

# inicializa a coluna de identificação
Cadastro$id <- sample(150, size = 150, replace = FALSE)
Receitas$id <- sample(150, size = 150, replace = FALSE)
Despesas$id <- sample(150, size = 150, replace = FALSE)

# Gerar 150 itens simulando produtos, quantidades e status de estoque.
for (i in 1:150) {
  #  criacao da tabela de cadastro
  Cadastro$Endereco[i] <- sprintf("ENDERECO MASCARADO - LOJA %s", Cadastro$id[i])
  Cadastro$QtdFuncinarios[i] <- sample(30:100, size = 1)
  Cadastro$Abertura[i] <- sample(seq(from = as.Date("2015-01-01"), to = as.Date("2020-01-01"), by="day"), size = 1)
  
  #  criacao da tabela de Despesas
  Despesas$Aluguel[i] <- sample(seq(from = 15000, to = 100000, by=1), size = 1)
  Despesas$Administrativo[i] <- sample(seq(from = 15000, to = 50000, by=1), size = 1)
  Despesas$Funcionarios[i] <- Cadastro$QtdFuncinarios[i] * sample(seq(from = 4000, to = 10000, by=1), size = 1)
  
  #  criacao da tabela de Receita
  Receitas$Receita_de_vendas[i] <- (Despesas$Aluguel[i] + Despesas$Administrativo[i] + Despesas$Funcionarios[i]) * sample(seq(from = 2.95, to = 3.42, by=0.1), size = 1)
  Receitas$Qtd_Vendas[i] <- Receitas$Receita_de_vendas[i] / sample(seq(from = 100, to = 500, by=0.1), size = 1)
  Receitas$Custo_Produto_Vendido[i] <- Receitas$Receita_de_vendas[i] * sample(seq(from = 0.3, to = 0.4, by=0.1), size = 1)
}


writexl::write_xlsx(x = Cadastro, path = "./Aula 3/Cadastro.xlsx")
writexl::write_xlsx(x = Receitas, path = "./Aula 3/Receitas.xlsx")
writexl::write_xlsx(x = Despesas, path = "./Aula 3/Despesas.xlsx")


