# Carregar os pacotes
library(GetBCBData)
library(tidyverse)
library(scales)
library(gganimate)
library(gifski)

# Buscar a série 13081 do SGS (IPCA)
serie <- gbcbd_get_series(
  id = 13081,
  first.date = "2000-01-01",
  last.date = Sys.Date(),
  be.quiet = TRUE
)

# Construir o gráfico com animação
p <- serie %>%
  ggplot(aes(x = ref.date, y = value)) +
  geom_line(color = "#0072B2", size = 1.2) +
  geom_point(color = "#D55E00", size = 1) +
  labs(
    title = "Evolução do IPCA (SGS 13081)",
    subtitle = "Ano: {frame_time}",
    x = "Ano",
    y = "IPCA (índice)",
    caption = "Fonte: Banco Central do Brasil - Dados via GetBCBData"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", color = "#333333"),
    plot.subtitle = element_text(color = "#666666"),
    plot.caption = element_text(size = 9, color = "#999999"),
    axis.title = element_text(face = "bold")
  ) +
  scale_y_continuous(labels = comma) +
  scale_x_date(date_labels = "%Y", date_breaks = "2 years") +
  transition_reveal(ref.date)

# Gerar e salvar o gif
animate(
  p,
  renderer = gifski_renderer("ipca_evolucao.gif"),
  width = 800,
  height = 600,
  fps = 20,   # frames por segundo
  duration = 8, # duração total em segundos
  end_pause = 20 # pausa no final
)
