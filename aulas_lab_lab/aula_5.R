# API (FORMA DE ACESSO)
# DADOS DO BANCO MUNDIAL (WORLD BANK)
# WORLD DEVELOPMENT INDICATORS (BASE DE DADOS)

library(WDI) # CARREGAR A BIBLIOTECA/PACOTE
options(scipen = 999)
basepib2 <- WDI(country = "all", 
                indicator = "NY.GDP.MKTP.CD")
# DADOS EM PAINEL - VARIOS LOCAIS E PERIODOS

options(scipen = 999)
basepib2023 <- WDI(country = "all", 
                   indicator = "NY.GDP.MKTP.CD", 
                   start = 2023, 
                   end = 2023)
# CORTE TRANSVERSAL - VARIOS LOCAIS UM PERIODO 

options(scipen = 999)
basepibBR <- WDI(country = "BR",
                 indicator = "NY.GDP.MKTP.CD", 
                 start = 1990, 
                 end = 2023)
# SERIE TEMPORAL - ALGUM ATIVO FINANCEIRO AO LONGO DO TEMPO

# TAREFA:
options(scipen = 999)
birthrateAUTSerieTemporal <- WDI(country = "AUT", 
                   indicator = "SP.DYN.CBRT.IN", 
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