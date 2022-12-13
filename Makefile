convert_notes:
	@echo "Converting notes (md) to pdf..."
	pandoc data/presentation/notes.md -o data/presentation/notes.pdf --from markdown --template eisvogel --listings -V colorlinks -V geometry:"top=2cm, bottom=2cm, left=2cm, right=2cm" -s
