# This makefile is used to generate the vendor bundle needed by
# image_generation_tool to generate boot and vbmeta images.

IMAGE_GEN_TOOL := out/host/linux-x86/bin/image_generation_tool
IMAGE_GEN_TOOL_VERSION := 1.0

VENDOR_BUNDLE_DEPS := \
  $(PRODUCT_OUT)/vendor.img \
  $(PRODUCT_OUT)/misc_info.txt \
  $(IMAGE_GEN_TOOL)

.PHONY: generate_vendor_bundle
generate_vendor_bundle: $(VENDOR_BUNDLE_DEPS)
	python $(IMAGE_GEN_TOOL) generate_vendor_bundle --tool_version $(IMAGE_GEN_TOOL_VERSION)

ifeq ($(filter $(TARGET_BOARD_PLATFORM), taro),$(TARGET_BOARD_PLATFORM))
ifeq ($(BOARD_AVB_ENABLE),true)
droidcore:generate_vendor_bundle
endif
endif