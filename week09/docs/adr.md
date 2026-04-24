# 🧠 ADR（架構決策紀錄）

---

## ADR-001 Embedding Model

### Context
需要語意檢索能力

### Decision
BGE-M3

### Status
Accepted

### Consequences
+ 高語意準確度
- 成本較高

---

## ADR-002 Retrieval Strategy

### Context
純 vector 會漏 keyword

### Decision
Hybrid Search

### Status
Accepted

### Consequences
+ Recall 提升
- 系統複雜

---

## ADR-003 GraphRAG

### Decision
暫不使用

### Reason
先降低系統複雜度
