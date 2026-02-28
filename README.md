# 🌐 Warnet Protocol

> **Access Over Ownership.**  
> Decentralized Public Compute Commons.

![Warnet Logo](/assets/logo.png)

Warnet reimagines the classic internet café as a decentralized digital infrastructure layer—where compute, AI tools, bandwidth, and software are shared, permissionless, and paid per use.

---

## 🚀 Core Utilities

- **On-Demand Compute**: Spin up AI agents, render jobs, or simulations instantly.
- **Shared AI Workstations**: Pre-configured environments for LLMs and Stable Diffusion.
- **Session-Based Identity**: Ephemeral, isolated, and privacy-preserving sessions.
- **Resource Pooling**: Contribute idle GPU/bandwidth and earn credits.
- **Pay-Per-Minute**: Transparent usage-based pricing with no vendor traps.

---

## ⚡ Quick Installation

Get started in seconds with our automated installer:

```bash
curl -sSL https://warnet.io/install.sh | bash
```

---

## 🛠️ Getting Started

### 1. Configuration

Create a `warnet.config.json` in your project root:

```json
{
  "node": {
    "type": "ephemeral",
    "region": "global-mesh",
    "max_latency_ms": 50
  },
  "compute": {
    "engine": "v1-secure-shell",
    "resources": {
      "gpu": "A100-equivalent",
      "vram": "40GB"
    }
  },
  "billing": {
    "mode": "pay-per-minute",
    "currency": "WARNET_CREDITS"
  }
}
```

### 2. Example Usage (Node.js)

Install the Warnet SDK:
```bash
npm install @warnet/sdk
```

Run a simple compute task:

```javascript
const { WarnetClient } = require('@warnet/sdk');

async function startSession() {
  const client = new WarnetClient({
    apiKey: process.env.WARNET_API_KEY,
    config: './warnet.config.json'
  });

  console.log('Initializing Warnet Session...');
  const session = await client.createSession();

  console.log(`Session Established: ${session.id}`);

  // Execute a remote AI Agent
  const result = await session.execute('agent', {
    task: 'Analyze network traffic patterns',
    model: 'gemini-3-flash'
  });

  console.log('Result:', result);

  // Close session (all data is purged)
  await session.terminate();
  console.log('Session terminated. Data purged.');
}

startSession();
```

---

## 🔗 Links

- **Website**: [warnet.io](https://warnet.io)
- **X (Twitter)**: [@WarNetOnSol](https://x.com/WarNetOnSol)
- **GitHub**: [WarNetdotfun/WARNET](https://github.com/WarNetdotfun/WARNET)

---

## 🛡️ Security & Privacy

Warnet operates on a **Zero-Knowledge Identity** principle. Your session is your identity. Once the session ends, all data is purged from the node. Data exists only in RAM, never on disk.

---

## 🤝 Contributing

We welcome contributions to the Warnet Protocol! Whether it's contributing idle hardware or improving the core engine, join us in building the public compute commons.

---

## 📄 License

Warnet is open-source under the [Apache-2.0 License](LICENSE).
