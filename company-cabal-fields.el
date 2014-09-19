;;; company-cabal-fields.el -- cabal field definitions.
;;; Commentary:
;;; Code:

(defconst company-cabal--pkgdescr-fields
  (mapcar
   (lambda (x) (propertize x :type 'field))
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
     "extra-doc-files")))

(defconst company-cabal--buildinfo-fields
  (mapcar
   (lambda (x) (propertize x :type 'field))
   '("buildable"
     "build-depends"
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
     "jhc-options")))

(defconst company-cabal--library-fields
  (append (mapcar (lambda (x) (propertize x :type 'field))
                  '("exposed-modules" "exposed"))
          company-cabal--buildinfo-fields))

(defconst company-cabal--executable-fields
  (cons (propertize "main-is" :type 'field) company-cabal--buildinfo-fields))

(defconst company-cabal--testsuite-fields
  (append (mapcar (lambda (x) (propertize x :type 'field))
                  '("type" "main-is" "test-module"))
          company-cabal--buildinfo-fields))

(defconst company-cabal--benchmark-fields
  (append (mapcar (lambda (x) (propertize x :type 'field))
                  '("type" "main-is"))
          company-cabal--buildinfo-fields))

(defconst company-cabal--flag-fields
  (mapcar (lambda (x) (propertize x :type 'field))
           '("description" "default" "manual")))

(defconst company-cabal--sourcerepo-fields
  (mapcar (lambda (x) (propertize x :type 'field))
          '("type" "location" "module" "branch" "tag" "subdir")))

(defconst company-cabal--section-field-alist
  (list (cons "library" company-cabal--library-fields)
        (cons "executable" company-cabal--executable-fields)
        (cons "test-suite" company-cabal--testsuite-fields)
        (cons "benchmark" company-cabal--benchmark-fields)
        (cons "flag" company-cabal--flag-fields)
        (cons "source-repository" company-cabal--sourcerepo-fields)))

(defconst company-cabal--sections
  (mapcar (lambda (cs) (propertize  (car cs) :type 'section))
          company-cabal--section-field-alist))

(defconst company-cabal--build-type-values
  (mapcar (lambda (x) (propertize x :type 'value))
          '("Simple" "Configure" "Make" "Custom")))
(provide 'company-cabal-fields)
;;; company-cabal-fields.el ends here
