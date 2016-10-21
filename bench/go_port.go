package main;

import (
  "bufio"
  "fmt"
  "os"
)

func main() {
  reader := bufio.NewReader(os.Stdin)

  for {
    text, _ := reader.ReadString('\n')
    fmt.Println("responding to", text)
  }
}