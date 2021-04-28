"%>%" <- magrittr::"%>%"

# BASE DE DADOS DA WHO DE MORTALIDADE-------------------------------------------

# Lendo a base de dados

base_dados_bruta <-
  readr::read_csv("data-raw/data_mortality.csv",
                  col_names = TRUE,
                  skip = 1
  ) %>%
  dplyr::rename(
      "Pais" = Country,
      "Ano" = Year,
      "Mort_ambos_sexos" = `Both sexes`,
      "Mort_masc" = Male,
      "Mort_fem" = Female
      ) %>%
  dplyr::filter(
    Ano == "2016"
  )

readr::write_rds(x = base_dados_bruta, file = "data/mortalidade.rds")


