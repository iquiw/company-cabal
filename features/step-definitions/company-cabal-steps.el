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

(When "^I execute company-cabal candidates command at current point$"
      (lambda ()
        (let* ((tmp (or (company-cabal 'prefix) 'stop))
               (prefix (if (consp tmp) (car tmp) tmp)))
          (when (not (eq prefix 'stop))
            (setq company-cabal-test-candidates-output
                  (mapcar (lambda (s) (substring-no-properties s))
                          (company-cabal 'candidates prefix)))))))

(Then "^company-cabal candidates are\\(?: \"\\(.*\\)\"\\|:\\)$"
      (lambda (expected)
        (should (equal company-cabal-test-candidates-output (read expected)))))

(Then "^company-cabal candidates contains\\(?: \"\\(.*\\)\"\\|:\\)$"
      (lambda (expected)
        (should (member expected company-cabal-test-candidates-output))))
