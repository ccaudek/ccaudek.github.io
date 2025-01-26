library(htmltools)
library(stringr)
library(dplyr)
library(readr)
library(fontawesome)

knitr::opts_chunk$set(
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  fig.retina = 3,
  comment = "#>"
)

make_icons <- function(pub) {
  html <- c()
  if (pub$summary) {
    html <- c(html, as.character(icon_link(
      icon = "fas fa-external-link-alt",
      text = "Summary",
      url = pub$url_summary,
      class = "icon-link-summary",
      target = "_self"
    )))
  }
  if (!is.na(pub$url_pub)) {
    html <- c(html, as.character(icon_link(
      icon = "fas fa-external-link-alt",
      text = "View",
      url  = pub$url_pub
    )))
  }
  if (!is.na(pub$url_pdf)) {
    html <- c(html, as.character(icon_link(
      icon = "fa fa-file-pdf",
      text = "PDF",
      url  = pub$url_pdf
    )))
  }
  if (!is.na(pub$url_repo)) {
    html <- c(html, as.character(icon_link(
      icon = "fab fa-github",
      text = "Code & Data",
      url  = pub$url_repo
    )))
  }
  if (!is.na(pub$url_other)) {
    html <- c(html, as.character(icon_link(
      icon = "fas fa-external-link-alt",
      text = pub$other_label,
      url  = pub$url_other
    )))
  }
  if (!is.na(pub$url_rg)) {
    html <- c(html, as.character(icon_link(
      icon = "ai ai-researchgate",
      # text = "&nbsp;",
      text = "RG",
      url  = pub$url_rg
    )))
  }
  if (!is.na(pub$url_scholar)) {
    html <- c(html, as.character(icon_link(
      icon = "ai ai-google-scholar",
      # text = "&nbsp;",
      text = "Scholar",
      url  = pub$url_scholar
    )))
  }
  return(paste(html, collapse = ""))
}

# The icon_link() function is in {distilltools}, but I've modified this
# one to include  a custom class to be able to have more control over the
# CSS and an optional target argument

icon_link <- function(
    icon = NULL,
    text = NULL,
    url = NULL,
    class = "icon-link",
    target = "_blank") {
  if (!is.null(icon)) {
    text <- make_icon_text(icon, text)
  }
  return(htmltools::a(
    href = url, text, class = class, target = target, rel = "noopener"
  ))
}

make_icon_text <- function(icon, text) {
  return(HTML(paste0(make_icon(icon), " ", text)))
}

make_icon <- function(icon) {
  return(tag("i", list(class = icon)))
}

last_updated <- function() {
  return(span(
    paste0(
      "Last updated on ",
      format(Sys.Date(), format = "%B %d, %Y")
    ),
    style = "font-size:0.8rem;"
  ))
}
