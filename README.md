# Latex Lab

My own repository for custom latex packages, classes, templates with examples.

## Installation

If you have installed Tex distribution with Tex Live Utility, and want to use packages/classes from this repositort as usual, add them to your texmf directory, or better - create a symbolic links as you won't need to move code from this repository each time it is updated:

```bash
    $ git clone https://github.com/merv1n34k/latexlab.git
    $ cd latexlab
    $ sudo ln -s <package_of_choice> /usr/local/texlive/texmf-local/tex/latex/local/
    $ sudo ln -s <class_of_choice> /usr/local/texlive/texmf-local/tex/plain/local/
    $ sudo texhash # Update TeX Live database
```

Currently available:
- Packages:
    - `boxes` - create good-looking quote blocks
    - `notesTitle` - generate fancy title pages
    - `incfigs` - simplify path for images to include
- Classes:
    - `notes` - Tufte-alike class
    - `varnotes` - variation on `notes` class


## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contribution

Feel free to open an issue. PRs are also appreciated.
