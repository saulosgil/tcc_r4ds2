"%>%" <- magrittr::"%>%"

# Lendo a base

inatividade_fisica <-
  readr::read_rds("data/inatividade_fisica.rds") %>%
  dplyr::glimpse()

grafico <-
  inatividade_fisica %>%
  dplyr::filter(!is.na(Ina_ambos_sexos)) %>%
  dplyr::arrange(Ina_ambos_sexos, desc = TRUE) %>%
  dplyr::slice_head(n = 10)


grafico %>%
  ggplot2::ggplot(
    mapping = ggplot2::aes(
      x = Ina_ambos_sexos,
      y = forcats::fct_reorder(Pais, Ina_ambos_sexos, .desc = FALSE),
      color = "blue",
      fill = Pais
    )) +
  ggplot2::geom_col(show.legend = FALSE) +
  ggplot2::scale_x_continuous(breaks = seq(from = 0, to = 12, by = 3)) +
  ggplot2::labs(
    x = "Prevalência de Inatividade Física na População (%)",
    y = " ",
    title = "10 Países Com Menor Prevalência de Inatividade Física"
    ) +
  ggplot2::theme(plot.title = (ggplot2::element_text(hjust = 0.5)))




  # ggplot2::theme(
  #   ggplot2::plot.title = element_text(hjust = 1.0),
  #   ggplot2::plot.subtitle = element_text(hjust = 1.0)
  #   )




