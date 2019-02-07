#
# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install WebViewGoogle in place of webview and stock browser apk.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Chrome
LOCAL_OVERRIDES_PACKAGES := Browser
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := app/Chrome/Chrome.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_PREBUILT_JNI_LIBS := app/Chrome/lib/arm/libchrome.so app/Chrome/lib/arm/libchromium_android_linker.so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := WebViewGoogle
LOCAL_OVERRIDES_PACKAGES := webview
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := $(DEFAULT_SYSTEM_DEV_CERTIFICATE)
LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support

LOCAL_MODULE_TARGET_ARCH := arm
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := app/WebViewGoogle/WebViewGoogle.apk
LOCAL_PREBUILT_JNI_LIBS := app/WebViewGoogle/lib/arm/libwebviewchromium.so
include $(BUILD_PREBUILT)
