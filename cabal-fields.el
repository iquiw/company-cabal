(defconst company-cabal--pkgdescr-fields
  '("name"
    "version"
    "cabal-version"
    "build-type"
    "license"
    "license-file"
    "copyright"
    "maintainer"
    "build-depends"
    "stability"
    "homepage"
    "package-url"
    "bug-reports"
    "synopsis"
    "description"
    "category"
    "author"
    "tested-with"
    "data-files"
    "data-dir"
    "extra-source-files"
    "extra-tmp-files"
    "extra-doc-files"))

(defconst company-cabal--buildinfo-fields
  '("buildable"
    "build-tools"
    "cpp-options"
    "cc-options"
    "ld-options"
    "pkgconfig-depends"
    "frameworks"
    "c-sources"
    "default-language"
    "other-languages"
    "default-extensions"
    "other-extensions"
    "extensions"
    "extra-libraries"
    "extra-lib-dirs"
    "includes"
    "install-includes"
    "include-dirs"
    "hs-source-dirs"
    "other-modules"
    "ghc-prof-options"
    "ghc-shared-options"
    "ghc-options"
    "hugs-options"
    "nhc98-options"
    "jhc-options"))

(defconst company-cabal--library-fields
  (append '("exposed-modules" "exposed") company-cabal--buildinfo-fields))

(defconst company-cabal--executable-fields
  (cons "main-is" company-cabal--buildinfo-fields))

(defconst company-cabal--testsuite-fields
  (append '("type" "main-is" "test-module") company-cabal--buildinfo-fields))

(defconst company-cabal--benchmark-fields
  (append '("type" "main-is") company-cabal--buildinfo-fields))

(defconst company-cabal--flag-fields
  '("description"
    "default"
    "manual"))

(defconst company-cabal--sourcerepo-fields
  '("type"
    "location"
    "module"
    "branch"
    "tag"
    "subdir"))

(defconst company-cabal--section-field-alist
  (list (cons "library" company-cabal--library-fields)
        (cons "executable" company-cabal--executable-fields)
        (cons "test-sute" company-cabal--testsuite-fields)
        (cons "benchmark" company-cabal--buildinfo-fields)
        (cons "flag" company-cabal--flag-fields)
        (cons "source-repository" company-cabal--sourcerepo-fields)))

(provide 'cabal-fields)
