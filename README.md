![Textile Logo](/Textile/Tests/__Snapshots__/TextileLabelTests/testCustomFont.1.png?raw=true)

# Textile
Textile styles your text

## Define a TextStyle
```
let style = TextStyle { style in
    style.set(.font, UIFont.systemFont(ofSize: 18, weight: .regular))
    style.set(.foregroundColor, .black)
}
```

## Style your text 
```
let label = UILabel()
label.attributedText = style(text: " Textile ")
```
## Combine styles
```
static let body = TextStyle { style in
    style.set(.font, UIFont.systemFont(ofSize: 18, weight: .regular))
}

static let uppercase = TextStyle { style in
    style.addTextTransformer(.init(\.localizedUppercase))
}

let combined: TextStyle = .combining(.body, .uppercase)
```

## Use `TextileLabel` for convenience
```
let label = TextileLabel(textStyle: .combining(.body, .uppercase), text: "Hello World!")

