
locals {
  high_or_low = var.random > 0.5 ? "better than 50/50" : "worse than 50/50"
  no_directive = "The answer is ${local.high_or_low}"
}