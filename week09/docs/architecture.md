# 🏗️ Architecture（架構設計）

## 系統流程


User Query
↓
Hybrid Retrieval（BM25 + Vector）
↓
Top-K Documents
↓
Reranker（Cross Encoder）
↓
LLM Generation
↓
Final Answer（with Sources）


---

## Data Ingestion（ETL）
- Wiki / Reddit / Patch Notes
- Web Scraping + API
- Clean → Structured Text

👉 非結構 → 向量化邊界：Chunking 後

---

## Chunking
- 500 tokens
- overlap 50
- Markdown + semantic split

---

## Embedding
- BGE-M3

---

## Vector DB
- FAISS / Chroma

---

## Retrieval
- BM25 + Vector Hybrid

---

## Reranker（重要🔥）
- Cross Encoder
- 介於 Retrieval → LLM
