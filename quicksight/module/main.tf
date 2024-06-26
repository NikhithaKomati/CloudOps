

# QuickSight User
resource "aws_quicksight_user" "example_user" {
  email         = var.email
  namespace     = "default"
  user_role     = var.user_role
  identity_type = var.identity_type
}

# Create an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = var.s3_bucket_name
}

# Upload a file to the S3 bucket
resource "aws_s3_object" "example_file" {
  bucket = aws_s3_bucket.example_bucket.id
  key    = "students.csv"
  source = "/home/komatinikhitha/Downloads/students.csv"
}

# QuickSight Data Source
resource "aws_quicksight_data_source" "example_data_source" {
  data_source_id = var.data_source_id
  name           = var.data_source_name
  parameters {
    s3 {
      manifest_file_location {
        bucket = var.s3_bucket_name
        key    = "students.csv"
      }
    }
  }
  type = "S3"
  tags=var.name_tags
}

# QuickSight Data Set
resource "aws_quicksight_data_set" "example_data_set" {
  data_set_id = var.data_set_id
  name        = var.data_set_name
  import_mode = "SPICE"
  physical_table_map {
    physical_table_map_id = "example-id"
    s3_source {
      data_source_arn = aws_quicksight_data_source.example_data_source.arn
      input_columns {
        name = "column1"
        type = "INTEGER"
      }
      input_columns {
        name = "column2"
        type = "STRING"
      }
      upload_settings {
        format = "CSV"
      }
    }
  }
}

# QuickSight Analysis
resource "aws_quicksight_analysis" "example_analysis" {
  analysis_id = var.analysis_id
  name        = var.analysis_name
  definition {
    data_set_identifiers_declarations {
      data_set_arn = aws_quicksight_data_set.example_data_set.arn
      identifier   = "1"
    }
  }
}

# QuickSight Dashboard
resource "aws_quicksight_dashboard" "example_dashboard" {
  dashboard_id        = var.dashboard_id
  name                = var.dashboard_name
  version_description = "version"
  definition {
    data_set_identifiers_declarations {
      data_set_arn = aws_quicksight_data_set.example_data_set.arn
      identifier   = "1"
    }
  }
}


