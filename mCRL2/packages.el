(defconst mCRL2-packages
  '(
    (mCRL2-mode :location local)
    )
)


(defun mCRL2/post-init-mCRL2-mode ()
  (spacemacs/set-leader-keys-for-major-mode 'mCRL2-mode
    "bl1" 'mcrl2-create-lps-reg
    "bl2" 'mcrl2-create-lps-reg2
    "bl3" 'mcrl2-create-lps-stack

    "bt" 'mcrl2-create-lts
    "bb" 'mcrl2-create-pbes-lts
    "c" 'mcrl2-check-pbes-lts

    "g" 'mcrl2-lts-graph-current
    "e" 'mcrl2-lts-graph-evidence
    "s"  'mcrl2-lps-trace-simulator
    )
  )



(defun mCRL2/init-mCRL2-mode ()
  (use-package mCRL2-mode
    :defer t
    :mode "\\.mcrl2\\'"
    )

  (spacemacs/declare-prefix-for-mode 'mCRL2-mode "mb" "mCRL2/Build Files")
  (spacemacs/declare-prefix-for-mode 'mCRL2-mode "mbl" "Linear Process Spec")
  (spacemacs/declare-prefix-for-mode 'mCRL2-mode "mbt" "Labled Transition System")
  (spacemacs/declare-prefix-for-mode 'mCRL2-mode "mbb" "Parameterized Boolean Equation System")
  (spacemacs/declare-prefix-for-mode 'mCRL2-mode "mg" "mCRL2/Open LTS Graph")
  (spacemacs/declare-prefix-for-mode 'mCRL2-mode "me" "mCRL2/Open Evidence Graph")
  (spacemacs/declare-prefix-for-mode 'mCRL2-mode "mc" "mCRL2/Model Check PBES")
  (spacemacs/declare-prefix-for-mode 'mCRL2-mode "ms" "mCRL2/Trace Simulator")

  ;; LPS Creating Functions
  (defun mcrl2-create-lps-reg (&optional set-line)
    (interactive)
    (async-shell-command (concat "mcrl22lps -l regular " buffer-file-name " > " (concat buffer-file-name ".lps"))))
  (defun mcrl2-create-lps-reg2 (&optional set-line)
    (interactive)
    (async-shell-command (concat "mcrl22lps -l regular2 " buffer-file-name " > " (concat buffer-file-name ".lps"))))
  (defun mcrl2-create-lps-stack (&optional set-line)
    (interactive)
    (async-shell-command (concat "mcrl22lps -l stack " buffer-file-name " > " (concat buffer-file-name ".lps"))))

  ;; LTS Creation Functions
  (defun mcrl2-create-lts (&optional set-line)
    (interactive)
    (async-shell-command (concat "lps2lts --verbose " (concat buffer-file-name ".lps") " " buffer-file-name ".lts" )))

  ;; PBES Creation Functions
  (defun mcrl2-create-pbes-lps (&optional set-line)
    (interactive)
    (async-shell-command (concat "lps2pbes -c " (concat buffer-file-name ".lps" ) " -f properties/testProp.mcf " (concat buffer-file-name ".pbes") )))
  (defun mcrl2-create-pbes-lts (&optional set-line)
    (interactive)
    (async-shell-command (concat "lts2pbes -c " (concat buffer-file-name ".lps" ) " -f properties/testProp.mcf " (concat buffer-file-name ".pbes") )))

  ;; PBES Model Chekcing Functions
  (defun mcrl2-check-pbes-lps (&optional set-line)
    (interactive)
    (async-shell-command (concat "pbessolve -v --file=" (concat buffer-file-name ".lps" ) " " (concat buffer-file-name ".pbes") )))
  (defun mcrl2-check-pbes-lts (&optional set-line)
    (interactive)
    (async-shell-command (concat "pbessolve -v --file=" (concat buffer-file-name ".lts" ) " " (concat buffer-file-name ".pbes") )))

  ;; LTS Graph Functions
  (defun mcrl2-lts-graph-current (&optional set-line)
    (interactive)
    (start-process "graph" nil "ltsgraph"  (concat buffer-file-name ".lts")))
  (defun mcrl2-lts-graph-evidence (&optional set-line)
    (interactive)
    (start-process "graph" nil "ltsgraph"  (concat buffer-file-name ".pbes.evidence.lts")))

  ;; LPS Simulator Functions
  (defun mcrl2-lps-trace-simulator (&optional set-line)
    (interactive)
    (start-process "lpsxsim" nil "lpsxsim" (concat buffer-file-name ".lps")))

)

