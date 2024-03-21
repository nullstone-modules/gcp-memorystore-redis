variable "redis_version" {
  type        = string
  default     = "6.x"
  description = <<EOF
Redis engine version.
Available choices: 3.2, 4.0, 5.0, 6.x
Defaults to 6.x.
EOF
}

variable "memory" {
  type        = number
  default     = 1
  description = <<EOF
The amount of memory (in GiB) reserved for the redis instance.
This defaults to 1 GiB.
EOF
}
