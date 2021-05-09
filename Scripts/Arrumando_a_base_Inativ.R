"%>%" <- magrittr::"%>%"

# BASE DE DADOS DA WHO DE INATIVIDADE FÍSICA------------------------------------

# Lendo a base de dados

base_dados_bruta <-
  readr::read_csv("data-raw/NCD_PAA.csv",
                  col_names = TRUE,
                  skip = 1
                  ) %>%
  dplyr::glimpse()

# Arrumando a base de dados

base_de_dados <-
  # Selecionando as colunas que serão utilizadas na analise.
  base_dados_bruta %>%
  dplyr::select(Country,
                Year,
                `Age Group`,
                `Both sexes`,
                Male,
                Female
  ) %>%
  dplyr::rename(
    # Renomeando as colunas que serão utilizadas na analise.
    "Pais" = Country,
    "Ano" = Year,
    "Grupo_de_idade" = `Age Group`,
    "Ina_ambos_sexos" = `Both sexes`,
    "Ina_masc" = Male,
    "Ina_fem" = Female
  ) %>%
  dplyr::mutate(
    # Arrumando as linhas (stringr)
    Ina_ambos_sexos = stringr::str_remove_all(Ina_ambos_sexos, "\\[.*\\]"),
    Ina_ambos_sexos = stringr::str_replace_all(Ina_ambos_sexos, "No data", "NA"),
    Ina_masc = stringr::str_remove_all(Ina_masc, "\\[.*\\]"),
    Ina_masc = stringr::str_replace_all(Ina_masc, "No data", "NA"),
    Ina_fem = stringr::str_remove_all(Ina_fem, "\\[.*\\]"),
    Ina_fem = stringr::str_replace_all(Ina_fem, "No data", "NA")
  ) %>%
  dplyr::mutate(
    # Atribuindo as caracteristicas de cada vetor
    "Pais" = as.character(Pais),
    "Ano" = as.double(Ano),
    "Grupo_de_idade" = as.character(Grupo_de_idade),
    "Ina_ambos_sexos" = as.numeric(Ina_ambos_sexos),
    "Ina_masc" = as.numeric(Ina_masc),
    "Ina_fem" = as.numeric(Ina_fem),
  ) %>%
  dplyr::glimpse()

readr::write_rds(x = base_de_dados, file = "data/inatividade_fisica.rds")
