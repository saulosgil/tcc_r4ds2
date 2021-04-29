"%>%" <- magrittr::"%>%"

# Lendo a base

inatividade_fisica <-
  readr::read_rds("data/inatividade_fisica.rds") %>%
  dplyr::glimpse()

grafico <-
  inatividade_fisica %>%
  dplyr::filter(!is.na(Ina_ambos_sexos)) %>%
  dplyr::arrange(Ina_ambos_sexos, desc = TRUE) %>%
  dplyr::slice_tail(n = 10)

grafico %>%
  ggplot2::ggplot(
    mapping = ggplot2::aes(
      x = Ina_ambos_sexos,
      y = forcats::fct_reorder(Pais, Ina_ambos_sexos, .desc = FALSE),
      color = "blue",
      fill = Pais
    )) +
  ggplot2::geom_col(show.legend = FALSE) +
  ggplot2::scale_fill_discrete(type = viridis::turbo(n = 10)) +
  ggplot2::scale_x_continuous(limits = c(0, 80)) +
  ggplot2::labs(
    x = "Prevalência de Inatividade Física na População (%)",
    y = " ",
    title = "Lista dos 10 Países Com Maior Prevalência de Inatividade Física"
    ) +
  ggplot2::theme_light() +
  ggplot2::theme(plot.title = (ggplot2::element_text(hjust = 0.5,
                                                     size = 18,
                                                     face = "bold")),
                 axis.title = (ggplot2::element_text(size = 12,
                                                     face = "bold")))

ggplot2::ggsave("Graficos/Maiores_taxas_inat.png", width = 10, height = 5)

