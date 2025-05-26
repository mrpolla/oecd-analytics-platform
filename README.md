# 📊 OECD Data Analytics Platform

A modular, on-premise data analytics platform for processing, querying, and visualizing OECD productivity data using Apache NiFi, PostgreSQL, MinIO, FastAPI, and optional LLM integration.

## 🌐 Overview

This platform automates the ingestion, transformation, and analysis of OECD economic indicators (e.g., productivity data) from the SDMX API. It supports batch processing, a REST API for querying the data, and integration with large language models (LLMs) for natural language insights.

---

## 🛠 Tech Stack

| Layer          | Technology                                |
| -------------- | ----------------------------------------- |
| Data Ingestion | Apache NiFi (Docker)                      |
| Storage        | MinIO (S3-compatible)                     |
| Transformation | Python (Pandas, JOLT optional)            |
| Database       | PostgreSQL                                |
| API Service    | FastAPI                                   |
| Visualization  | [TBD] React / Superset                    |
| LLM (optional) | GPT-4 / LLaMA / Mistral (local or remote) |
| CI/CD          | GitLab CI, Jenkins (planned)              |

---

## 📦 Features

- 🚀 **Automated ETL** with NiFi
- 💾 **Data lake storage** using MinIO
- 🧮 **PostgreSQL analytics-ready schema**
- 🔍 **REST API** (FastAPI) for querying:
  - `/countries`
  - `/industries`
  - `/productivity/{country_code}`
  - `/productivity/compare?countries=...`
  - `/trends/{country_code}`
  - `/summary/germany` (custom use case)
- 🧠 Optional: Ask LLMs natural questions like  
  “What was Germany’s productivity growth in 2023?”

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/YOUR_USERNAME/oecd-analytics-platform.git
cd oecd-analytics-platform
```

### 2. Set Up Environment Variables

Create a `.env` file with the following:

```env
# PostgreSQL
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=oecd_analytics
POSTGRES_USER=your_user
POSTGRES_PASSWORD=your_password

# MinIO
MINIO_ENDPOINT=localhost:9000
MINIO_ACCESS_KEY=minioadmin
MINIO_SECRET_KEY=minioadmin
```

### 3. Launch NiFi and MinIO (Docker)

```bash
docker-compose up -d
```

### 4. Download and Upload OECD Data

Fetch JSON from SDMX API and upload to MinIO under:

```
bucket: oecd-raw-data
prefix: oecd/productivity/
```

### 5. Process the Data

```bash
python etl/process_oecd_productivity.py
```

### 6. Start the FastAPI Server

```bash
cd microservices/api
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

Go to [http://localhost:8000/docs](http://localhost:8000/docs) for interactive API documentation.

---

## 📈 Example Endpoints

- `GET /countries` – List of all countries in the dataset
- `GET /industries` – Available industries
- `GET /productivity/DEU` – Germany’s productivity data
- `GET /productivity/compare?countries=DEU,FRA,ESP`
- `GET /summary/germany` – Prebuilt German dashboard data

---

## 📊 Roadmap

- [x] Batch ingestion with NiFi + MinIO
- [x] PostgreSQL schema and ETL
- [x] FastAPI backend with analytics endpoints
- [ ] React-based visualization dashboard
- [ ] LLM endpoint integration (`/ask`)
- [ ] CI/CD with GitLab + Jenkins
- [ ] Dockerized deployment
- [ ] LLM grounding on structured PostgreSQL results

---

## 📂 Project Structure

```
.
├── etl/                      # ETL scripts (JSON → PostgreSQL)
├── microservices/
│   └── api/                  # FastAPI microservice
├── data/                     # OECD JSON sample files (optional)
├── docker-compose.yml        # Runs NiFi + MinIO
├── .env                      # Local environment config
└── README.md
```

---

## 📄 License

MIT License. See `LICENSE`.

---

## 🙋‍♂️ Author

**Murilo Polla**  
Built as part of an on-premise, AI-driven OECD analytics pipeline.  
Interested in circularity, sustainability, and responsible AI.
