# Ansible NGINX Load Balancer Infrastructure

## 📌 Project Overview

This project demonstrates an automated, containerized web infrastructure using **Docker, Ansible, and NGINX**.

Three backend NGINX web servers are configured and managed using Ansible. A separate NGINX instance acts as a **reverse proxy and load balancer**, distributing incoming HTTP requests across the backend servers.

The project also demonstrates Ansible configuration management, Jinja2 templating, Docker networking, health endpoints, idempotent automation, and infrastructure testing.

---

## 🏗️ Architecture

```text
                         Client
                           |
                           | HTTP :8080
                           v
                +----------------------+
                |   NGINX Load Balancer|
                |      loadbalancer    |
                +----------+-----------+
                           |
              +------------+------------+
              |            |            |
              v            v            v
         +---------+  +---------+  +---------+
         |  web01  |  |  web02  |  |  web03  |
         |  NGINX  |  |  NGINX  |  |  NGINX  |
         |   :80   |  |   :80   |  |   :80   |
         +---------+  +---------+  +---------+
              ^            ^            ^
              |            |            |
              +------------+------------+
                           |
                      Ansible
                           |
                    WSL Ubuntu Host
