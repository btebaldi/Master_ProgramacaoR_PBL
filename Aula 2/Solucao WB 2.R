rm(list = ls())


# carregar a base de dados
tbl <- readRDS(file = "./Aula 2/Lista de produtos.rds")


for(i in 1:nrow(tbl)){
  if(tbl$loja_qtd[i] <= 25){
    tbl$loja_qtd[i] <- tbl$loja_qtd[i] + tbl$estoque_qtd[i]
    tbl$estoque_qtd[i] <- 0
  }
  
  if(tbl$estoque_qtd[i] <= 25){
    tbl$repor_estoque[i] <- TRUE
  } else {
    tbl$repor_estoque[i] <- FALSE
  }
}
