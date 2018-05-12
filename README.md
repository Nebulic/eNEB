## Neb Token
This is a standard ERC20 token. It's purpose is to safely represent Nebula Network's NEB Coins while the Nebula Multichain matures to production.

### Deployment
1. Copy all contracts to https://remix.ethereum.org
   (Use the add local file option - you can multiselect).

1. Select the NebToken.sol in the browser dropdown on the left.
   Select *Compile* tab in the panel on the left.

1. Click *Start to compile*. Select *NebToken* in dropdown on the right.

1. Click *Details*.

1. Copy generateDeployTxTemplate.js to generateDeployTx.js.
   Copy abi and set abi constant in generateDeployTx.js.
   Copy bytecode and set bytecode constant in generateDeployTx.js.

1. Run `node generateDeployTx.js > contractByteCode.txt`

1. Go to: https://www.myetherwallet.com/#contracts

1. Make sure that *Network* in upper-right corner is set correctly.

1. Click *Deploy Contract*.

1. Paste output from contractByteCode.txt into the *Byte Code* field.

1. Access you wallet and sign the deployment transaction.
   Make sure popups are not blocked in your browser on the myetherwallet page.

1. Click *Deploy Contract*.

To get the address of the smartcontract go to https://etherscan.io (for ropsten testnet go to https://ropsten.etherscan.io)
and search for the address that signed the deploy transaction. Click on the TxHash of the transaction (should be the newest one).
