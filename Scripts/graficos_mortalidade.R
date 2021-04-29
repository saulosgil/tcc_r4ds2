"%>%" <- magrittr::"%>%"

# Lendo a base

base <-
  readr::read_rds("data/mortalidade.rds") %>%
  dplyr::glimpse()

# Grafico dos 10 paises com maior taxa de mortalidade

MaiorMort <-
  base %>%
  dplyr::arrange(Mort_ambos_sexos) %>%
  dplyr::slice_tail(n = 10) %>%
  ggplot2::ggplot(
    mapping = ggplot2::aes(x = Mort_ambos_sexos,
                           y = forcats::fct_reorder(
                             Pais, Mort_ambos_sexos,.desc = FALSE,),
                           fill = Pais,
                           color = "#000000")) +
  ggplot2::geom_col(na.rm = TRUE, show.legend = FALSE) +
  ggplot2::labs(title = "Lista dos 10 Países Com Maior Taxa de Mortalidade",
                x = "Probabilidade de morte entre 15 e 60 anos por 1000 habitantes",
                y = " ") +
  ggplot2::theme_light() +
  ggplot2::theme(plot.title = (ggplot2::element_text(hjust = 0.5,
                                                     size = 18,
                                                     face = "bold")),
                 axis.title = (ggplot2::element_text(size = 12,
                                                     face = "bold"))
  )

MaiorMort

# Grafico dos 10 paises com menor taxa de mortalidade

MenorMort <-
  base %>%
  dplyr::arrange(Mort_ambos_sexos) %>%
  dplyr::slice_head(n = 10) %>%
  ggplot2::ggplot(
    mapping = ggplot2::aes(x = Mort_ambos_sexos,
                           y = forcats::fct_reorder(
                             Pais, Mort_ambos_sexos,.desc = TRUE),
                           fill = Pais,
                           color = "#000000")) +
  ggplot2::geom_col(na.rm = TRUE, show.legend = FALSE) +
  ggplot2::scale_x_continuous(limits = c(0,75))+
  ggplot2::labs(title = "Lista dos 10 Países Com Menor Taxa de Mortalidade",
                x = "Probabilidade de morte entre 15 e 60 anos por 1000 habitantes",
                y = " ") +
  ggplot2::theme_light() +
  ggplot2::theme(plot.title = (ggplot2::element_text(hjust = 0.5,
                                                     size = 18,
                                                     face = "bold")),
                 axis.title = (ggplot2::element_text(size = 12,
                                                     face = "bold"))
  )

MenorMort























