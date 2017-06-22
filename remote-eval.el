;;; remote-eval.el --- eval code by sending it over http 

;; Copyright (C) 2017 SlightlyCyborg 

;; Author: SlightlyCyborg <collinalexbell@gmail.com>
;; Keywords: rpc 
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Allows one to write http plugins in any language for emacs

;;; Code:

(require 'elnode)

(defun eval-string (string)
  "Evaluate elisp code stored in a string."
  (eval (car (read-from-string string))))


(defun eval-handler (httpcon)
  "The main function that handles rpc requests"

  (let ((code (elnode-http-param httpcon "code")))

    (elnode-http-start httpcon 200 '("Content-type" . "application/json"))
    (let ((rv (eval-string code)))
     (elnode-http-return httpcon rv))))

(defun remote-eval-start (port) 
 (elnode-start 'eval-handler :port port :host "localhost"))

