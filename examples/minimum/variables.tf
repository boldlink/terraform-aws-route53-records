variable "name" {
  type        = string
  description = "Name of the record"
  default     = "www.minimum-example.com"
}

variable "type" {
  type        = string
  description = "Type of the record"
  default     = "A"
}

variable "ttl" {
  type        = number
  description = "Time to live for the record"
  default     = 60
}

variable "records" {
  type        = list(string)
  description = "Records for the record"
  default     = ["10.0.0.0"]
}

variable "zone_name" {
  type        = string
  description = "The name of the hosted zone"
  default     = "boldlink-r53-records-example.com"
}
