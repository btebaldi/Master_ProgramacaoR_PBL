rm(list=ls())

library(ggplot2)

data(iris)

ggplot(iris)+
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 color = Species)) +
  labs(title = "Sepal Length vs Sepal Width",
       subtitle = "Iris Database",
       caption = "Fonte: Iris database (R-Studio)",
       y="Sepal Width",
       x="Sepal Length",
       color="legenda")

ggsave(filename = "grafico 1.png",
       path = "Graficos",
       scale=1, units = "in", dpi = 100,
       width = 8, height = 6)
