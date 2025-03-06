resource "yandex_compute_instance" "kibana" {
  name        = "kibana"
  hostname    = "kibana.ru-central1.internal"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8kc2n656prni2cimp5" # Ubuntu 24.04 LTS
      size     = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-a.id
    nat       = true
  }

  metadata = {
    ssh-keys = "marchenko:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvGLP+BuqKD8ORVoS5aqnV4IT5bSYI64YhbQkY1ZBRkXJ6uq9gQlTfyrmv6WcEV7b2g/Wkfn7IS+PkNOkyxFsKJ68zsHuf+lastmvX01q4BOdYyFhWY0/mwGyvzvnW04SVIDnBuftxzR2ewKOBw6B/uzAPG+LdUEBopk4piKoCgjL3B53sAKxsZVmk6qT0fYKiGhiAbDshrtsKg2KFs+xrgLC6qX8KzT4qT8zpL6tQpEzEUCfxHYNt75c9i3yAHec+OOpEGnM4HglGjXsyPN1FF3uEjDtK517ocAz58HVCb1gIgvC/APLlym/eHT2XLkh0uAkPoJChGWcddZcic3MmVNYwop6lQy8jnP0UqmqQQsfybKmq6lA1tFVfZoGdLtaDjusEGOUeyT/XSgGZvZPv0fB68YizuXzUuwYkGeST1sF6iupDHYUzr6MsHiNxqL4PQO2I57yHZUKAV35n1ZOUNHmXi4TXa4Vwx5XRp0QDabJwV9aMRolM20os9JJaFypPnSHhSqVA6K+o6N/BsdYZLeDcSHswxr2ovpiNY8LqP/nAgkiVYLKd2x8TEl8Utd577pndM9s4SrQ/EaU6deqH+LK0WgXGmPOVZo7OAPqruMZ5WqmE7Ju4vVOGYOBG8UlJjgiVSOqll0k7O0c2aCTKgziMV+Rs//sj8CiW3YpQ3w== marchenko"
  }
}
