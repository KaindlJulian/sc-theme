SRC := ./styles
EXTENSION_SRC := ./extension
DIST := ./dist

.PHONY: setup build zip

setup:
	cargo install grass

build:
	@echo 'Remove last build'
	@rm -rf $(DIST)
	@rm -f latest_build.zip
	@mkdir $(DIST)
	@echo 'Copy extension files'
	@cp -r $(EXTENSION_SRC)/* $(DIST)
	@echo 'Build theme.css'
	@grass $(SRC)/theme.scss $(DIST)/theme.css

zip:
	@echo 'Remove last build'
	@rm -rf $(DIST)
	@rm -f latest_build.zip
	@mkdir $(DIST)
	@echo 'Copy extension files'
	@cp -r $(EXTENSION_SRC)/* $(DIST)
	@echo 'Build theme.css'
	@grass $(SRC)/theme.scss $(DIST)/theme.css
	@echo 'Zipping build for upload'
	@zip -r -X theme.zip dist/*
	@echo 'Done!'
