library(tidyverse)

# Lista de produtos de exemplo.
produtos <- c("Camiseta", "Calça Jeans", "Tênis", "Meias", "Boné", "Mochila", "Relógio", "Óculos de Sol", "Jaqueta", "Cinto", "Camisa Polo")

cores <- c("Preto", "Azul", "Branco", "Cinza", "Marrom")
cores.p <- c(70, 5, 5, 10, 10)

# Inicialize a lista vazia.
lista_de_produtos <- tibble(id = as.numeric(NA),
                            produto = as.character(NA),
                            loja_qtd = as.integer(NA),
                            estoque_qtd = as.integer(NA),
                            repor_estoque = as.logical(NA),
                            .rows = 150)

# inicializa a coluna de identificação
lista_de_produtos$id <- sample(999999, size = 150, replace = FALSE)

# Gerar 150 itens simulando produtos, quantidades e status de estoque.
for (i in 1:150) {
  lista_de_produtos$produto[i] <- sprintf("%s - %s", sample(produtos, 1), sample(x = cores, prob = cores.p, size = 1))
  lista_de_produtos$loja_qtd[i] <- sample(0:100, 1)
  lista_de_produtos$estoque_qtd[i] <- sample(c(0, 25, 50), 1)
}

saveRDS(object = lista_de_produtos, file = "./Aula 2/Lista de produtos.rds")
