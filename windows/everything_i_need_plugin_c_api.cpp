#include "include/everything_i_need/everything_i_need_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "everything_i_need_plugin.h"

void EverythingINeedPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  everything_i_need::EverythingINeedPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
