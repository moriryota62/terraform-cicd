variable "base_name" {
  description = "リソース群に付与する接頭語"
  type        = string
}

variable "tags" {
  description = "リソース群に付与するタグ"
  type        = map(string)
}