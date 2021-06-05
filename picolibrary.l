(de include List
	(de _directory? (Path) (=T (car (info Path))))
	(de _include (List)		
		(for L List
			 (let (Path (pack (pwd) *LibraryDir "/.modules/" L))
			   (if (_directory? Path)
				   (_include (mapcar '((F) (pack L '/ F)) (dir Path)))
				 (load Path)))))
	(_include List))
