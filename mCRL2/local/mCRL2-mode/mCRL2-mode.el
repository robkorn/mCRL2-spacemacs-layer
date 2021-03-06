
(setq mCRL2-highlight-scheme
      '(("Set\\|Real\\|Bool\\|Int\\|Nat\\|List\\|Pos\\|Bag" . font-lock-type-face)
        ("\\+\\|\\-\>\\|!\\|#\\|\<\>\\|\|\\|\\;\\|\(\\|\)\\|\{\\|\}\\|:\\|\\.\\|\," . font-lock-constant-face)
        ("sort\\|init\\|struct\\|act\\|proc\\|sum\\|glob" . font-lock-variable-name-face)
        ("hide\\|comm\\|allow" . font-lock-keyword-face)))


(setq mCRL2-mode-syntax-table
      (let ( (synTable (make-syntax-table)))
        (modify-syntax-entry ?% "<" synTable)
        (modify-syntax-entry ?\n ">" synTable)
        synTable))

(define-derived-mode mCRL2-mode fundamental-mode "mCRL2"
  "mCRL2 Major Mode"

  (setq font-lock-defaults '(mCRL2-highlight-scheme))
  (setq-local comment-start "\%")
  (setq-local comment-end "")
)

(provide 'mCRL2-mode)
