variable "num" {
    description = " a number suffix"
    type = number
}
variable "location" {
    description = "global region for az resources"
}
variable "credit" {
    description = "provide credit value"
    validation {
        condition = length(var.credit) > 3
        error_message = "give atleast a 3 digit number"
    }
}
variable "environment" {
    description = "The environment short name to use for the deployed resources."
    validation {
        condition = can(regex("^dev|^DEV", var.environment))
        error_message = "invalid env name"
    }
}