class Constant {
 static Map<String, String> sampleCodes = {
    'C': '''#include <stdio.h>

int main() {
    printf("Hello, World!");
    return 0;
}''',
    'C++': '''#include <iostream>
using namespace std;

int main() {
    cout << "Hello, World!";
    return 0;
}''',
    'Java': '''public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}''',
    'Python': '''print("Hello, World!")''',
    'JavaScript': '''console.log("Hello, World!");''',
    'Ruby': '''puts "Hello, World!"''',
    'PHP': '''<?php
echo "Hello, World!";
?>''',
    'Perl': '''print "Hello, World!";''',
    'Swift': '''print("Hello, World!")''',
    'Go': '''package main
import "fmt"

func main() {
    fmt.Println("Hello, World!")
}''',
    'Kotlin': '''fun main() {
    println("Hello, World!")
}''',
    'Rust': '''fn main() {
    println!("Hello, World!");
}''',
    'R': '''cat("Hello, World!\\n")''',
    'Scala': '''object Main extends App {
    println("Hello, World!")
}''',
    'Haskell': '''main = putStrLn "Hello, World!"''',
    'Objective-C': '''#import <Foundation/Foundation.h>

int main() {
    @autoreleasepool {
        NSLog(@"Hello, World!");
    }
    return 0;
}''',
    'Lua': '''print("Hello, World!")''',
    'Groovy': '''println "Hello, World!"''',
    'TypeScript': '''console.log("Hello, World!");''',
    'Bash': '''echo "Hello, World!"''',
    'Pascal': '''program HelloWorld;
begin
    writeln('Hello, World!');
end.''',
    'Fortran': '''program hello
    print *, "Hello, World!"
end program hello''',
    'Dart': '''void main() {
  print('Hello, World!');
}''',
    'Erlang': '''-module(hello).
-export([start/0]).

start() ->
    io:format("Hello, World!~n").''',
    'C#': '''using System;

class Program {
    static void Main() {
        Console.WriteLine("Hello, World!");
    }
}''',
    'F#': '''printfn "Hello, World!"''',
    'COBOL': '''IDENTIFICATION DIVISION.
PROGRAM-ID. Hello-World.
PROCEDURE DIVISION.
    DISPLAY 'Hello, World!'.
    STOP RUN.''',
    'VB.NET': '''Module Program
    Sub Main()
        Console.WriteLine("Hello, World!")
    End Sub
End Module''',
    'Scheme': '''(display "Hello, World!")
(newline)''',
    'Prolog': ''':- initialization(main).

main :- write('Hello, World!'), nl.''',
  };

 static List<String> languages = [
    'C',
    'C++',
    'Java',
    'Python',
    'JavaScript',
    'Ruby',
    'PHP',
    'Perl',
    'Swift',
    'Go',
    'Kotlin',
    'Rust',
    'R',
    'Scala',
    'Haskell',
    'Objective-C',
    'Lua',
    'Groovy',
    'TypeScript',
    'Bash',
    'Pascal',
    'Fortran',
    'Dart',
    'Erlang',
    'C#',
    'F#',
    'COBOL',
    'VB.NET',
    'Scheme',
    'Prolog',
 ];
}
