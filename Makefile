output/slides.pdf: slides.tex
	# you need to run pdflatex command twice if you're having issues 
	# getting TOC or top progress bar to show up in resulting pdf
	mkdir -p output
	xelatex -shell-escape --aux-directory=output --output-directory=output slides.tex

full-slides: slides.tex contents.tex
	mkdir -p output
	xelatex -shell-escape --aux-directory=output --output-directory=output slides.tex
	xelatex -shell-escape --aux-directory=output --output-directory=output slides.tex
	cd output; bibtex slides
	xelatex -shell-escape --aux-directory=output --output-directory=output slides.tex

handout23:
	cp output/slides.pdf RCP216-ReseauxSociaux3.pdf
	pdfjam --batch --nup 2x3 RCP216-ReseauxSociaux3.pdf --offset ".25cm .25cm" --delta ".25cm .5cm" --frame true --scale 0.9 --no-landscape --outfile RCP216-ReseauxSociaux3_handout2x3.pdf

latexmk:
	mkdir -p output
	latexmk -xelatex -shell-escape -output-directory=output -auxdir=output slides.tex

clean:
	rm -rf output *.aux *.log *.nav *.out *.snm *.toc *.vrb
