"%>%" <- magrittr::"%>%"

# BASE DE DADOS DA WHO DE OBESIDADE--------------------------------------------

# Lendo a base de dados

base_dados_bruta <-
  readr::read_csv("data-raw/NCD_BMI_30A.csv",
                  col_names = TRUE,
                  skip = 3
  )

base_dados_bruta[ ,1:4] %>%
    dplyr::rename(
      "Pais" = Country,
      "obes_ambos_sexos" = `Both sexes`,
      "obes_masc" = Male,
      "obes_fem" = Female
    ) %>%
  dplyr::mutate(
    # Arrumando as linhas (stringr)
    obes_ambos_sexos = stringr::str_remove_all(obes_ambos_sexos, "\\[.*\\]"),
    obes_masc = stringr::str_remove_all(obes_masc, "\\[.*\\]"),
    obes_fem = stringr::str_remove_all(obes_fem, "\\[.*\\]")
  ) %>%
  dplyr::mutate(
    # Atribuindo as caracteristicas de cada vetor
    obes_ambos_sexos = as.numeric(obes_ambos_sexos),
    obes_masc = as.double(obes_masc),
    obes_fem = as.double(obes_fem)
    ) %>%
  View()

readr::write_rds(base_dados_bruta, file = "data/obesidade.rds")
