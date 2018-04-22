DIRS := sub2 sub1

SETUPDIRS := $(DIRS:%=setup-%)
RUNDIRS := $(DIRS:%=run-%)

dirs: $(DIRS)
     
$(DIRS):
	$(MAKE) -C $@

setup: $(SETUPDIRS)

$(SETUPDIRS):
	$(MAKE) -C $(@:setup-%=%) setup

run: $(RUNDIRS)

$(RUNDIRS):
	$(MAKE) -C $(@:run-%=%) run

sub1: sub2

.PHONY: dirs $(DIRS)
.PHONY: dirs $(RUNDIRS)
.PHONY: dirs $(SETUPDIRS)
.PHONY: run setup
