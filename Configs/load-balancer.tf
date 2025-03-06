resource "yandex_alb_target_group" "web-target-group" {
  name = "web-target-group"

  target {
    subnet_id  = yandex_vpc_subnet.subnet-a.id
    ip_address = yandex_compute_instance.web-server-1.network_interface.0.ip_address
  }

  target {
    subnet_id  = yandex_vpc_subnet.subnet-b.id
    ip_address = yandex_compute_instance.web-server-2.network_interface.0.ip_address
  }
}

resource "yandex_alb_backend_group" "web-backend-group" {
  name = "web-backend-group"

  http_backend {
    name             = "web-backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_alb_target_group.web-target-group.id]
    healthcheck {
      timeout  = "10s"
      interval = "2s"
      http_healthcheck {
        path = "/"
      }
    }
  }
}

resource "yandex_alb_http_router" "web-router" {
  name = "web-router"
}

resource "yandex_alb_virtual_host" "web-host" {
  name           = "web-host"
  http_router_id = yandex_alb_http_router.web-router.id

  route {
    name = "web-route"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.web-backend-group.id
      }
    }
  }
}

resource "yandex_alb_load_balancer" "web-balancer" {
  name = "web-balancer"

  network_id = yandex_vpc_network.network.id

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.subnet-a.id
    }
  }

  listener {
    name = "web-listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.web-router.id
      }
    }
  }
}
