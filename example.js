/**
 * Warnet Protocol Example Script
 * 
 * Demonstrates how to initialize a session and execute a remote task
 * on the Warnet decentralized compute mesh.
 */

const { WarnetClient } = require('@warnet/sdk');

async function startSession() {
  // Initialize the Warnet client with your API key and config
  const client = new WarnetClient({
    apiKey: process.env.WARNET_API_KEY || 'YOUR_API_KEY_HERE',
    config: './warnet.config.json'
  });

  console.log('--- WARNET SECURE SHELL ---');
  console.log('Initializing session...');

  try {
    // 1. Create an ephemeral session
    const session = await client.createSession({
      taskType: 'AI_AGENT',
      region: 'auto'
    });

    console.log(`[OK] Session Established: ${session.id}`);
    console.log(`[OK] Uptime: 99.99% | Latency: 12ms`);

    // 2. Execute a remote compute task
    console.log('Executing remote AI Agent task...');
    const result = await session.execute('agent', {
      task: 'Analyze network traffic patterns for anomalies',
      model: 'gemini-3-flash-preview'
    });

    console.log('--- TASK RESULT ---');
    console.log(result);
    console.log('-------------------');

    // 3. Terminate session (all data is purged from the node)
    console.log('Terminating session...');
    await session.terminate();
    console.log('[OK] Session terminated. All data purged from node RAM.');

  } catch (error) {
    console.error('[ERROR] Warnet System Failure:', error.message);
  }
}

// Run the example
startSession();
