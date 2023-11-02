rm(list = ls())

# Funcao -----------------------------------------------------------------

calcular_vpl <- function(I, FC, Taxa){
  # browser()
  periodo <- 1:length(FC)
  FD <- (1+Taxa)^periodo
  VPL <- sum(FC/FD) + I
  return(VPL)
}


# Programa ----------------------------------------------------------------

library(readxl)
tabela <- read_excel("Aula 4/Base_aula4.xlsx", 
                    range = "A1:CV26")

VPL <- rep(NA, 100)

tabela <- data.matrix(tabela)

j <- 2
for(j in 1:100){
  I <- tabela[1, j]
  FC <- tabela[, j]

  Taxa <- (1.1)^(1/12)-1
  VPL[j] <- calcular_vpl(I, FC, Taxa)
}


hist(VPL, breaks = 10)
