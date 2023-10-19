variable "a_record_name" {
  type        = string
  description = "The name of the record."
  default     = "a-record"
}

variable "c_record_name" {
  type        = string
  description = "The name of the record."
  default     = "www"
}

variable "a_record_ttl" {
  type        = number
  description = "The TTL of the record."
  default     = 300
}

variable "c_record_ttl" {
  type        = number
  description = "The TTL of the record."
  default     = 10
}

variable "c_record_weight" {
  type        = number
  description = "A numeric value indicating the relative weight of the record."
  default     = 90
}

variable "c_record_set_identifier" {
  type        = string
  description = "Unique identifier to differentiate records with routing policies from one another."
  default     = "live"
}

variable "a_record_records" {
  type        = list(string)
  description = "A string list of records."
  default     = ["10.200.30.20"]
}

variable "c_record_records" {
  type        = list(string)
  description = "A string list of records."
  default     = ["live.example.com"]
}

variable "elb_name" {
  type        = string
  description = "Name of the elb"
  default     = "complete-example-r53-record-elb"
}

variable "instance_port" {
  type        = number
  description = "The instance traffice port"
  default     = 5000
}

variable "instance_protocol" {
  type        = string
  description = "Traffic protocol to instance"
  default     = "http"
}

variable "lb_port" {
  type        = number
  description = "The load balancer port"
  default     = 80
}

variable "lb_protocol" {
  type        = string
  description = "The load balancer traffic protocol"
  default     = "http"
}

variable "evaluate_target_health" {
  type        = bool
  description = "Whether you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set"
  default     = true
}

variable "alias_name" {
  type        = string
  description = "The name of the alias record."
  default     = "alias-record"
}

variable "supporting_name" {
  type        = string
  description = "The name of the vpc for load balancer"
  default     = "boldlink-r53-records-example.com"
}


variable "general_record_type" {
  type        = string
  description = "Record type to be used for a number of records"
  default     = "A"
}

variable "geo_records" {
  type        = list(string)
  description = "List of records"
  default     = ["10.0.0.1", "10.0.0.2"]
}

variable "geo_record_ttl" {
  type        = number
  description = "TTL of geo record"
  default     = 120
}

variable "geo_record_name" {
  type        = string
  description = "Name of geo record"
  default     = "geo"
}

variable "allow_overwrite" {
  type        = bool
  description = "Allow creation of this record in Terraform to overwrite an existing record"
  default     = true
}

variable "geo_set_identifier" {
  type        = string
  description = "Unique Identifier of the record"
  default     = "us-ca"
}

variable "country" {
  type        = string
  description = "Country for geo record policy"
  default     = "US"
}

variable "subdivision" {
  type        = string
  description = "Subdivision for geo record policy"
  default     = "CA"
}
