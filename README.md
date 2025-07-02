# 🎵 Spotify Clone CI/CD Pipeline

![Demo](./images/SpotifyDemo.gif)

## 🚀 Project Overview

This project demonstrates a fully automated **CI/CD pipeline** used to deploy a front-end **Spotify clone**. The application is built, tested, and deployed using Jenkins and Docker, with added layers of **security scanning** and **monitoring**.

The final application is hosted at:  
🌐 [https://spotify.focusarchive.co](https://spotify.focusarchive.co)

## 🔗 Spotify API Integration

This application is powered by the **Spotify Web API**, enabling:

- **Secure OAuth login** with real Spotify accounts
- **Full playback access** from the user’s own Spotify library
- Fetching of **playlists, recently played tracks, album art**, and more

To enable these features, a secure domain (HTTPS) is required for authentication and redirect URIs.

## 🧰 Tech Stack

| Category            | Tools & Technologies                                |
|---------------------|-----------------------------------------------------|
| **CI/CD**           | Jenkins (Pipeline project)                          |
| **Containerization**| Docker                                              |
| **Security**        | Trivy, SonarQube, OWASP Dependency Check            |
| **Monitoring**      | Prometheus, Grafana, Node Exporter                  |
| **Infrastructure**  | AWS EC2 (Ubuntu), Elastic IP                        |
| **Reverse Proxy**   | Nginx + Certbot (SSL HTTPS setup)                   |
| **Frontend App**    | React-based Spotify Clone (OAuth-enabled)           |

## 🔄 Pipeline Flow

1. **Workspace Cleanup** – Ensures no residual files from previous builds.
2. **Code Checkout** – Pulls the latest version from a personal GitHub repo.
3. **Static Code Analysis** – Uses SonarQube to scan for code quality and enforce a quality gate.
4. **OWASP Dependency Check** – Scans the app for vulnerabilities based on the OWASP Top 10.
5. **Docker Image Build** – Creates a container image for the app.
6. **Trivy Container Scan** – Scans the Docker image for OS/package vulnerabilities.
7. **Deployment** – Deploys the container to an Ubuntu EC2 instance on port 3000.
8. **Live App** – Served securely via HTTPS using a reverse proxy at `spotify.focusarchive.co`.

## 💡 Notes

- The pipeline completes in under **5 minutes**.
- All configurations and environments are separated across **three dedicated EC2 servers** for optimized performance and resource usage.
- The project is a demonstration — not all setup steps are included in detail.

---

Let me know if you want to include `.env` instructions for setting up your own Spotify credentials or how to register an app on Spotify Developer Dashboard.
