protocol BankCardDataInputInteractorInput: AnalyticsTrack {
    func validate(
        cardData: CardData,
        shouldMoveFocus: Bool
    )
    func fetchBankCardSettings(
        _ cardMask: String
    )
}

protocol BankCardDataInputInteractorOutput: AnyObject {
    func didSuccessValidateCardData(
        _ cardData: CardData
    )
    func didFailValidateCardData(
        errors: [CardService.ValidationError],
        shouldMoveFocus: Bool
    )
    func didFetchBankSettings(
        _ bankSettings: BankSettings
    )
    func didFailFetchBankSettings(
        _ cardMask: String
    )
}
