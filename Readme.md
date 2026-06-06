# mkcalt

**Version:** 0.1  
**Developer:** mkgirl  

A simple batch calculator for Windows.

## Installation

1. Place `mkcalt.cmd` in any directory.
2. (Optional) Add the directory to your `PATH` environment variable for global access.

## Usage

```
mkcalt [number] operator [number]
```

All arguments must be separated by spaces.

### Examples

| Command | Result |
|---------|--------|
| `mkcalt 5 + 3` | 8 |
| `mkcalt 10 - 4` | 6 |
| `mkcalt 3 * 7` | 21 |
| `mkcalt 15 / 4` | 3 |
| `mkcalt 2 ** 10` | 1024 |
| `mkcalt 7 // 2` | 3 |
| `mkcalt ++ 5` | 6 |
| `mkcalt 5 ++` | 6 |
| `mkcalt -- 9` | 8 |
| `mkcalt 9 --` | 8 |

## Operators

| Operator | Description |
|----------|-------------|
| `+` | Addition |
| `-` | Subtraction |
| `*` | Multiplication |
| `/` | Division |
| `**` | Exponentiation |
| `//` | Integer division |
| `++` | Increment by 1 (unary) |
| `--` | Decrement by 1 (unary) |

## Special Commands

| Command | Description |
|---------|-------------|
| `x32` | Show 32-bit signed maximum value (2147483647) |
| `N x32` | Show distance from the 32-bit signed limit |
| `x64` | Show 64-bit signed maximum value (9223372036854775807) |
| `N x64` | Show 64-bit context information |
| `Hello world` | Display greeting |
| `hi` | Display greeting |
| `help` | Show this help information |

## Limits

- Calculations are performed using 32-bit signed integers (range: -2147483648 to 2147483647).
- Overflow may occur with large numbers in multiplication or exponentiation.
- The `x64` command shows the theoretical 64-bit limit but cannot compute the difference in pure batch.

## License

Freeware
