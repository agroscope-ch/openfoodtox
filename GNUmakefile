PKGNAME := $(shell sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGVERS := $(shell sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)
TGZ     := $(PKGNAME)_$(PKGVERS).tar.gz
RBIN ?= $(shell dirname "`which R`")

pkgfiles = \
	.Rbuildignore \
	data/* \
	DESCRIPTION \
	inst/dataset_generation/* \
	man/* \
	NAMESPACE \
	NEWS.md \
	README.md \
	R/* \
	vignettes/*.rmd

all: build

$(TGZ): $(pkgfiles)
	"$(RBIN)/R" CMD build . 2>&1 | tee log/build.log

roxy:
	Rscript -e "roxygen2::roxygenize(roclets = c('rd', 'collate', 'namespace'))"

build: roxy $(TGZ)

install: build
	"$(RBIN)/R" CMD INSTALL $(TGZ)

check: roxy build
	_R_CHECK_CRAN_INCOMING_REMOTE_=false "$(RBIN)/R" CMD check --as-cran --no-tests $(TGZ) 2>&1 | tee log/check.log

pd: roxy
	Rscript -e 'pkgdown::build_site(lazy = TRUE, run_dont_run = TRUE)'

pd_all: roxy
	Rscript -e 'pkgdown::build_site(lazy = FALSE, run_dont_run = TRUE)'
