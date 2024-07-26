#include "pch.h"
#include "Window.h"

#ifdef PLATFORM_MACOS
	#include "WindowsWindow.h"
#endif

Scope<Window> Window::Create(const WindowProps& props)
{
//#ifdef PLATFORM_MACOS
  return CreateScope<WindowsWindow>(props);
// #else
//   HZ_CORE_ASSERT(false, "Unknown platform!");
//   return nullptr;
// #endif

}
