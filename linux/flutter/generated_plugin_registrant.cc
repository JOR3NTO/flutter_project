//
//  Generated file. Do not edit.
//

// clang-format off

// Forward declaration to avoid include path issues in editors/configurations where
// the generated header is not resolvable; the definition of FlPluginRegistry is
// not needed here because it is used only as an opaque pointer.
typedef struct _FlPluginRegistry FlPluginRegistry;

#include <flutter_secure_storage_linux/flutter_secure_storage_linux_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_secure_storage_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterSecureStorageLinuxPlugin");
  flutter_secure_storage_linux_plugin_register_with_registrar(flutter_secure_storage_linux_registrar);
}
