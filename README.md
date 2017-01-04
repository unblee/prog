# prog

Display a very simple progress message

## Usage

repeat count(R) is an option value(default:3)

```
prog.sh <print text: string> <condition command: string> [<repeat count: int>]

e.g.
prog.sh 'Downloading' '[ ! -e /tmp/file ]' 5
```

or

```
T=Downloading C="[ ! -e /tmp/file ]" R=5 sh -c "$(curl -sSL https://git.io/unblee-prog)"
```
