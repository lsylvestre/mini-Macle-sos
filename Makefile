CAMLC=ocamlc
CAMLLEX=ocamllex
CAMLDEP=ocamldep

EXE=interp

INCLUDES=

MENHIR=menhir --unused-tokens --unused-precedence-levels --infer --ocamlc "$(CAMLC) -i $(INCLUDES)"

OBJS= prelude.cmo ast.cmo interp.cmo parser.cmo lexer.cmo main.cmo

SRCS=`find . -name "*.ml*"`

all: parser.cmi $(OBJS)
	$(CAMLC) $(FLAGS) $(INCLUDES) -o $(EXE) $(OBJS)

.SUFFIXES: .mll .mly .ml .mli .cmo .cmi

.ml.cmo:
	$(CAMLC) $(INCLUDES) $(FLAGS) -c $<

.mli.cmi:
	$(CAMLC) $(INCLUDES) $(FLAGS) -c $<

.mly.ml:
	$(MENHIR) $<

.mll.ml:
	$(CAMLLEX) $<

depend:
	$(CAMLDEP) $(INCLUDES) $(SRCS) > .depend
	menhir --depend parser.mly >> .depend

include .depend

clean:
	rm -f `find . -name "*.cmo"`
	rm -f `find . -name "*.cmi"`
	rm -f $(EXE)

