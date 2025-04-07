library(ggplot2)
library(ggthemes)
library(scales)

# Gráfico elaborado com legenda
grafpainel <- ggplot(birthrateDadosEmPainel,
                     mapping = aes(y = SP.DYN.CBRT.IN, x = year)) +
  
  # Usando geom_point para adicionar pontos coloridos com efeitos de cor
  geom_point(aes(color = SP.DYN.CBRT.IN), 
             size = 5, 
             alpha = 0.9, 
             shape = 21, 
             stroke = 2) +
  
  # Adicionando um gradiente de cor mais elaborado para os pontos
  scale_color_gradientn(colors = c("blue", "cyan", "yellow", "red", "darkred"), 
                        values = rescale(c(0, 0.25, 0.5, 0.75, 1)), 
                        name = "Taxa de Natalidade") +  # Definindo o nome da legenda
  
  # Adicionando um título chamativo
  labs(title = "Evolução da Taxa de Natalidade ao Longo do Tempo", 
       subtitle = "Análise visual da Taxa de Natalidade de 1960 a 2020",
       x = "Ano", 
       y = "Taxa de Natalidade (por 1.000 habitantes)",
       caption = "Fonte: Dados de Taxa de Natalidade Global") +
  
  # Usando tema com fundo escuro e texto vibrante
  theme_minimal(base_size = 16) +
  theme(
    plot.title = element_text(size = 24, face = "bold", color = "white", hjust = 0.5, family = "Arial"),
    plot.subtitle = element_text(size = 18, color = "lightblue", hjust = 0.5),
    axis.title.x = element_text(size = 14, face = "bold", color = "white"),
    axis.title.y = element_text(size = 14, face = "bold", color = "white"),
    axis.text = element_text(size = 12, color = "white"),
    plot.caption = element_text(size = 12, face = "italic", color = "gray70"),
    panel.grid.major = element_line(color = "gray30", size = 0.6),
    panel.grid.minor = element_line(color = "gray40", size = 0.3),
    plot.background = element_rect(fill = "black"),
    panel.background = element_rect(fill = "black"),
    plot.margin = margin(20, 20, 20, 20),
    legend.position = "right",  # Posicionando a legenda à direita
    legend.title = element_text(size = 14, face = "bold", color = "white"),
    legend.text = element_text(size = 12, color = "white")
  ) +
  
  # Adicionando uma linha de tendência (linha polida) e efeitos de transição
  geom_smooth(method = "loess", se = FALSE, color = "yellow", linetype = "solid", size = 1.5) +
  
  # Adicionando uma camada de efeito de brilho nos pontos
  geom_point(aes(color = SP.DYN.CBRT.IN), 
             size = 6, 
             shape = 21, 
             stroke = 1.5, 
             alpha = 0.7, 
             fill = "white")  # Preenchendo os pontos com branco

# Exibindo o gráfico
print(grafpainel)

