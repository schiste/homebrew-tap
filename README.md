# Aethyme Homebrew tap

This third-party tap installs the paired `aethyme` router and
`aethyme-engine-cli` daemon from one checksummed release archive.

```bash
brew install schiste/tap/aethyme
```

Update through Homebrew so it remains the only authority for these paths:

```bash
brew update
brew upgrade aethyme
```

Direct formula installation trusts only `schiste/tap/aethyme`. Do not run
`brew trust --tap schiste/tap` unless you intend to trust every formula and
external command that may be added to this repository.

The source release workflow and reviewed formula are maintained in
[schiste/Aethyme](https://github.com/schiste/Aethyme/tree/main/packaging/homebrew).
