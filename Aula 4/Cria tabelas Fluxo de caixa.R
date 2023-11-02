rm(list = ls())
library(tidyverse)

# Defina o número de linhas e colunas
num_linhas <- 100
num_colunas <- 24

# Inicialize uma matriz vazia para os fluxos de caixa
fluxos_de_caixa <- matrix(NA, nrow = num_linhas, ncol = num_colunas+1)

# Preencha a matriz com números aleatórios entre 1000 e 25000
for (i in 1:num_linhas) {
  fluxos_de_caixa[i, -1] <- sample(1000:25000, num_colunas, replace = TRUE)
}

# Crie um dataframe com IDs e fluxos de caixa
tabela <- data.frame(as.data.frame(t(fluxos_de_caixa)))

# colnames(tabela) <- paste("Proj", 1:num_linhas, sep = "_")


tabela$descricao <- c("Investimento", paste("FC", 1:24, sep = "_"))

for(i in  1:100){
  tabela[1, i] <- -rnorm(n = 1,
        mean = 100000,
        sd = 15000)
  }


print(tabela)

writexl::write_xlsx(x = tabela, path = "./Aula 4/Base_aula4.xlsx")




