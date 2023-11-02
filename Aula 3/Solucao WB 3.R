rm(list = ls())

library(readxl)
Cadastro <- read_excel("Aula 3/Cadastro.xlsx")
Receitas <- read_excel("Aula 3/Receitas.xlsx")
Despesas <- read_excel("Aula 3/Despesas.xlsx")

tb <- inner_join(Cadastro, Receitas, by = c("id"="id"))

tb <- inner_join(tb, Despesas, by = c("id"="id"))


tb_full <- tb %>% mutate(Salario = Funcionarios/QtdFuncinarios,
               Lucro = Receita_de_vendas - Custo_Produto_Vendido -Aluguel-Administrativo -Funcionarios,
               Lucro_por_func = Lucro/QtdFuncinarios, 
               Margem = Lucro/Receita_de_vendas) %>% 
  select(id, Salario, QtdFuncinarios, Lucro_por_func, Lucro, Margem)

# determine a empresa com maiores margems
tb_full %>% filter(Margem < 0)

# determine a empresa com maiores margems
tb_full %>% filter(Salario > 20000)

# determine a empresa com maiores margems
tb_full %>% filter(Salario > 20000)