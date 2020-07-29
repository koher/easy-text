# EasyText

_EasyText_ provides `Text`, which makes it easy to use character strings in Swift. `Text` also provides APIs with **reasonable performance**: *O(n)* for creating instances and *O(1)* for operations like `subscript`, `count`, `first`, `last` and so on.

```swift
var text: Text = "👪ABCDEFG👍"

print(text[0]) // "👪"
print(text[1...3]) // "ABC"
print(text.last!) // "👍"
print(text.count) // 9

text[0] = "😃"
print(text[0]) // "😃"

for c in text {
    print(c) // "😃", "A", "B", "C", "D", "E", "F", "G", "👍"
}

let string = String(text)
print(string) // "😃ABCDEFG👍"
```

## License

[The MIT License](LICENSE)
