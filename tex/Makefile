RM = /bin/rm -f
DVIPS = dvips -Ppdf # The -Ppdf option includes fonts but can screw up on
                    # included graphics.  Use with extreme prejudice.
PS2PDF = ps2pdf
MP2EPS = mp2eps

.SUFFIXES: .tex .dvi .ps .pdf .mp .eps

ALLFIGURES = dc_circuit1.eps dc_circuit2.eps dc_circuit3.eps \
	dc_circuit4.eps dc_circuit5.eps dc_circuit6.eps \
	final1.eps final2.eps final3.eps

all: $(patsubst %.tex,%.pdf,$(wildcard physics2_*.tex))

.tex.pdf:
	pdflatex $*

dc_circuit1.eps: dc_circuit.mp
	$(MP2EPS) -s 1 -o dc_circuit1.eps dc_circuit

dc_circuit2.eps: dc_circuit.mp
	$(MP2EPS) -s 2 -o dc_circuit2.eps dc_circuit

dc_circuit3.eps: dc_circuit.mp
	$(MP2EPS) -s 3 -o dc_circuit3.eps dc_circuit

dc_circuit4.eps: dc_circuit.mp
	$(MP2EPS) -s 4 -o dc_circuit4.eps dc_circuit

dc_circuit5.eps: dc_circuit.mp
	$(MP2EPS) -s 5 -o dc_circuit5.eps dc_circuit

dc_circuit6.eps: dc_circuit.mp
	$(MP2EPS) -s 6 -o dc_circuit6.eps dc_circuit

final1.eps: final.mp
	$(MP2EPS) -s 1 -o final1.eps final

final2.eps: final.mp
	$(MP2EPS) -s 2 -o final2.eps final

final3.eps: final.mp
	$(MP2EPS) -s 3 -o final3.eps final

clean:
	$(RM) *.log *.aux *.dvi *.toc *.bbl *.blg *.[1-9] *.mpx

spotless: clean
	$(RM) *.pdf *.eps
