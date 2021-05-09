"%>%" <- magrittr::"%>%"

# Lendo a raw-data de mortalidade

base <-
  readr::read_csv("data-raw/data_mortality.csv",
                  skip = 1)

# Verificando posição do Brasil considerando todos os paises

posicao_br <- base %>%
  dplyr::filter(Year == 2016) %>%
  dplyr::arrange(`Both sexes`, .desc = TRUE)

pos_br_rmd <- which(posicao_br$Country %in% "Brazil")

# Tabela todos paises do mundo

base %>%
  dplyr::filter(Year == "2016") %>%
  dplyr::select(Country, "Both sexes", Male, Female) %>%
  knitr::kable(
    format = "html",
    col.names = c("País", "Ambos sexos", "Homem", "Mulher"),
    align = "cccc",
    caption = "Tabela 1. Probabilidade de morte entre 15 e 60 anos por 1000 habitantes.",
    format.args = list(big.mark = ",")
  )

# Organizando os paises da america latina

br <- base %>% dplyr::filter(Country == "Brazil")
arg <- base %>% dplyr::filter(Country == "Argentina")
bol <- base %>% dplyr::filter(Country == "Bolivia (Plurinational State of)")
ur <- base %>% dplyr::filter(Country == "Uruguay")
ch <- base %>% dplyr::filter(Country == "Chile")
ven <- base %>% dplyr::filter(Country == "Venezuela (Bolivarian Republic of)")
col <- base %>% dplyr::filter(Country == "Colombia")
per <- base %>% dplyr::filter(Country == "Peru")
sur <- base %>% dplyr::filter(Country == "Suriname")
par <- base %>% dplyr::filter(Country == "Paraguay")
guy <- base %>% dplyr::filter(Country == "Guyana")

# Jutando os elementos dos paises da america latina em uma mesma base

america_sul <-
  dplyr::bind_rows(br, arg, bol, ur, ch, ven, col, per, sur, par, guy)

# Grafico de coluna dos paises da ameica latina

america_sul %>%
  ggplot2::ggplot(mapping = ggplot2::aes(x = `Both sexes`,
                                         y = forcats::fct_reorder(
                                          Country, `Both sexes`,
                                          .desc = FALSE), fill = Country)) +
  ggplot2::geom_col(na.rm = TRUE, show.legend = FALSE) +
  ggplot2::labs(title = "Figura 1. Taxa de Mortalidade dos Países da América Latina",
                x = "Probabilidade de morte entre 15 e 60 anos por 1000 habitantes",
                y = " ") +
  ggplot2::theme_light() +
  ggplot2::theme(plot.title = (ggplot2::element_text(hjust = 0.5,
                                                     size = 18,
                                                     face = "bold")),
                 axis.title = (ggplot2::element_text(size = 12,
                                                     face = "bold"))
  )

# Grafico de linha dos paises da america latina por ano

america_sul %>%
  ggplot2::ggplot(mapping = ggplot2::aes(x = Year,
                                         y = `Both sexes`,
                                         color = Country)) +
  ggplot2::geom_line(na.rm = TRUE, show.legend = FALSE) +
  ggplot2::facet_wrap(~Country, ncol = 3)+
  ggplot2::labs(title = "Figura 2. Taxa de Mortalidade dos Países da América Latina entre 2000 e 2016",
                x = "",
                y = "Probabilidade de morte entre 15 e 60 anos por 1000 habitantes") +
  ggplot2::theme_light() +
  ggplot2::theme(plot.title = (ggplot2::element_text(hjust = 0.5,
                                                     size = 18,
                                                     face = "bold")),
                 axis.title = (ggplot2::element_text(size = 12,
                                                     face = "bold"))
  )
