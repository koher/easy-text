# EasyText

_EasyText_ provides `Text`, which makes it easy to use character strings in Swift and is useful especially when performance is not important.

```swift
var text: Text = "ABCDEFG"

print(text[0]) // "A"
print(text[1...3]) // "BCD"
print(text.count) // 7

text[0] = "Z"
print(text[0]) // "Z"

for c in text {
    print(c) // "Z", "B", "C", "D", "E", "F", "G"
}

let string = String(text)
print(string) // "ZBCDEFG"
```

## License

[The MIT License](LICENSE)
