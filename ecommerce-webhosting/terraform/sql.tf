# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

locals {
  db_instance_name = "postgres-ecommerce-${random_id.db_name_suffix.hex}"
}

resource "random_id" "db_name_suffix" {
  byte_length = 2
}

resource "google_sql_database_instance" "main_instance" {
  name                = "${local.db_instance_name}-${var.region}"
  region              = var.region
  database_version    = "POSTGRES_14"
  deletion_protection = false # not recommended for PROD

  settings {
    tier              = "db-f1-micro"
    user_labels       = local.resource_labels

    ip_configuration {
      ipv4_enabled    = true
      private_network = google_compute_network.default.self_link
    }
  }

  depends_on = [google_service_networking_connection.private_service_connection]
}