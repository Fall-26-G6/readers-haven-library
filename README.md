# Readers' Haven Public Library

A small static website for a fictional city library, built for DevOps Assignment 02 (Docker).
Plain HTML and CSS only. Node.js and Parcel are used purely as build tools, and the final
site is served by Nginx inside a multi-stage Docker image.

## Pages
`index.html` (Home), `collections.html`, `membership.html`, `services.html`, `contact.html`
(all in `src/`, sharing `styles/style.css`).

## Build locally
```bash
npm ci
npm run build      # output goes to dist/
```

## Run with Docker
```bash
docker image build -t <dockerhub-username>/readers-haven:v1 .
docker container run -d --name haven-demo -p 8080:80 <dockerhub-username>/readers-haven:v1
```
Then open http://localhost:8080

## Branching
`main` (production) <- `release/v2.0` <- `develop` <- `feature/<page-name>`
All changes go through Pull Requests (2 approvals into `develop`, 3 into `main`).
