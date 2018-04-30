######
# Jinja Compiler
#   Should specify a filename, and output processed text
#J2=j2
J2=python bin/jj2.py

# Additional j2 flags
J2FLAGS=

# Targets
TFTARGETS=AWS_AMI_MAPS.tf nerdwars_linux.tf network_acl.tf provider.tf security.tf variables.tf vpcs_and_subnets.tf z_nextsteps.tf
SHTARGETS=credentials.sh
SOURCES=$(TFTARGETS:.tf=.j)

all: $(TFTARGETS) $(SHTARGETS)

%.tf: %.j banner.txt variables.include variables.private.include
	$(J2) $(J2FLAGS) $< -o $@.tmp
	cat banner.txt $@.tmp > $@
	rm $@.tmp

%.sh: %.j variables.include variables.private.include
	$(J2) $(J2FLAGS) $< -o $@
	chmod 755 $@

clean:
	-terraform destroy
	-rm $(TFTARGETS)  $(SHTARGETS)
	-rm *.tmp
