# Resume

LaTeX source for Brian Quinn's resume, built on the Deedy resume class.
Compiles with XeLaTeX. The Lato and Raleway fonts the class needs are
vendored under `fonts/`, so a clone has everything except the TeX install.

## Setup

On a fresh Mac with Homebrew, in a regular terminal window (it uses sudo):

```sh
make setup
```

This installs BasicTeX and the few packages the class uses that it does not
ship with. It is safe to rerun.

## Build

```sh
make          # compile to Brian_Quinn_Professional_Resume.pdf
make watch    # recompile on save and keep the PDF viewer open
make clean    # remove build artefacts and the PDF
```
