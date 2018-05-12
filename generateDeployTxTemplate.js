const Web3 = require('web3')
const web3 = new Web3()

const abi = /* abi from remix */
const bytecode = /* bytecode from remix */

const totalSupply = 10**9  // one billion
try {
    const contract = new web3.eth.Contract(abi, null, {data: bytecode.object})
    const txCode = '0x'+contract.deploy({arguments:[totalSupply]}).encodeABI()
    console.log(txCode)
}
catch (e) {
    console.log(e);
}
