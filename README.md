# 🔄 TokenSwap Module

The TokenSwap Module enables the swapping of two different tokens based on a predefined exchange rate on the Aptos blockchain. This module is ideal for creating simple decentralized exchanges or token swap services.

# 📦 Module Structure

1. Struct

	•	Swap
	•	token_a: Address of the first token.
	•	token_b: Address of the second token.
	•	rate: Exchange rate between token_a and token_b.

2. Public Functions

	•	initialize(account: &signer, token_a: address, token_b: address, rate: u64): Initializes the swap contract with two token addresses and a specified exchange rate.
	•	swap(account: &signer, amount_a: u64): Swaps amount_a of token_a for an equivalent amount of token_b based on the exchange rate.
	•	get_rate(account: address): u64: Retrieves the exchange rate for the swap contract.
