resource "yandex_compute_snapshot" "web-server-1-snapshot" {
  source_disk_id = yandex_compute_instance.web-server-1.boot_disk.0.disk_id
}

resource "yandex_compute_snapshot" "web-server-2-snapshot" {
  source_disk_id = yandex_compute_instance.web-server-2.boot_disk.0.disk_id
}
