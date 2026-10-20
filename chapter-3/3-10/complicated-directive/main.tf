locals {
  high = "better than 50/50"
  low  = "worse than 50/50"
  with_directive = join(" ", [
    "The answer is",
    "%{if var.random > 0.5}${local.high}%{else}${local.low}%{endif}"
  ])
}