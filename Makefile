
.PHONY: help
help:
	@echo Available commands:
	@echo - benchmark: builds and benchmarks the library
	@echo - clean: deletes all binaries
	@echo - clean-random-benchmark: deletes random benchmark files
	@echo - help: shows this text
	@echo - random-benchmark: builds the library and executes random benchmarks
	@echo - random-benchmark-csv: as random-benchmark, but exports the results in CSV
	@echo - test: builds and executes compliance tests
	@echo - unittest: builds and executes unittests
	@echo - unittest-cov: builds and executes unittest, collecting coverage statistics

.PHONY: benchmark
benchmark:
	dub run -c benchmark -b release

.PHONY: clean
clean:
	dub clean
	$(RM) __test__library__
	$(RM) std-experimental-xml
	$(RM) lib*.a
	$(RM) rm -f ..?*.lst .[!.]*.lst *.lst
	
.PHONY: clean-random-benchmark
clean-random-benchmark:
	$(RM) -f random-benchmark/*.xml

.PHONY: random-benchmark
random-benchmark:
	@dub run -c random-benchmark -b release -q
	
.PHONY: random-benchmark-csv
random-benchmark-csv:
	@dub run -c random-benchmark -b release -q -- csv

.PHONY: test
test:
	dub run -c test -b debug
	
.PHONY: unittest
unittest:
	dub test -b unittest
	
.PHONY: unittest-cov
unittest-cov:
	dub test -b unittest-cov
