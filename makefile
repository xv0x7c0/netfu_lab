xr_yml:=$(wildcard yml/xr*.yml)
xe_yml:=$(wildcard yml/xe*.yml)

define generate
  for file in $(1) ; do \
    filename=$$(basename $$file .yml); \
    echo ":: generating config for $$filename" ; \
		cfgtemplater -y yml/defaults.yml -y $$file $(2) > out/$$filename.txt; \
  done
endef


all: clean xr xe

xr:
	$(call generate,$(xr_yml),tpl/xr.j2)

xe:
	$(call generate,$(xe_yml),tpl/xe.j2)

clean:
	rm -f out/*
