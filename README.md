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
