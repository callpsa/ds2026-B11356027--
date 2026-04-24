# 🧠 Albion Online 策略知識庫 RAG 系統

> 基於檢索增強生成（RAG）的 Albion Online 配裝與戰術知識系統

---

## 📌 專案簡介

本專案實作一個基於 RAG（Retrieval-Augmented Generation）的遊戲攻略問答系統，  
針對 MMORPG《Albion Online》建立一套具備「可解釋性」與「可擴展性」的知識檢索與生成系統。

使用者可透過自然語言提問，例如：

> 「弓箭手打 5v5 怎麼配裝？」

系統將：

- 檢索相關攻略資料  
- 重新排序最相關內容  
- 生成具參考來源的回答  

---

## 🎯 專案目標

- 建立遊戲策略知識庫（Wiki / Reddit / Patch Notes）  
- 提供高準確度的語意檢索（Semantic Retrieval）  
- 降低大型語言模型（LLM）產生幻覺（Hallucination）  
- 提供可解釋性（Explainable AI）  

---

## 🏗️ 系統架構


User Query
↓
Hybrid Retriever（BM25 + Vector Search）
↓
Top-K Documents
↓
Reranker（Cross Encoder）
↓
LLM（Answer Generation）
↓
Final Answer（含引用）


---

## 🔧 技術架構

| 模組 | 技術 |
|------|------|
| 資料擷取 | Web Scraping / API |
| Chunking | Hybrid（固定長度 + 語意切分） |
| Embedding | BGE-M3 |
| 向量資料庫 | FAISS / Chroma |
| 檢索 | Hybrid Search（BM25 + Vector） |
| 重排序 | Cross Encoder |
| 語言模型 | GPT / LLaMA |

---

## 📂 專案結構


albion-rag-system/
│
├── data/ # 原始資料（Wiki / Reddit）
├── processed/ # 清洗後資料
├── embeddings/ # 向量資料
├── src/
│ ├── ingestion.py # 資料收集
│ ├── chunking.py # 文本切分
│ ├── embedding.py # 向量生成
│ ├── retrieval.py # 檢索模組
│ ├── reranker.py # 重排序
│ ├── generator.py # 回答生成
│
├── evaluation/ # RAGAS 評估
├── docs/ # 架構圖、ADR、Whitepaper
└── README.md


---

## 📊 資料來源

- Albion Online Wiki  
- Reddit（r/albiononline）  
- 官方 Patch Notes  
- 玩家攻略文章  

---

## ✂️ Chunking Strategy

採用 Hybrid Chunking：

- 固定長度：500 tokens  
- Overlap：50 tokens  
- 語義切分：依裝備 / 技能 / 戰術分類  
- Markdown 結構切分（# Build / # Strategy）  

---

## 🔍 Retrieval Strategy

### Hybrid Search
- 關鍵字搜尋（BM25）  
- 向量搜尋（語意相似度）  

### Top-K
- 預設 K = 5  

---

## 🧪 評估方法

使用 RAGAS 評估系統品質：

| 指標 | 說明 |
|------|------|
| Faithfulness | 回答是否忠於來源 |
| Answer Relevancy | 回答是否相關 |
| Context Precision | 檢索內容是否精準 |

---

## ⚠️ Hallucination 解法

為降低 LLM 幻覺問題，本系統採用：

- RAG（檢索約束）  
- 顯示來源引用  
- 限制回答範圍（Context Grounding）  

---

## 🧊 Cold Start 解法

### 問題
- 新 Patch 無資料  
- 新 Build 無歷史紀錄  

### 解法
- 定期更新資料（ETL pipeline）  
- 加入官方 Patch Notes  

---

## 💡 使用範例

### Input

What is the best bow build for 5v5 PvP?


### Output

Recommended Build:

Weapon: Longbow
Armor: Cleric Robe
Strategy: Focus on AoE burst damage

Sources:
[1] Albion Wiki - Bow Build Guide
[2] Reddit Discussion Thread


---

## 🚀 如何執行（簡易流程）

```bash
# 1. 安裝套件
pip install -r requirements.txt

# 2. 資料處理
python src/ingestion.py
python src/chunking.py

# 3. 建立向量
python src/embedding.py

# 4. 啟動檢索
python src/retrieval.py
📈 未來改進
GraphRAG（技能與裝備關聯）
即時 Meta 分析
個人化推薦系統
📚 參考資料
RAG Architecture (Lewis et al., 2020)
BGE Embedding Model
RAGAS Evaluation Framework
