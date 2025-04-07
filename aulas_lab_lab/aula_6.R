# TAREFA:

library(WDI)

options(scipen = 999)
birthrateAUTSerieTemporal <- WDI(country = "AUT", 
                                 indicator = "c", 
                                 start = 2000, 
                                 end = 2023)

options(scipen = 999)
birthrateDadosEmPainel <- WDI(country = "all", 
                              indicator = "SP.DYN.CBRT.IN", 
                              start = "1990", 
                              end = "2023")

options(scipen = 999)
birthrateCorteTransversal <- WDI(country = 'all', 
                                 indicator = 'SP.DYN.CBRT.IN', 
                                 start = '2021', 
                                 end = '2021')
# FAZER GRAFICOS -- ggplot2 (tidyverse)

library(tidyverse)

grafpainel <- ggplot(birthrateDadosEmPainel,
                     mapping = aes(y = SP.DYN.CBRT.IN,
                                   x = year)) +
  geom_point()
print(grafpainel)



grafserietemporal <- ggplot(birthrateAUTSerieTemporal,
                     mapping = aes(y = SP.DYN.CBRT.IN,
                                   x = year)) +
  geom_point()
print(grafserietemporal)


grafcortetransversal <- ggplot(birthrateCorteTransversal,
                            mapping = aes(y = SP.DYN.CBRT.IN,
                                          x = year)) +
  geom_point()
print(grafcortetransversal)