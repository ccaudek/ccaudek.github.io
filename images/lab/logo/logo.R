# Add labels
logo_labeled <- logo +
    # Add Labels
    geom_text(
        aes(x = hexagon_points$x[6], y = hexagon_points$y[6], label = "CAUDEK"),
        hjust = 0,
        angle = -30,
        size = 9,
        nudge_x = 0.07,
        nudge_y = -0.32,
        family = "Raleway",
        fontface = "bold",
        color = "white" # Change color to white for better visibility
    ) +
    geom_text(
        aes(x = hexagon_points$x[1], y = hexagon_points$y[1], label = "LAB"),
        hjust = 1,
        angle = 30,
        size = 9,
        nudge_x = 0.08,
        nudge_y = -0.25,
        family = "Raleway",
        fontface = "bold"
    ) +
    coord_fixed() +
    theme_void() +
    theme(
        plot.background = element_rect(fill = "transparent", colour = NA),
        panel.background = element_rect(fill = "transparent", colour = NA)
    )

ggsave("caudek_lab_logo_labeled.pdf", logo_labeled, height = 6, width = 6, bg = "transparent", device = cairo_pdf)
