"%>%" <- magrittr::"%>%"

# Lendo a base de obesidade

Obesidade <- readr::read_rds("data/obesidade.rds")


Obesidade %>%
  dplyr::filter(
    País == "Brazil"
  ) %>%
  tidyr::pivot_longer(cols = everything()) %>%
  dplyr::slice(2:19) %>%
  ggplot2::ggplot(mapping = ggplot2::aes(x = name,
                                         y = value,
                                         fill = name)) +
  ggplot2::geom_col(na.rm = TRUE, show.legend = TRUE) +
  ggplot2::scale_x_discrete(breaks = c(2016, 2000, 10)) +
  ggplot2::labs(title = "Figura 3. Percentual da população brasileira com obesidade (IMC>30kg/m²)",
                x = "",
                y = "Percentual da população com IMC>30kg/m²") +
  ggplot2::theme(plot.title = (ggplot2::element_text(hjust = 0.5,
                                                     size = 18,
                                                     face = "bold")),
                 axis.title = (ggplot2::element_text(size = 12,
                                                     face = "bold"))
  )
