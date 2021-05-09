"%>%" <-  magrittr::"%>%"

# Lendo a base

inat <- readr::read_rds("data/inatividade_fisica.rds") %>%
  tibble::glimpse()

inat %>%
  dplyr::filter(!is.na(Ina_ambos_sexos)) %>%
  dplyr::arrange(Ina_ambos_sexos) %>%
  dplyr::slice_tail(n = 10) %>%
  ggplot2::ggplot(mapping = ggplot2::aes(x = Ina_ambos_sexos,
                                         y = forcats::fct_reorder(
                                           Pais, Ina_ambos_sexos
                                         ),
                                         fill = Pais)) +
  ggplot2::geom_col(show.legend = FALSE) +
  ggplot2::labs(title = "Figura 1. Percentual da População Classificada como Inativa",
                x = "Percentual da população inativa (%)",
                y = " ")


