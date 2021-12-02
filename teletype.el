;;; typeFile.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Rafael Accácio Nogueira
;;
;; Author: Rafael Accácio Nogueira <https://github.com/nogueirar>
;; Maintainer: Rafael Accácio Nogueira <raccacio@poli.ufrj.br>
;; Created: avril 08, 2021
;; Modified: avril 08, 2021
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/accacio/typeFile
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(defun retype-text (string)
  (dolist (char (string-to-list string))
    (insert char)
    (if (char-equal ?\n char) (sit-for .5) (sit-for .01))
    )
  )

(defun typefile (filePath)
  "Type file contents"
  (let
      ((file-contents-as-string
        (with-temp-buffer
          (insert-file-contents filePath)
          (buffer-string)
          )))

    (let ((new-file-name (read-file-name "filename? ")))


      (let ((new-buffer-name (create-file-buffer new-file-name) ))

        (set-buffer new-buffer-name )
        (switch-to-buffer new-buffer-name)
        (set-visited-file-name new-file-name)
        (retype-text file-contents-as-string)
        )
      )
    )
  )

(retype-text "hello!!!! \nhow are you")


(typefile "./typeFile.el")
(provide 'typeFile)
;;; typeFile.el ends here
