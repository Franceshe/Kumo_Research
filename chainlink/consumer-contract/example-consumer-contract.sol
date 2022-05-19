// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

/**
 * @title A consumer contract template for the NFTBank adapter to get an estimate for an item in cryptopunks or bayc.
 * @author LinkPool
 * @notice The accepted `pricingAsset` values are `ETH` and `USD`, but defaults to `ETH` if an invalid value is passed.
 * @dev Uses @chainlink/contracts 0.4.0.
 */
contract NFTBankConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    /* ========== CONSUMER STATE VARIABLES ========== */

    // Maps
    mapping(bytes32 => uint256) public requestIdResult;

    /* ========== CONSTRUCTOR ========== */

    /**
     * @param _link the LINK token address.
     * @param _oracle the Operator.sol contract address.
     */
    constructor(address _link, address _oracle) {
        setChainlinkToken(_link);
        setChainlinkOracle(_oracle);
    }

    /* ========== CONSUMER REQUEST FUNCTIONS ========== */

    /**
     * @notice Returns a bool and a uint256.
     * @param _specId the jobID.
     * @param _payment the LINK amount in Juels (i.e. 10^18 aka 1 LINK).
     * @param _collection the NFT Collection that you want to find an estimate in.
     * @param _id The NFT ID for the item you want to find an estimate for.
     */
    function getEstimate(
        bytes32 _specId,
        uint256 _payment,
        uint256 _collection,
        uint256 _id,
        string memory _asset
    ) public {
        Chainlink.Request memory req = buildChainlinkRequest(_specId, address(this), this.fulfillEstimate.selector);
        req.addUint("nftCollection", _collection);
        req.addUint("nftId", _id);
        req.add("pricingAsset", _asset);
        sendChainlinkRequest(req, _payment);
    }

    /* ========== CONSUMER FULFILL FUNCTIONS ========== */

    /**
     * @param _requestId The request ID for fulfillment.
     * @param _estimate The estimate for the given NFT ID in the provided pricing asset.
     */
    function fulfillEstimate(bytes32 _requestId, uint256 _estimate) public recordChainlinkFulfillment(_requestId) {
        requestIdResult[_requestId] = _estimate;
    }

    /* ========== OTHER FUNCTIONS ========== */

    function cancelRequest(
        bytes32 _requestId,
        uint256 _payment,
        bytes4 _callbackFunctionId,
        uint256 _expiration
    ) public {
        cancelChainlinkRequest(_requestId, _payment, _callbackFunctionId, _expiration);
    }

    function getOracleAddress() external view returns (address) {
        return chainlinkOracleAddress();
    }

    function setOracle(address _oracle) external {
        setChainlinkOracle(_oracle);
    }

    function withdrawLink() public {
        LinkTokenInterface linkToken = LinkTokenInterface(chainlinkTokenAddress());
        require(linkToken.transfer(msg.sender, linkToken.balanceOf(address(this))), "Unable to transfer");
    }
}