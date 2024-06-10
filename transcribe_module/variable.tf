
variable "aws_region" {
  description = "AWS region for transcribe resources"
  type        = string
  default = "us-east-1"
}

variable "iam_role_name" {
  description = "describing a role for the iam_role"
  default = "transcribe-role"
}

variable "transcribe_language_model_name" {
    description = "describing the transcribe language model name"
  default = "model"
}

variable "language_code" {
    description = "describing the transcribe language code"
  default = "en-US"
}
variable "base_model_name" {
    description = "describing the transcribe base model name"
  default = "NarrowBand"
}
variable "medical_vocabulary_name" {
    description = "describing the transcribe medical vocabulary name"
  default = "example-medical-vocabulary"
}
variable "name_tags" {
  description = "Tags to be applied on the naming of the Config"
  type        = map(string)
  default = {
    Name         = "my-transcribe"
    env          = "dev"
    team         = "cloudops"
    owner        = "owner name"
    owneremail   = "owner@mail.com"
    creationdate = "08-06-2024"
  }

}