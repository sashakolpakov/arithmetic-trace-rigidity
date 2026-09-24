.PHONY: all papers papers-force formal docs check-docs docs-clean \
	check-lean-source check-bibliography check-tex-logs check-links \
	check-pdf-reproducibility check-manifest verify clean

SOURCE_DATE_EPOCH := 1790035200
FORCE_SOURCE_DATE := 1
TZ := UTC
export SOURCE_DATE_EPOCH FORCE_SOURCE_DATE TZ

all: papers formal docs

papers: paper/compact-trace-rigidity.pdf paper/trace-gap-companion.pdf \
	paper/positive-trace-gap.pdf

paper/compact-trace-rigidity.pdf: paper/compact-trace-rigidity.tex \
		paper/biblio.bib .latexmkrc
	latexmk -pdf -interaction=nonstopmode -halt-on-error \
		-outdir=paper paper/compact-trace-rigidity.tex

paper/trace-gap-companion.pdf: paper/trace-gap-companion.tex \
		paper/biblio.bib .latexmkrc
	latexmk -pdf -interaction=nonstopmode -halt-on-error \
		-outdir=paper paper/trace-gap-companion.tex

paper/positive-trace-gap.pdf: paper/positive-trace-gap.tex \
		paper/biblio.bib .latexmkrc
	latexmk -pdf -interaction=nonstopmode -halt-on-error \
		-outdir=paper paper/positive-trace-gap.tex

papers-force:
	latexmk -pdf -gg -interaction=nonstopmode -halt-on-error \
		-outdir=paper paper/compact-trace-rigidity.tex
	latexmk -pdf -gg -interaction=nonstopmode -halt-on-error \
		-outdir=paper paper/trace-gap-companion.tex
	latexmk -pdf -gg -interaction=nonstopmode -halt-on-error \
		-outdir=paper paper/positive-trace-gap.tex

formal:
	cd formal && lake build
	python3 scripts/check_lean_axioms.py

docs:
	sphinx-build -b html -W --keep-going -n docs docs/_build/html

check-docs: docs

check-lean-source:
	python3 scripts/check_lean_source.py

check-bibliography:
	python3 scripts/check_bibliography.py

check-tex-logs: papers-force
	@tex_scan_rc=0; \
	rg -n 'undefined (citations|references)|There were undefined references|Citation .* undefined|Reference .* undefined|multiply[- ]defined|Label\(s\) may have changed|Rerun to get cross-references right|Package hyperref Warning|Missing character|Overfull \\[hv]box' \
		paper/compact-trace-rigidity.log paper/trace-gap-companion.log \
		paper/positive-trace-gap.log || tex_scan_rc=$$?; \
	if [ $$tex_scan_rc -eq 0 ]; then \
		echo 'LaTeX release-log check failed.'; exit 1; \
	elif [ $$tex_scan_rc -eq 1 ]; then \
		echo 'LaTeX release-log check: clean'; \
	else \
		echo 'LaTeX release-log scan could not be completed.'; exit $$tex_scan_rc; \
	fi
	@bib_scan_rc=0; \
	rg -n 'Warning--|error message' paper/compact-trace-rigidity.blg \
		paper/trace-gap-companion.blg paper/positive-trace-gap.blg || bib_scan_rc=$$?; \
	if [ $$bib_scan_rc -eq 0 ]; then \
		echo 'BibTeX release-log check failed.'; exit 1; \
	elif [ $$bib_scan_rc -eq 1 ]; then \
		echo 'BibTeX release-log check: clean'; \
	else \
		echo 'BibTeX release-log scan could not be completed.'; exit $$bib_scan_rc; \
	fi

check-links:
	python3 scripts/check_markdown_links.py

check-pdf-reproducibility: papers-force
	python3 scripts/check_pdf_reproducibility.py

check-manifest: check-pdf-reproducibility
	python3 scripts/check_release_manifest.py

verify: check-lean-source check-bibliography check-tex-logs check-links check-docs \
	check-manifest formal

docs-clean:
	$(RM) -r docs/_build

clean:
	latexmk -c -outdir=paper paper/compact-trace-rigidity.tex
	latexmk -c -outdir=paper paper/trace-gap-companion.tex
	latexmk -c -outdir=paper paper/positive-trace-gap.tex
	$(RM) paper/compact-trace-rigidity.bbl \
		paper/trace-gap-companion.bbl paper/positive-trace-gap.bbl
	$(RM) -r docs/_build
