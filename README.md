![Build](https://img.shields.io/github/workflow/status/aegzorz/textile/Unit%20Tests?style=for-the-badge)

![Textile Logo](/Textile/Tests/__Snapshots__/ReadmeTests/testLogo.1.png?raw=true)

# Textile
Textile _styles_ your text

## Define and use TextStyle
```
let style = TextStyle { style in
    style.set(.font, UIFont.systemFont(ofSize: 18, weight: .regular))
    style.set(.foregroundColor, .black)
}

let label = UILabel()
label.attributedText = style(text: "Hello World!")
```

![Simple Style](/Textile/Tests/__Snapshots__/ReadmeTests/testSimpleStyle.1.png?raw=true)

## Combining text styles
```
static let body = TextStyle { style in
    style.set(.font, UIFont.systemFont(ofSize: 18, weight: .regular))
}

static let uppercase = TextStyle { style in
    style.add(transformer: .init(\.localizedUppercase))
}

let combined: TextStyle = .combining(.body, .uppercase)

// or using `+` operator

let combined: TextStyle = .body + .uppercase
```
The rightmost style has precedence.

## Use `TextileLabel` for convenience
```
let label = TextileLabel(textStyle: .combining(.body, .uppercase), text: "Hello World!")
```
![Textile Label](/Textile/Tests/__Snapshots__/ReadmeTests/testTextileLabel.1.png?raw=true)
