
"%>%" <- magrittr::"%>%"

# Lendo a base de dados

base_dados_bruta <-
  readr::read_csv("data-raw/NCD_PAA.csv",
                  col_names = TRUE,
                  # col_types = "cdcnnnnn",
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
    "Grupo de idade" = as.character("Grupo de idade"),
    "Ina_ambos_sexos" = as.double(Ina_ambos_sexos),
    "Ina_masc" = as.double(Ina_masc),
    "Ina_fem" = as.double(Ina_fem),
  ) %>%
  dplyr::glimpse() %>%
  tibble::view()

readr::write_rds(x = base_de_dados, file = "data/base_de_dados.rds")
