<!-- index.html -->
<!DOCTYPE html>
<html>
<head>
    <title>Web3 Connect</title>
</head>
<body>
    <h1>🟢 Web3 Connection</h1>
    <button id="connect">Connect Wallet</button>
    <p id="account">Not connected</p>
    <p id="balance">Balance: 0</p>

    <script src="https://cdn.jsdelivr.net/npm/ethers@6/dist/ethers.umd.min.js"></script>
    <script>
        const connectBtn = document.getElementById('connect');
        const accountDisplay = document.getElementById('account');
        const balanceDisplay = document.getElementById('balance');

        connectBtn.onclick = async () => {
            if (!window.ethereum) {
                alert('Please install MetaMask');
                return;
            }
            const provider = new ethers.BrowserProvider(window.ethereum);
            const accounts = await provider.send("eth_requestAccounts", []);
            const signer = await provider.getSigner();
            const address = await signer.getAddress();
            const balance = await provider.getBalance(address);

            accountDisplay.textContent = `Account: ${address}`;
            balanceDisplay.textContent = `Balance: ${ethers.formatEther(balance)} ETH`;
        };
    </script>
</body>
</html>
