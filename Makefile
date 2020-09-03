DCK_IMG = jsacrist/jekyll/minimal-mistakes


.PHONY: executable clean build-base build all

executable:
	find . -iname "*.sh" -exec sed -i $$'s/\r$$//' {} \;
	find . -iname "*.sh" -exec chmod +x {} \;

clean:
	rm -rf "./minimal-mistakes/"

minimal-mistakes: 
	@echo "cloning repositor 'minimal-mistakes'"
	$(shell ./download-minimal-mistakes.sh)

build-base: minimal-mistakes
	$(eval MM_VER := $(shell cd "minimal-mistakes"; git describe --tags))
	@echo "Building ${DCK_IMG}-base version" ${MM_VER}
	docker build -f ./base.Dockerfile -t "${DCK_IMG}-base:${MM_VER}" -t "${DCK_IMG}-base" .

build :
	$(eval MM_VER := $(shell cd "minimal-mistakes"; git describe --tags))
	@echo "Building ${DCK_IMG} version" ${MM_VER}
	docker build -f Dockerfile -t ${DCK_IMG}:${MM_VER} -t ${DCK_IMG} .

	
all: executable clean minimal-mistakes build-base build
