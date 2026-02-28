# 📖 Warnet API Reference (v1.0)

Welcome to the Warnet Protocol API documentation. This reference covers the core endpoints for interacting with the decentralized compute commons.

## 🔌 Base URL
`https://api.warnet.io/v1`

## 🔑 Authentication
All requests must include your Warnet API Key in the headers:
`Authorization: Bearer <YOUR_API_KEY>`

---

## 🛰️ Endpoints

### 1. Sessions

#### `POST /sessions`
Create a new ephemeral compute session.

**Parameters:**
- `config` (Object): Node configuration (see `warnet.config.json`).
- `duration` (Number): Requested session time in minutes.

**Response:**
```json
{
  "id": "sess_9f2b3c4d",
  "status": "initializing",
  "node_id": "node_0x1234",
  "expires_at": "2026-02-28T13:00:00Z"
}
```

#### `GET /sessions/:id`
Retrieve the status of an active session.

#### `DELETE /sessions/:id`
Terminate a session and purge all data from the node.

---

### 2. Execution

#### `POST /sessions/:id/execute`
Run a task on the allocated node.

**Body:**
- `type` (String): Task type (`agent`, `script`, `render`).
- `payload` (Object): Task-specific parameters.

**Example:**
```json
{
  "type": "agent",
  "payload": {
    "task": "Summarize logs",
    "model": "gemini-3-flash"
  }
}
```

---

### 3. Resources

#### `GET /resources/mesh`
Get real-time statistics of the global compute mesh.

#### `GET /resources/billing`
Retrieve current credit balance and usage history.

---

## ⚠️ Error Codes

| Code | Message | Description |
|------|---------|-------------|
| `401` | Unauthorized | Invalid or missing API key. |
| `402` | Insufficient Credits | Balance too low for requested compute. |
| `404` | Session Not Found | The session ID is invalid or expired. |
| `429` | Rate Limit Exceeded | Too many requests in a short period. |
| `503` | Mesh Congestion | No nodes available in the requested region. |

---

## 📚 SDKs
- **Node.js**: `npm install @warnet/sdk`
- **Python**: `pip install warnet-sdk`
- **Rust**: `cargo add warnet`
