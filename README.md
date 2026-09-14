### CommonLisp
Project logging Common Lisp (CL) information

## CommonLisp vs Scheme

You will hear Common Lisp and Scheme sometimes mentioned in the same breath, they are not the same thing. Common Lisp is much broader than Scheme.
https://dept-info.labri.fr/~strandh/Teaching/Langages-Enchasses/Common/Strandh-Tutorial/diff-scheme.html

Some CL basics.
https://lisp-lang.org/learn/getting-started/

## Object Orientation

https://lisp-lang.org/learn/clos


## CommonLisp Compilers

https://en.wikipedia.org/wiki/List_of_Lisp_software_and_tools

- ~~Allegro Common Lisp — commercial implementation~~
- ~~Armed Bear Common Lisp (ABCL) — runs on the Java Virtual Machine~~
- ~~Chicken Scheme — Scheme implementation with C backend~~
- ~~Chez Scheme — optimizing compiler for Scheme~~
- ~~Clojure — modern Lisp dialect for the JVM~~
- CLISP — portable ANSI Common Lisp implementation
- CMU Common Lisp (CMUCL) — optimizing compiler for Common Lisp
- ~~ECL — Embeddable Common Lisp~~
- GNU CLISP — GNU Project’s Lisp implementation
- ~~GNU Guile — Scheme-based extension language of the GNU Project~~
- ~~LispWorks — commercial Common Lisp environment~~
- ~~MIT Scheme — Scheme interpreter and compiler~~
- ~~Racket — descendant of Scheme~~
- SBCL — Steel Bank Common Lisp, high-performance Common Lisp compiler.


## Bindings

Generating Lisp bindings for C:

https://github.com/sdilts/cl-bindgen
see example in ./cl-bindgen_example/

https://cffi.common-lisp.dev/

Take note in the cl-bindgen example that it uses the cffi interface.


## Language

Common Lisp is an interpreted language, like python.

S-expressions: either an atom or a list
Atoms: numbers or symbols (ie. 10, 2.32, t (boolean true), +, my-variable, :thing)

Something like ':thing' is a keyword, they evaluate to themselves, like enums.

Lists: these things '()', atoms go into lists, lists can also go in lists

A useful series of videos
https://youtu.be/OoVBKQRijko?si=rOAzt9pDj8ebLRmc

# Hello World

`(princ "Hello, world!")`

running this with sbcl is like this:

```
$ sbcl
(this brings you into the REPL (Read Evaluate Print Loop), very similar to in python)
$ (load "helloworld.lisp")
Hello, world!
T
```

The 'T' is the result of the load function.

The 'Hello, world!' is the result of the princ function call.

Notice that load finishes evaluating after princ because princ is nested within load.

Load also returns a value because all functions in common lisp have to return a value, this is a principle of functional programming.


another way of writing that would be

`(format t "Hello, world!")`

this gives the following result:

```
$ (load "helloworld.lisp")
Hello, world!
T
```


or with the following

`(format nil "Hello, world!")`

you get:

```
$ (load "helloworld.lisp")
T
```

The first parameter passed to format is its output destination. t, meaning true redirects to standard output, nil, meaning false redirects to formatted string.

If you do the following:

`(princ (format nil "this is a list ~A~% " (list 1 10)))`

The result will be:

```
this is a list (1 10)
T
```

Firstly, a list is being passed to format to produce a string representation of that list, the nil means that format will return a string, we printing it using princ, and finally because of load we get a t on out output.

The following is an example of using branching statements with t and nil:

```
(if t
  (princ "True")
  (princ "False"))
```

This gives us the following output (now ignoring the result of load), you can also use `sbcl --script <filename.lisp>` to run the script more easily:

```
True
```

This is because if the first parameter of the if function is t, then it will return the first statement, if it is nil, it will return the second.

And for completeness:

```
(if nil
  (princ "True")
  (princ "False"))
```

```
False
```

Because all functions have to return a value, princ also returns the string it prints to standard output

`
(princ (if nil (princ "True") (princ "False")))
`

```
FalseFalse
```

As you can see False was printed twice because princ "False" is both printing to standard output and returning its string to (princ (if ...)) which in turn does the same thing.

The following code is taken from (https://lisp-lang.org/learn/io), it shows comments (`;; this is a comment`) and also file handling. Take note of the parenthesis, it is important to follow them so you know what function is acting on what parameters. To make that more clear in this example I have indented each time a parenthesis opens.

```
(with-open-file 
  (stream ;; This stream object is used as a pipe between the file and our data source
    (merge-pathnames #p"data.txt" ".") ;; Merges path names "." and "data.txt" to get "./data.txt"
    :direction :output    ;; Write to disk
    :if-exists :supersede ;; Overwrite the file
    :if-does-not-exist :create)
  (dotimes 
    (i 100) ;; Write random numbers to the file
    (format stream "~3,3f~%" 
      (random 100))))
```

This will produce a file "data.txt" in the current working directory of 100 random numbers between 0 and 100 in floating point format. You can breakdown the individual aspects of the program to see what they do.

This will instead print the random numbers to standard output:

```
(dotimes
  (i 100)
  (format t "~3,3f~%" ;; stream has been changed to t here to print to standard output
    (random 100)))
```

And this will create a file called "data.txt" with the text "Hello world!" in it

```
(with-open-file
  (stream "./data.txt" ;; instead of using the merge-pathnames function it is just being written directly
    :direction :output
    :if-exists :supersede
    :if-does-not-exist :create)
  (format stream "Hello world!")) ;; format is being used here to turn the string into a stream for standard output
```

You can also do this twice to create two files in one script:

```
(with-open-file
  (stream "./data1.txt"
    :direction :output
    :if-exists :supersede
    :if-does-not-exist :create)
  (format stream "Hello!"))

(with-open-file
  (stream "./data2.txt"
    :direction :output
    :if-exists :supersede
    :if-does-not-exist :create)
  (format stream "World!"))
```

And this functionality could be broken out into a helper function:

```
(defun write-to-file (data) "writes data to a file"
  (with-open-file
    (stream "./data.txt"
      :direction :output
      :if-exists :supersede
      :if-does-not-exist :create)
    (format stream "World!")
  (format stream data)))

(write-to-file 
  (dotimes
    (i 100)
    (format nil "~3,3f~%"
      (random 100))))
```

This is a slightly more complicated example where the technique of higher order functions is used to pass a function that creates a formatted stream of data to the write-to-file function. Notice how the stream value used earlier is now different, all that value represents is the stream itself and can have any name.

```
(defun write-to-file (data-generator) "writes to file"
  (with-open-file
    (data-stream
      "./data.txt"
      :direction :output
      :if-exists :supersede
      :if-does-not-exist :create)
    (funcall data-generator data-stream))) ;; funcall is used to unwrap the function from the value it is currently     represented as

(defun how-to-make-data (data-stream) "Generates super important data and passes it to a stream"
  (dotimes
    (i 100)
    (format data-stream "~3,3f~%"
      (random 100))))

(write-to-file #'how-to-make-data) ;; we pass the how-to-make-data to write-to-file using special syntax (#'function). This allows how-to-make-data to be treated as a value so it can be passed to another function.
```

dotimes actually returns nil by default, meaning we use the 'side effect' of format to write directly to the stream passed in by write-to-file. This means that we can replace that stream used to access the file with standard input by simply passing t to how-to-make-data.

```
(defun how-to-make-data (data-stream) "Generates super important data and passes it to a stream"
  (dotimes
    (i 100)
    (format data-stream "~3,3f~%"
      (random 100))))

(how-to-make-data t)
```
