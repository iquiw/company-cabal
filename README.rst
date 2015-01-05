========================
 company-cabal |travis|
========================

`Company-mode`_ completion back-end for haskell-cabal-mode.

Installation
============

Depends
-------
* cl-lib
* `company-mode`_


Setup from Git
--------------
1. Install from Git::

     git clone https://github.com/iquiw/company-cabal.git

2. Add ``company-cabal`` to ``company-backends`` after loading `company-mode`_.

   .. code:: emacs-lisp

     (add-to-list 'load-path "/path/to/company-cabal")
     (add-to-list 'company-backends 'company-cabal)


Feature
=======
* Field name completion

  | If field name starts with uppercase character, the completion result is capitalized (e.g. "Cabal-Version").
  | Otherwise, the completion result contains lowercase characters only (e.g. "cabal-version").

* Section name completion

* Some field value completion

  * build-type
  * hs-source-dirs (current directories)
  * type
  * build-depends (`ghc-pkg list`)

Note
====
* No support for brace layout


License
=======
Licensed under GPL 3+ license.

.. _company-mode: http://company-mode.github.io/
.. |travis| image:: https://api.travis-ci.org/iquiw/company-cabal.svg?branch=master
            :target: https://travis-ci.org/iquiw/company-cabal
