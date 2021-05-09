"%>%" <- magrittr::"%>%"

# BASE DE DADOS DA WHO DE OBESIDADE--------------------------------------------

# Lendo a base de dados e renomeando as colunas
# Variavel Prevalence of obesity among adults, BMI>30(age-standardized estimate) (%)

BaseDados <-
  readr::read_csv("data-raw/NCD_BMI_30A.csv",
                  col_names = TRUE
  ) %>%
  dplyr::select("X1", "2016", "2015", "2014", "2013", "2012", "2011",
                "2010", "2009", "2008", "2007", "2006", "2005", "2004", "2003",
                "2002", "2001", "2000") %>%
  dplyr::slice(4:198) %>%
  dplyr::rename(
    País = `X1`,
    "IMC>30_2016" = `2016`,
    "IMC>30_2015" = `2015`,
    "IMC>30_2014" = `2014`,
    "IMC>30_2013" = `2013`,
    "IMC>30_2012" = `2012`,
    "IMC>30_2011" = `2011`,
    "IMC>30_2010" = `2010`,
    "IMC>30_2009" = `2009`,
    "IMC>30_2008" = `2008`,
    "IMC>30_2007" = `2007`,
    "IMC>30_2006" = `2006`,
    "IMC>30_2005" = `2005`,
    "IMC>30_2004" = `2004`,
    "IMC>30_2003" = `2003`,
    "IMC>30_2002" = `2002`,
    "IMC>30_2001" = `2001`,
    "IMC>30_2000" = `2000`
  )

# Arrumando a linhas com stringr

Obesidade <- BaseDados %>%  dplyr::mutate(
    `IMC>30_2016` = stringr::str_remove_all(`IMC>30_2016`, "\\[.*\\]"),
    `IMC>30_2015` = stringr::str_remove_all(`IMC>30_2015`, "\\[.*\\]"),
    `IMC>30_2014` = stringr::str_remove_all(`IMC>30_2014`, "\\[.*\\]"),
    `IMC>30_2013` = stringr::str_remove_all(`IMC>30_2013`, "\\[.*\\]"),
    `IMC>30_2012` = stringr::str_remove_all(`IMC>30_2012`, "\\[.*\\]"),
    `IMC>30_2011` = stringr::str_remove_all(`IMC>30_2011`, "\\[.*\\]"),
    `IMC>30_2010` = stringr::str_remove_all(`IMC>30_2010`, "\\[.*\\]"),
    `IMC>30_2009` = stringr::str_remove_all(`IMC>30_2009`, "\\[.*\\]"),
    `IMC>30_2008` = stringr::str_remove_all(`IMC>30_2008`, "\\[.*\\]"),
    `IMC>30_2007` = stringr::str_remove_all(`IMC>30_2007`, "\\[.*\\]"),
    `IMC>30_2006` = stringr::str_remove_all(`IMC>30_2006`, "\\[.*\\]"),
    `IMC>30_2005` = stringr::str_remove_all(`IMC>30_2005`, "\\[.*\\]"),
    `IMC>30_2004` = stringr::str_remove_all(`IMC>30_2004`, "\\[.*\\]"),
    `IMC>30_2003` = stringr::str_remove_all(`IMC>30_2003`, "\\[.*\\]"),
    `IMC>30_2002` = stringr::str_remove_all(`IMC>30_2002`, "\\[.*\\]"),
    `IMC>30_2001` = stringr::str_remove_all(`IMC>30_2001`, "\\[.*\\]"),
    `IMC>30_2000` = stringr::str_remove_all(`IMC>30_2000`, "\\[.*\\]")
    ) %>%
  tibble::glimpse()

readr::write_rds(x = Obesidade, file = "data/obesidade.rds")

#   dplyr::mutate(
#     # Atribuindo as caracteristicas de cada vetor
#     obes_ambos_sexos = as.numeric(obes_ambos_sexos),
#     obes_masc = as.double(obes_masc),
#     obes_fem = as.double(obes_fem)




