#ifndef FLUTTER_PLUGIN_EVERYTHING_I_NEED_PLUGIN_H_
#define FLUTTER_PLUGIN_EVERYTHING_I_NEED_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace everything_i_need {

class EverythingINeedPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  EverythingINeedPlugin();

  virtual ~EverythingINeedPlugin();

  // Disallow copy and assign.
  EverythingINeedPlugin(const EverythingINeedPlugin&) = delete;
  EverythingINeedPlugin& operator=(const EverythingINeedPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace everything_i_need

#endif  // FLUTTER_PLUGIN_EVERYTHING_I_NEED_PLUGIN_H_
