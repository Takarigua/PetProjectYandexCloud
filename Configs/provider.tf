terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "y0__xDai6b9BRjB3RMgjqOmuBKA7FO1KT254d3_WdtnyHtH_gXUuA"
  cloud_id  = "b1gi2v2rq2mddcjaavoo"
  folder_id = "b1goqt6395pbqs0t7sa4"
  zone      = "ru-central1-a"
} 
