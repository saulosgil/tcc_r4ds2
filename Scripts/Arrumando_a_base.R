
# Lendo a base de dados

base_dados_bruta <-
  readr::read_csv("data-raw/NCD_PAA.csv",
                  col_names = TRUE,
                  skip = 1) %>%
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
    "Inatividade_física_em_ambos_os_sexos (% [ajustado pela idade])" = `Both sexes`,
    "Inatividade_física_no_sexo_masculino (% [ajustado pela idade])" = Male,
    "Inatividade_física_no_sexo_feminino (% [ajustado pela idade])" = Female
  ) %>%
  dplyr::glimpse()

View(base_de_dados)

