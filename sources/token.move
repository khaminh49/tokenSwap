module Token::MyToken {
    resource struct Token {
        balance: u64,
    }

    public fun initialize(account: &signer, initial_balance: u64) {
        move_to(account, Token { balance: initial_balance });
    }

    public fun transfer(from: &signer, to: address, amount: u64) {
        let sender_token = borrow_global_mut<Token>(Signer::address_of(from));
        let recipient_token = borrow_global_mut<Token>(to);

        assert!(sender_token.balance >= amount, 1);
        sender_token.balance = sender_token.balance - amount;
        recipient_token.balance = recipient_token.balance + amount;
    }

    public fun balance(account: address): u64 {
        let token = borrow_global<Token>(account);
        token.balance
    }
}
