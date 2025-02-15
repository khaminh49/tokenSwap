module TokenSwap::Swap {
    use Token::MyToken;

    resource struct Swap {
        token_a: address,
        token_b: address,
        rate: u64,
    }

    public fun initialize(account: &signer, token_a: address, token_b: address, rate: u64) {
        move_to(account, Swap { token_a, toke`n_b, rate });
    }

    public fun swap(account: &signer, amount_a: u64) {
        let swap_contract = borrow_global<Swap>(Signer::address_of(account));
        let token_a = swap_contract.token_a;
        let token_b = swap_contract.token_b;
        let rate = swap_contract.rate;

        let amount_b = amount_a / rate;

        MyToken::transfer(&signer, token_a, amount_a);
        MyToken::transfer(&signer, token_b, amount_b);
    }

    public fun get_rate(account: address): u64 {
        let swap_contract = borrow_global<Swap>(account);
        swap_contract.rate
    }
}
