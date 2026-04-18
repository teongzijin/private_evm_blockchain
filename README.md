# private_evm_blockchain
# BOSS Chain: Private Ethereum Infrastructure

A professional-grade private Ethereum blockchain environment built using **Go-Ethereum (Geth) v1.13. This project demonstrates the setup of a custom Proof-of-Authority (PoA) network with persistent data storage and developer-mode optimization.

Key Features
- Custom Network ID:** `157541` (BOSS Mainnet)
- Consensus:** Clique (Proof-of-Authority) via Geth Developer Mode.
- Persistence:** Configured with `--datadir` to ensure blockchain state survives restarts.
- Modern Compatibility:** Configured for Cancun/Shanghai hard forks, supporting EIP-4844 blobs.

Tech Stack
- Engine: Geth (Go-Ethereum) v1.13+
- Language: Solidity (for VICE Token)
- Process Management: PM2 (for background service stability)

Setup Instructions

1. Initialize the Chain
Use the provided `genesis.json` to initialize the data directory:
\`\`\`bash
geth --datadir ./data init genesis.json
\`\`\`

2. Start the Node
Run the included `start.sh` script. This enables HTTP-RPC for MetaMask and Remix connectivity:
\`\`\`bash
chmod +x start.sh
./start.sh
\`\`\`

3. Background Execution (Production Style)
To run the chain as a persistent backend service:
\`\`\`bash
pm2 start ./start.sh --name "boss-chain"
pm2 save
\`\`\`

Tokens Deployed
- BOSS Coin:** Native currency (Pre-funded in genesis).
- VICE Token:** ERC-20 utility token (Deployed at remix).

Architectural Decisions
- Geth v1.13 + Dev Mode:** Chose `--dev` mode to bypass the requirement for a separate Beacon Chain (Consensus Layer), reducing hardware overhead for local development.
- Terminal Total Difficulty (TTD):** Set to `0` in genesis to force an immediate transition to Post-Merge logic, ensuring compatibility with modern Web3 tooling.


Step-by-Step Setup on macOS 

Follow these steps to replicate this environment on a MacBook Air or Mac mini.

1. Install Dependencies
Ensure you have Homebrew and Node.js installed, then install Geth and PM2:

Install Ethereum (Geth)
brew tap ethereum/ethereum
brew install ethereum

Install PM2 for process management
npm install pm2 -g

Prepare the Workspace
Clone this repo and set up your local data directory:

Bash
git clone <repo-url>
cd boss-chain-infrastructure
mkdir data
3. Initialize & Launch
Bash
# Initialize the blockchain with the genesis profile
geth --datadir ./data init genesis.json

# Launch in background using PM2
pm2 start ./start.sh --name "boss-chain"

# Ensure it starts automatically on Mac reboot
pm2 save
pm2 startup
4. Connect MetaMask
Open MetaMask > Add Network > Add a network manually.

Enter the following details:

Network Name: BOSS Mainnet

New RPC URL: https://www.google.com/search?q=http://127.0.0.1:8545

Chain ID: 157541

Currency Symbol: BOSS

Important: Go to Settings > Advanced > Clear activity tab data if you have previously connected to this Chain ID to prevent Nonce errors.

5. Deploy Smart Contracts (Remix)
Open Remix IDE.

Set Environment to Injected Provider - MetaMask.

Select the BOSS Mainnet in MetaMask.

Deploy the VICE contract.
