;; This file contains your project specific step definitions. All
;; files in this directory whose names end with "-steps.el" will be
;; loaded automatically by Ecukes.

(When "^I execute company-cabal prefix command at current point$"
      (lambda ()
        (setq company-cabal-test-prefix-output (company-cabal 'prefix))))

(Then "^company-cabal prefix is\\(?: \"\\(.*\\)\"\\|:\\)$"
      (lambda (expected)
        (should (equal company-cabal-test-prefix-output expected))))

(Then "^company-cabal prefix none$"
      (lambda ()
        (should (not company-cabal-test-prefix-output))))
